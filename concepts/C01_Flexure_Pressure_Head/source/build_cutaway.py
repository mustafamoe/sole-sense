"""R04-based educational cutaway; concept geometry, not production CAD or FEA."""
import bpy, math, json, sys
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view

OUT=Path(__file__).resolve().parents[1]
R04=OUT.parents[1]/'revisions/R04'
W,H,FPS,DURATION=1440,900,24,16
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='C01 - flexure pressure head concept'
s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=24
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.image_settings.file_format='PNG';s.render.image_settings.color_mode='RGB'
s.render.image_settings.compression=20;s.render.fps=FPS;s.frame_start=1;s.frame_end=FPS*DURATION
s.view_settings.view_transform='Standard';s.view_settings.look='None'
s.world.color=(.55,.55,.55)

def mat(name,c,metal=0,emission=False):
 m=bpy.data.materials.new(name);m.diffuse_color=(*c,1);m.use_nodes=True
 bs=m.node_tree.nodes.get('Principled BSDF');bs.inputs['Base Color'].default_value=(*c,1)
 bs.inputs['Metallic'].default_value=metal;bs.inputs['Roughness'].default_value=.44
 if emission:
  bs.inputs['Emission Color'].default_value=(*c,1);bs.inputs['Emission Strength'].default_value=1
  bs.inputs['Base Color'].default_value=(0,0,0,1)
 return m
shellmat=mat('Warm grey shell',(.64,.72,.73));teal=mat('Flexible metal - teal highlight',(.015,.48,.37),.25)
ringmat=mat('Fixed support rings',(.015,.19,.20),.25);blue=mat('Moving holder',(.045,.26,.50),.25)
gold=mat('Replaceable cartridge',(.73,.35,.065),.25);purple=mat('Sensor placeholder',(.34,.14,.54),.15)
steel=mat('Hardware',(.25,.31,.34),.5);pink=mat('Contact surface',(.71,.39,.32))
ink=mat('UI ink',(.015,.045,.065),emission=True);muted=mat('UI secondary',(.18,.25,.29),emission=True)
paper=mat('UI paper',(.96,.97,.96),emission=True);accent=mat('UI teal',(.01,.34,.27),emission=True)
amber=mat('UI gold',(.57,.24,.035),emission=True)

def cube(name,loc,size,m=None,bevel=0):
 bpy.ops.mesh.primitive_cube_add(size=1,location=loc);o=bpy.context.object;o.name=name;o.dimensions=size
 bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
 if m:o.data.materials.append(m)
 if bevel:
  b=o.modifiers.new('Edge highlights','BEVEL');b.width=bevel;b.segments=3
 return o
def cyl(name,x,r,length,m=None):
 bpy.ops.mesh.primitive_cylinder_add(vertices=80,radius=r,depth=length,location=(x,0,0),rotation=(0,math.pi/2,0))
 o=bpy.context.object;o.name=name
 bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
 if m:o.data.materials.append(m)
 return o
def boolean(o,cutter):
 bpy.context.view_layer.objects.active=o
 m=o.modifiers.new('Concept section','BOOLEAN');m.operation='DIFFERENCE';m.solver='EXACT';m.object=cutter
 bpy.ops.object.modifier_apply(modifier=m.name);bpy.data.objects.remove(cutter,do_unlink=True)
def ring(name,x,outer,inner,thick,m):
 verts=[];faces=[];N=96
 for dx,r in [(-thick/2,outer),(-thick/2,inner),(thick/2,outer),(thick/2,inner)]:
  for i in range(N):
   a=math.tau*i/N;verts.append((x+dx,r*math.cos(a),r*math.sin(a)))
 for i in range(N):
  j=(i+1)%N
  faces.extend([(i,j,N+j,N+i),(2*N+i,3*N+i,3*N+j,2*N+j),(i,2*N+i,2*N+j,j),(N+i,N+j,3*N+j,3*N+i)])
 me=bpy.data.meshes.new(name);me.from_pydata(verts,[],faces);me.update()
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);me.materials.append(m);return o

# Preserve the recognizable R04 outer shell and cartridge; hollow the concept chamber.
manifest=json.loads((R04/'source/assembly_manifest.json').read_text())
imported={}
for d in manifest:
 if d['name'] not in ['07_Pressure_Head_Body','35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated']:continue
 bpy.ops.wm.stl_import(filepath=str(R04/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];imported[o.name]=o
 o.data.materials.append(shellmat if o.name.startswith('07') else gold)
shell=imported['07_Pressure_Head_Body']
# A conical chamber replaces the passive rigid socket; visualization only.
bpy.ops.mesh.primitive_cone_add(vertices=96,radius1=22,radius2=8.7,depth=30,location=(168.5,0,0),rotation=(0,math.pi/2,0))
boolean(shell,bpy.context.object)
boolean(shell,cube('Remove camera-facing half',(170,-40,0),(100,80,100)))
shell['note']='R04 outer shell, concept chamber and viewing cut only. Not validated for manufacturing.'

# Rear fixed sensor mount; sensor is deliberately generic and identified as a placeholder.
rear=ring('Rear fixed mounting shoulder',155.7,20,7,1.3,shellmat)
boolean(rear,cube('Cut mounting shoulder',(156,-35,0),(10,70,70)))
sensor=cube('Force sensor envelope - unselected',(160.2,0,0),(7,12,12),purple,.7)
sensor['note']='Unselected sensor envelope. Actual device, stroke, mounting and range unresolved.'
cap=cyl('Sensor contact face',164.4,3.7,1,steel)
moving=[]
rod=cyl('Moving axial force-transfer stem',169.5,2.3,10,blue);moving.append(rod)
holder=ring('Moving cartridge receiver',178.2,7.5,5.2,10.4,blue);moving.append(holder)
bridge=cyl('Receiver closed rear web',173.1,7.5,.8,blue);moving.append(bridge)
moving.extend([imported['35_Replaceable_Filament_Cartridge'],imported['REF_Exposed_Nylon_Uncalibrated'],cap])

# Two spaced flexure plates guide axial translation. Outer rings stay fixed.
flexkeys=[];rings=[]
for index,(x,outer) in enumerate([(166.8,14.4),(170.9,12.1)]):
 rings.append(ring(f'Fixed outer ring {index+1}',x,outer,outer-1.5,1.1,ringmat))
 hub=ring(f'Moving inner hub {index+1}',x,4.1,2.3,1.1,teal);moving.append(hub)
 for arm in range(4):
  verts=[];faces=[];N=32
  for i in range(N+1):
   u=i/N;r=(outer-1.1)*(1-u)+3.8*u;a=arm*math.pi/2+math.radians(65)*u
   # Curved leaf cut from a thin metal sheet, bending out of its plane.
   for dx,w in [(-.14,-.63),(-.14,.63),(.14,.63),(.14,-.63)]:
    verts.append((x+dx,r*math.cos(a)-w*math.sin(a),r*math.sin(a)+w*math.cos(a)))
  for i in range(N):
   for j in range(4):faces.append((4*i+j,4*i+(j+1)%4,4*(i+1)+(j+1)%4,4*(i+1)+j))
  faces.extend([(0,3,2,1),(4*N,4*N+1,4*N+2,4*N+3)])
  me=bpy.data.meshes.new('Curved flexure leaf');me.from_pydata(verts,[],faces);me.update()
  o=bpy.data.objects.new(f'Flexure {index+1} leaf {arm+1}',me);s.collection.objects.link(o);me.materials.append(teal)
  o.shape_key_add(name='Relaxed');key=o.shape_key_add(name='Exaggerated axial bend')
  for i,p in enumerate(key.data):
   u=(i//4)/N;p.co.x-=1.8*(u*u*(3-2*u))
  flexkeys.append(key)
  o['note']='Prescribed visual deformation, not FEA. Thickness and motion are not a manufacturing specification.'

# Small fixed mounting feet connect the rings to the shell.
for index,(x,outer) in enumerate([(166.8,14.4),(170.9,12.1)]):
 for sign in [-1,1]:
  cube(f'Fixed mount {index}-{sign}',(x,1.7,sign*(outer+1.1)),(2.4,3.4,3.2),shellmat,.2)

# Stops catch the moving receiver flange under overload. They are not force regulators.
stop1=cube('Lower travel stop',(170.3,0,-6.4),(1.3,5,2.2),steel,.2)
stop2=cube('Upper travel stop',(170.3,0,6.4),(1.3,5,2.2),steel,.2)
surface=cube('Schematic contact surface',(227.2,0,0),(3,31,31),pink,1.2)

# Studio, camera and typography all render inside Blender.
floor=cube('Studio backdrop',(183,0,-33),(600,600,.5),mat('Backdrop',(.86,.89,.88)))
for name,loc,power,size in [('Key',(175,-130,200),420000,160),('Fill',(160,100,130),220000,150),('Rim',(240,20,100),180000,100)]:
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=name;o.data.energy=power;o.data.size=size
 o.rotation_euler=(Vector((179,0,0))-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.object.camera_add(location=(224,-260,142));cam=bpy.context.object;s.camera=cam;cam.data.type='ORTHO';cam.data.clip_start=.1;cam.data.clip_end=2000
ui=bpy.data.objects.new('Camera labels',None);s.collection.objects.link(ui);ui.parent=cam
REF=140;U=REF/W
font=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial.ttf');bold=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial Bold.ttf')
def text(name,body,x,y,size,m=ink,b=False):
 cu=bpy.data.curves.new(name,'FONT');cu.body=body;cu.size=size*U;cu.font=bold if b else font;cu.align_y='TOP'
 o=bpy.data.objects.new(name,cu);s.collection.objects.link(o);o.parent=ui;o.location=((x-W/2)*U,(H/2-y)*U,-4)
 cu.materials.append(m);return o
def panel(name,x,y,w,h,m=paper):
 me=bpy.data.meshes.new(name);me.from_pydata([((xx-W/2)*U,(H/2-yy)*U,-5) for xx,yy in [(x,y),(x+w,y),(x+w,y+h),(x,y+h)]],[],[(0,1,2,3)])
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);o.parent=ui;me.materials.append(m);return o
panel('Header',0,0,W,124);panel('Footer',0,728,W,172)
text('Kicker','SOLESENSE   /   PRESSURE HEAD   /   FLEXURE CONCEPT C01',42,23,17,accent,True)
text('Title','A cartridge holder that moves by bending',42,51,38,ink,True)
text('Subtitle','R04 shell shown cut open. New internal parts are a proposed arrangement.',42,98,18,muted)
text('Footer note','CONCEPT ONLY  •  Motion enlarged; sensor is a placeholder. No calibrated force values are shown.',42,864,16,muted)
text('Legend','TEAL  flexible leaves     BLUE  moving holder     GOLD  replaceable cartridge     PURPLE  sensor',42,827,18,muted,True)
push_label=text('Push cue','CONTACT FORCE',945,360,17,amber,True)
me=bpy.data.meshes.new('Push arrow')
me.from_pydata([((x-W/2)*U,(H/2-y)*U,-4) for x,y in [(922,401),(950,385),(950,396),(1085,396),(1085,406),(950,406),(950,417)]],[],[(0,1,2,3,4,5,6)])
push_arrow=bpy.data.objects.new('Push arrow',me);s.collection.objects.link(push_arrow);push_arrow.parent=ui;me.materials.append(amber)

chapters=[
 (0,4,'01  /  INSIDE THE HEAD','Two flexure plates support the cartridge holder.','Their outer rings attach to the head; the centres can move along the filament axis.'),
 (4,9,'02  /  PRESS','Contact pushes the cartridge and holder backwards.','The teal leaves bend. The purple sensor responds to the load through the central stem.'),
 (9,12,'03  /  RELEASE','Lift away and the flexures return the holder.','There is no sliding bearing in this proposed guide.'),
 (12,16,'04  /  CLOSE-UP','Two spaced plates help keep the holder aligned.','The cartridge still twists out for replacement; the internal flexures stay in the head.')]
texts=[]
for i,(a,b,k,title,caption) in enumerate(chapters):
 texts.append([text('Step '+str(i),k,42,744,16,accent,True),text('Action '+str(i),title,42,769,29,ink,True),text('Detail '+str(i),caption,42,805,17,muted)])

labels=[]
def callout(body,x,y,target,colour=ink):
 o=text('Label '+body,body,x,y,18,colour,True)
 me=bpy.data.meshes.new('Leader '+body);me.from_pydata([(0,0,0)]*4,[],[(0,1,2,3)])
 line=bpy.data.objects.new('Leader '+body,me);s.collection.objects.link(line);line.parent=ui;me.materials.append(colour)
 labels.append((o,line,x,y,target));return o
callout('Fixed shell',100,170,(158,10,21))
callout('Sensor position',100,632,(160,-6,2))
callout('Flexible leaves',470,170,(166.8,-5,9),accent)
callout('Moving holder',595,632,(177,-7,0))
callout('Replaceable hub',1000,170,(184.8,0,8),amber)
callout('Nylon filament',1090,632,(207,0,0),amber)

def ease(t,a,b):
 u=max(0,min(1,(t-a)/(b-a)));return u*u*(3-2*u)
def show(o,value,f):o.hide_render=not value;o.keyframe_insert('hide_render',frame=f)
def camera(pos,target,scale,f):
 cam.location=pos;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale
 cam.keyframe_insert('location',frame=f);cam.keyframe_insert('rotation_euler',frame=f);cam.data.keyframe_insert('ortho_scale',frame=f)
 ui.scale=(scale/REF,)*3;ui.keyframe_insert('scale',frame=f)
def leader(line,x,y,point):
 p=world_to_camera_view(s,cam,Vector(point));sx=p.x*W;sy=(1-p.y)*H
 ax=x+65;ay=y+24;dx=sx-ax;dy=sy-ay;length=max(1,math.hypot(dx,dy));nx=-dy/length*.65;ny=dx/length*.65
 coords=[(ax+nx,ay+ny),(ax-nx,ay-ny),(sx-nx,sy-ny),(sx+nx,sy+ny)]
 for v,(px,py) in zip(line.data.vertices,coords):v.co=((px-W/2)*U,(H/2-py)*U,-4.2)
 # A shape key for every frame would be excessive; leaders follow static view per shot.

# Fixed cutaway shot for 12 seconds; close-up uses a new set of visible labels.
close_title=text('Closeup label','Flexible arms connect a fixed ring to a moving centre.',180,167,23,accent,True)
close_note=text('Closeup note','METAL FLEXURE CONCEPT  /  shape and thickness still to be engineered',180,662,17,muted)
moving_origins={o.name:o.location.copy() for o in moving}
for f in range(1,s.frame_end+1):
 t=(f-1)/FPS
 q=ease(t,4.4,6.5)*(1-ease(t,9.2,11.2))
 if t>=12:q=.75*(.5-.5*math.cos(math.tau*(t-12)/3.8))
 for o in moving:o.location.x=moving_origins[o.name].x-1.8*q;o.keyframe_insert('location',frame=f)
 # Skin approaches while the handle is the stationary reference. No force magnitude is implied.
 surface.location.x=227.2-(1.3+1.8*q)*ease(t,3.5,4.4)+4*ease(t,9.2,11.2);surface.keyframe_insert('location',frame=f)
 for key in flexkeys:key.value=q;key.keyframe_insert('value',frame=f)
 if t<12:
  camera((224,-260,142),(184,0,-1),140,f)
 else:
  camera((95,-90,57),(169.5,0,0),85,f)
 s.frame_set(f);bpy.context.view_layer.update()
 for ci,(a,b,*_) in enumerate(chapters):
  for o in texts[ci]:show(o,a<=t<b,f)
 for o,line,x,y,p in labels:
  show(o,t<12,f);show(line,t<12,f)
  if f==1:leader(line,x,y,p)
 show(close_title,t>=12,f);show(close_note,t>=12,f)
 show(push_label,4.4<=t<9.2,f);show(push_arrow,4.4<=t<9.2,f)
 show(surface,t<12,f);show(shell,t<12,f);show(rear,t<12,f)
 # Close-up isolates the flexures, receiver and stem to reveal their construction.
 show(sensor,t<12,f);show(cap,t<12,f)
 show(imported['35_Replaceable_Filament_Cartridge'],t<12,f)
 show(imported['REF_Exposed_Nylon_Uncalibrated'],t<12,f)
for action in bpy.data.actions:
 for layer in action.layers:
  for strip in layer.strips:
   if strip.type=='KEYFRAME':
    for bag in strip.channelbags:
     for fc in bag.fcurves:
      for k in fc.keyframe_points:k.interpolation='LINEAR'
for a,b,k,title,caption in chapters:s.timeline_markers.new(title,frame=int(a*FPS)+1)
note=bpy.data.texts.new('READ ME - concept limitations')
note.write('C01 educational concept based on the R04 outer shell and cartridge. Original R04 CAD is unchanged.\nTwo flexure plates guide a floating cartridge receiver. Outer rings are fixed to housing; central hubs move.\nThe flexures and sensor create parallel force paths: F_tip = F_sensor + F_flexures (plus gravity and any other contact loads). Calibrate the complete assembly; a bare sensor calibration is insufficient. No accuracy at 1/10/75 gf is established.\nSensor is an unselected envelope, not the Phidgets or FUTEK geometry. Motion is prescribed and enlarged, not physical simulation. No stiffness, stress, fatigue or clearance qualification.\nThe rigid R04 cartridge socket must be replaced with the floating receiver. Twist removal needs a carrier anti-rotation feature that bypasses fragile leaves; it is not engineered here.\nStops protect travel only, not skin force after bottoming. Sealing, cleanability, wire forces, gravity/orientation, electrical contacts and final fit remain to be engineered.\n')
s.frame_set(1);bpy.ops.file.pack_all()
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_C01_Flexure_Concept.blend'))
(OUT/'source/storyboard.json').write_text(json.dumps({'fps':FPS,'duration':DURATION,'resolution':[W,H],'chapters':chapters,'visual_displacement_mm':1.8,'calibrated_force':False},indent=2))
args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
if '--preview' in args:
 for f,name in [(1,'01_Cutaway'),(169,'02_Pressed'),(337,'03_Flexure_Closeup')]:
  s.frame_set(f);s.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True)
if '--render' in args:
 (OUT/'video/frames').mkdir(exist_ok=True);s.render.filepath=str(OUT/'video/frames/frame_');bpy.ops.render.render(animation=True)
print('C01_READY',flush=True)
