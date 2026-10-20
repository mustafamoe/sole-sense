"""Photo-based Kuuleyn beam integration study. Not dimensioned production CAD."""
import bpy, math, json, sys, shutil
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view

OUT=Path(__file__).resolve().parents[1]
R04=OUT.parents[1]/'revisions/R04'
W,H,FPS,DURATION=1440,900,24,12
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='C02 - Kuuleyn 100 g photo-based concept'
s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=48
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.image_settings.file_format='PNG';s.render.image_settings.color_mode='RGB'
s.render.image_settings.compression=20;s.render.fps=FPS;s.frame_start=1;s.frame_end=FPS*DURATION
s.view_settings.view_transform='Standard';s.view_settings.look='None';s.world.color=(.55,.55,.55)

def mat(name,c,metal=0,emission=False):
 m=bpy.data.materials.new(name);m.diffuse_color=(*c,1);m.use_nodes=True
 bs=m.node_tree.nodes.get('Principled BSDF');bs.inputs['Base Color'].default_value=(*c,1)
 bs.inputs['Metallic'].default_value=metal;bs.inputs['Roughness'].default_value=.38
 if emission:
  bs.inputs['Emission Color'].default_value=(*c,1);bs.inputs['Emission Strength'].default_value=1
  bs.inputs['Base Color'].default_value=(0,0,0,1)
 return m
shellmat=mat('Warm grey shell',(.64,.72,.73));teal=mat('Existing locking collar',(.015,.32,.28),.15)
blue=mat('Rigid force-transfer bracket',(.035,.25,.53),.35);gold=mat('Replaceable cartridge',(.73,.35,.065),.25)
aluminium=mat('Kuuleyn machined aluminium',(.64,.67,.68),.65)
steel=mat('Mounting screws',(.15,.20,.23),.7);white=mat('White gauge protection',(.9,.9,.87))
pink=mat('Contact surface',(.71,.39,.32));fixedmat=mat('Fixed mounting boss',(.10,.26,.27),.2)
ink=mat('UI ink',(.015,.045,.065),emission=True);muted=mat('UI secondary',(.18,.25,.29),emission=True)
paper=mat('UI paper',(.96,.97,.96),emission=True);accent=mat('UI teal',(.01,.34,.27),emission=True)
amber=mat('UI gold',(.57,.24,.035),emission=True);blueink=mat('UI blue',(.015,.20,.43),emission=True)

def cube(name,loc,size,m=None,bevel=0):
 bpy.ops.mesh.primitive_cube_add(size=1,location=loc);o=bpy.context.object;o.name=name;o.dimensions=size
 bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
 if m:o.data.materials.append(m)
 if bevel:
  b=o.modifiers.new('Edge highlights','BEVEL');b.width=bevel;b.segments=3
 return o
def cyl(name,x,r,length,m=None):
 bpy.ops.mesh.primitive_cylinder_add(vertices=64,radius=r,depth=length,location=(x,0,0),rotation=(0,math.pi/2,0))
 o=bpy.context.object;o.name=name;bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
 if m:o.data.materials.append(m)
 return o
def boolean(o,cutter):
 bpy.context.view_layer.objects.active=o
 m=o.modifiers.new('Machining or section','BOOLEAN');m.operation='DIFFERENCE';m.solver='EXACT';m.object=cutter
 bpy.ops.object.modifier_apply(modifier=m.name);bpy.data.objects.remove(cutter,do_unlink=True)
def revolved(name,profile,m):
 verts=[];faces=[];N=96
 for x,r in profile:
  for i in range(N):
   a=math.tau*i/N;verts.append((x,r*math.cos(a),r*math.sin(a)))
 for k in range(len(profile)):
  kk=(k+1)%len(profile)
  for i in range(N):
   j=(i+1)%N;faces.append((k*N+i,k*N+j,kk*N+j,kk*N+i))
 me=bpy.data.meshes.new(name);me.from_pydata(verts,[],faces);me.update()
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);me.materials.append(m);return o
def ring(name,x,ro,ri,t,m):
 return revolved(name,[(x-t/2,ro),(x+t/2,ro),(x+t/2,ri),(x-t/2,ri)],m)
def curve(name,pts,r,m):
 cu=bpy.data.curves.new(name,'CURVE');cu.dimensions='3D';cu.resolution_u=16;cu.bevel_depth=r;cu.bevel_resolution=3
 sp=cu.splines.new('BEZIER');sp.bezier_points.add(len(pts)-1)
 for b,p in zip(sp.bezier_points,pts):b.co=p;b.handle_left_type='AUTO';b.handle_right_type='AUTO'
 o=bpy.data.objects.new(name,cu);s.collection.objects.link(o);cu.materials.append(m);return o

manifest=json.loads((R04/'source/assembly_manifest.json').read_text());imported={}
wanted=['07_Pressure_Head_Body','35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated','33_Captive_Collar_Right','40_Captive_Collar_Left']
for d in manifest:
 if d['name'] not in wanted:continue
 bpy.ops.wm.stl_import(filepath=str(R04/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];imported[o.name]=o
 o.data.materials.append(shellmat if o.name.startswith('07') else teal if 'Collar' in o.name else gold)
shellrear=imported['07_Pressure_Head_Body'];boolean(shellrear,cube('Remove original front',(211,0,0),(100.4,100,100)))
shellparts=[shellrear,imported['33_Captive_Collar_Right'],imported['40_Captive_Collar_Left']]
for o in shellparts:boolean(o,cube('Cut camera-facing shell half',(180,-50,0),(150,100,130)))
shell=revolved('Proposed longer pressure housing',[(160.8,27),(162.8,29),(181,29),(196,12),(196,8.8),(180,26.5),(163.2,26.5),(160.8,24.5)],shellmat)
boolean(shell,cube('Cut camera-facing new housing half',(180,-50,0),(150,100,130)));shellparts.append(shell)
shell['note']='Proposed 58 mm shoulder diameter and 13 mm longer nose. Provisional sensor fit.'
for n in ['35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated']:imported[n].location.x+=15

# Photo features: slotted parallel beam, two end holes at each end, white gauge cover and four wires.
# A 47 x 12 x 6 mm bounding envelope is assumed for this study; no verified manufacturer drawing found.
beam=cube('Kuuleyn 100 g - photo-based beam',(166,0,0),(6,12,47),aluminium)
for x in [162.7,169.3]:boolean(beam,cube('Central waist',(x,0,0),(1.8,16,35)))
for z in [-11.5,11.5]:
 bpy.ops.mesh.primitive_cylinder_add(vertices=64,radius=1.8,depth=16,location=(166,0,z),rotation=(math.pi/2,0,0))
 boolean(beam,bpy.context.object)
boolean(beam,cube('Slot linking relief holes',(166,0,0),(1.05,16,23)))
for z in [-20.5,20.5]:
 for y in [-4,4]:
  cut=cyl('Provisional mounting hole',166,1.1,10);cut.location.y=y;cut.location.z=z;boolean(beam,cut)
bev=beam.modifiers.new('Machined edge highlights','BEVEL');bev.width=.10;bev.segments=2
beam['note']='Visual reconstruction of Kuuleyn B0B4SK7MWK photographs, not manufacturer CAD. All dimensions and screw sizes are provisional.'
beam.shape_key_add(name='Unloaded');bend=beam.shape_key_add(name='Enlarged elastic movement')
for p in bend.data:
 u=max(0,min(1,(p.co.z+17.5)/35));p.co.x-=1.2*u*u*(3-2*u)
potting=cube('White strain-gauge protection',(168.55,0,0),(.4,9,10),white,.35)
# Cover follows the midpoint of the illustrated bending beam.
potting.shape_key_add(name='Unloaded');potbend=potting.shape_key_add(name='Enlarged elastic movement')
for p in potbend.data:
 u=max(0,min(1,(p.co.z+17.5)/35));p.co.x-=1.2*u*u*(3-2*u)

fixed=cube('Fixed wired-end mounting boss',(160.5,0,-22),(5,16,10),fixedmat,.4)
moving=[]
for z,group in [(-20.5,'Fixed'),(20.5,'Loaded')]:
 for y in [-4,4]:
  o=cyl(group+' end screw',172.6 if group=='Loaded' else 169.6,1.65,1.2,steel);o.location.y=y;o.location.z=z
  # Recess gives the screw heads a recognizable mechanical appearance.
  slot=cube('Screw head slot',(o.location.x+.4,y,z),(1.0,.6,2.3));boolean(o,slot)
  if group=='Loaded':moving.append(o)
mount=cube('Moving bracket bolted to loaded end',(170.5,0,20.5),(3,12,7),blue,.35);moving.append(mount)
moving.append(cube('Bracket upper bridge',(175.7,0,20.5),(7.5,4.5,4),blue,.4))
moving.append(cube('Bracket vertical arm',(180.5,0,10.3),(4,9,24.6),blue,.5))
stem=cyl('Bracket to cartridge stem',186,3.5,11,blue);moving.append(stem)
holder=ring('Floating cartridge receiver',194.6,7.5,5.2,7.6,blue);moving.append(holder)
web=cyl('Cartridge receiver rear web',191,7.5,.8,blue);moving.append(web)
moving.extend([imported['35_Replaceable_Filament_Cartridge'],imported['REF_Exposed_Nylon_Uncalibrated']])
# Overload stops and a cartridge service lock need engineering after the real part is measured.

wiremats=[mat('Red signal wire',(.62,.025,.02)),mat('Green signal wire',(.015,.31,.08)),mat('White signal wire',(.85,.85,.80)),mat('Black signal wire',(.025,.03,.035))]
for i,m in enumerate(wiremats):
 y=-4.5+i*1.15
 outside=-8.2-i*1.0
 curve('Load cell wire '+str(i+1),[(168.8,y,-5),(170,y,-9),(170,outside,-12),(164,outside,-14),(157,outside,-14),(152,outside,-8),(145,outside,-8)],.32,m)
surface=cube('Schematic contact surface',(242.2,0,0),(3,31,31),pink,1.2)

# Reference marking reproduced as a visual identifier, not a serial-number label.
font=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial.ttf');bold=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial Bold.ttf')
cu=bpy.data.curves.new('100 g marking','FONT');cu.body='100g';cu.size=1.65;cu.font=bold
mark=bpy.data.objects.new('100 g marking',cu);s.collection.objects.link(mark);mark.location=(163.6,-6.05,18.3);mark.rotation_euler=(math.pi/2,0,0);cu.materials.append(ink);moving.append(mark)

floor=cube('Studio backdrop',(187,0,-36),(600,600,.5),mat('Backdrop',(.86,.89,.88)))
for name,loc,power,size in [('Key',(200,-130,200),420000,160),('Fill',(150,100,130),220000,150),('Rim',(260,20,100),180000,100)]:
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=name;o.data.energy=power;o.data.size=size
 o.rotation_euler=(Vector((184,0,0))-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.object.camera_add(location=(215,-260,110));cam=bpy.context.object;s.camera=cam;cam.data.type='ORTHO';cam.data.clip_start=.1;cam.data.clip_end=2000
ui=bpy.data.objects.new('Camera labels',None);s.collection.objects.link(ui);ui.parent=cam
REF=140;U=REF/W
def text(name,body,x,y,size,m=ink,b=False):
 cu=bpy.data.curves.new(name,'FONT');cu.body=body;cu.size=size*U;cu.font=bold if b else font;cu.align_y='TOP'
 o=bpy.data.objects.new(name,cu);s.collection.objects.link(o);o.parent=ui;o.location=((x-W/2)*U,(H/2-y)*U,-4);cu.materials.append(m);return o
def panel(name,x,y,w,h,m=paper):
 me=bpy.data.meshes.new(name);me.from_pydata([((xx-W/2)*U,(H/2-yy)*U,-5) for xx,yy in [(x,y),(x+w,y),(x+w,y+h),(x,y+h)]],[],[(0,1,2,3)])
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);o.parent=ui;me.materials.append(m);return o
panel('Header',0,0,W,125);panel('Footer',0,730,W,170)
text('Kicker','SOLESENSE   /   KUULEYN 100 g   /   INTEGRATION CONCEPT C02',42,23,17,accent,True)
text('Title','The load cell becomes the compliant mechanism',42,51,37,ink,True)
text('Subtitle','Photo-based Kuuleyn beam model inside a proposed longer pressure head.',42,99,18,muted)
text('Footer note','PROVISIONAL DIMENSIONS  •  Motion enlarged for visibility. Fit, bracket loads and force accuracy need validation.',42,863,16,muted)
text('Legend','SILVER  load cell     BLUE  force-transfer bracket     GOLD  replaceable filament cartridge',42,829,18,muted,True)

chapters=[
 (0,3,'01  /  INSIDE THE HEAD','One beam, with a fixed end and a loaded end.','The wired end attaches to the housing. The other end carries the blue bracket.'),
 (3,6.5,'02  /  PRESS','Contact force travels through the cartridge and bracket.','The silver beam bends slightly; its strain gauges generate a small electrical signal.'),
 (6.5,8,'03  /  RELEASE','Lift away and the beam returns.','An HX711 reader and calibration would turn the signal into a grams-force reading.'),
 (8,12,'04  /  ISOLATED MECHANISM','The machined beam is the spring and the sensor.','This is a proposed mounting arrangement; the blue bracket must be checked for off-axis loading.')]
texts=[]
for i,(a,b,k,title,caption) in enumerate(chapters):
 texts.append([text('Step '+str(i),k,42,745,16,accent,True),text('Action '+str(i),title,42,770,28,ink,True),text('Detail '+str(i),caption,42,806,17,muted)])

labels=[]
def callout(body,x,y,target,colour=ink,close=False):
 o=text('Label '+body,body,x,y,18,colour,True)
 me=bpy.data.meshes.new('Leader '+body);me.from_pydata([(0,0,0)]*4,[],[(0,1,2,3)])
 line=bpy.data.objects.new('Leader '+body,me);s.collection.objects.link(line);line.parent=ui;me.materials.append(colour)
 labels.append((o,line,x,y,target,close));return o
callout('Kuuleyn 100 g beam',90,180,(166,-6,10))
callout('Fixed to housing',90,634,(160.5,-8,-22),accent)
callout('Loaded end + bracket',600,165,(174,-4,20.5),blueink)
callout('Replaceable cartridge',1010,180,(200,0,8),amber)
callout('Four wires to reader',70,493,(151,-9,-10),accent)
callout('Nylon filament',1060,685,(219,0,0),amber)
callout('Fixed end',105,620,(162,-6,-21),accent,True)
callout('Two relief holes + slot',95,175,(166,-6,11.5),ink,True)
callout('Loaded end',990,175,(170,-3,20.5),blueink,True)
callout('White gauge protection',1035,590,(168.55,-4,1),ink,True)
push_label=text('Push cue','CONTACT FORCE',1080,320,17,amber,True)
me=bpy.data.meshes.new('Push arrow');me.from_pydata([((x-W/2)*U,(H/2-y)*U,-4) for x,y in [(1040,360),(1068,344),(1068,355),(1200,355),(1200,365),(1068,365),(1068,376)]],[],[(0,1,2,3,4,5,6)])
push_arrow=bpy.data.objects.new('Push arrow',me);s.collection.objects.link(push_arrow);push_arrow.parent=ui;me.materials.append(amber)

def ease(t,a,b):
 u=max(0,min(1,(t-a)/(b-a)));return u*u*(3-2*u)
def show(o,v,f):o.hide_render=not v;o.keyframe_insert('hide_render',frame=f)
def camera(pos,target,scale,f):
 cam.location=pos;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale
 cam.keyframe_insert('location',frame=f);cam.keyframe_insert('rotation_euler',frame=f);cam.data.keyframe_insert('ortho_scale',frame=f)
 ui.scale=(scale/REF,)*3;ui.keyframe_insert('scale',frame=f)
def leader(line,x,y,point):
 p=world_to_camera_view(s,cam,Vector(point));sx=p.x*W;sy=(1-p.y)*H
 ax=x+70;ay=y+24;dx=sx-ax;dy=sy-ay;length=max(1,math.hypot(dx,dy));nx=-dy/length*.65;ny=dx/length*.65
 for v,(px,py) in zip(line.data.vertices,[(ax+nx,ay+ny),(ax-nx,ay-ny),(sx-nx,sy-ny),(sx+nx,sy+ny)]):v.co=((px-W/2)*U,(H/2-py)*U,-4.2)

origins={o.name:o.location.copy() for o in moving}
for f in range(1,s.frame_end+1):
 t=(f-1)/FPS;q=ease(t,3.4,4.8)*(1-ease(t,6.5,7.8))
 if t>=8:q=.85*(.5-.5*math.cos(math.tau*(t-8)/3.8))
 for o in moving:o.location.x=origins[o.name].x-1.2*q;o.keyframe_insert('location',frame=f)
 for k in [bend,potbend]:k.value=q;k.keyframe_insert('value',frame=f)
 surface.location.x=242.2-(1.3+1.2*q)*ease(t,2.7,3.4)+4*ease(t,6.5,7.8);surface.keyframe_insert('location',frame=f)
 if t<8:camera((215,-260,110),(189,0,1),160,f)
 else:camera((225,-170,60),(172,0,0),136,f)
 s.frame_set(f);bpy.context.view_layer.update()
 for ci,(a,b,*_) in enumerate(chapters):
  for o in texts[ci]:show(o,a<=t<b,f)
 for o,line,x,y,p,close in labels:
  show(o,(t>=8)==close,f);show(line,(t>=8)==close,f)
  if f==(193 if close else 1):leader(line,x,y,p)
 for o in shellparts+[surface,imported['35_Replaceable_Filament_Cartridge'],imported['REF_Exposed_Nylon_Uncalibrated']]:show(o,t<8,f)
 show(push_label,3.4<=t<6.5,f);show(push_arrow,3.4<=t<6.5,f)
for action in bpy.data.actions:
 for layer in action.layers:
  for strip in layer.strips:
   if strip.type=='KEYFRAME':
    for bag in strip.channelbags:
     for fc in bag.fcurves:
      for k in fc.keyframe_points:k.interpolation='LINEAR'
for a,b,k,title,caption in chapters:s.timeline_markers.new(title,frame=int(a*FPS)+1)
note=bpy.data.texts.new('READ ME - concept and sources')
note.write('C02 photo-based Kuuleyn 100 g integration study. R04 CAD is unchanged.\nProduct: Kuuleynhtfzc0s6ev / ASIN B0B4SK7MWK. Photos: https://www.tiendamia.cr/p/amz/B0B4SK7MWK\nBeam envelope ASSUMED 47 x 12 x 6 mm; no verified dimensioned drawing. Hole positions, slot, cover and bracket are visual approximations.\nThe load cell itself is the compliant sensing element. Fixed wired end attaches to the shell. Free end supports an offset bracket and floating cartridge.\nThe proposed shell is 13 mm longer at the nose, with 58 mm shoulder OD. Fit remains unvalidated.\nVisual displacement is prescribed at up to 1.2 mm, not FEA or a safe sensor stroke. No force magnitude is assigned.\nMeasure the actual part and verify its load direction, allowed moment, overload protection, deflection and mounting before designing manufactured parts.\nCartridge exchange needs a service lock to prevent twist/insertion force damaging the load cell. That lock is not engineered here.\nWhole-assembly calibration, gravity, wire forces, mechanical bypass, ADC noise and temperature must be checked. 1, 10 and 75 gf accuracy is not established. A 100 g rating is full scale, not measurement resolution.\nFilament geometry and buckling force must suit the intended test. The uncalibrated R04 nylon is only a geometry reference.\n')
s.frame_set(1);bpy.ops.file.pack_all();bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_C02_Kuuleyn_Concept.blend'))
(OUT/'source/storyboard.json').write_text(json.dumps({'fps':FPS,'duration':DURATION,'resolution':[W,H],'chapters':chapters,'assumed_sensor_envelope_mm':[47,12,6],'visual_displacement_mm':1.2,'manufacturer_dimensions_verified':False,'force_calibrated':False},indent=2))
args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
if '--preview' in args:
 for f,name in [(1,'01_Kuuleyn_Cutaway'),(133,'02_Force_Path'),(193,'03_Kuuleyn_Mechanism')]:
  s.frame_set(f);s.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True)
if '--render' in args:
 # Render motion at 12 samples/sec, held for two playback frames; reuse identical static intervals.
 # The delivered H.264 is 24 fps. These are prescribed demonstration poses, not a simulation.
 frames=OUT/'video/frames';frames.mkdir(exist_ok=True);last=None
 for f in range(1,s.frame_end+1):
  destination=frames/f'frame_{f:04d}.png'
  hold=f%2==0 or 1<f<67 or 117<f<157 or f==191
  if hold:shutil.copyfile(last,destination)
  else:
   s.frame_set(f);s.render.filepath=str(destination);bpy.ops.render.render(write_still=True);last=destination
  print('C02_FRAME',f,flush=True)
print('C02_READY',flush=True)
