"""R07 CAD-derived assembly and magnetic motion animation. Run inside Blender."""
import bpy, json, math, sys, argparse
from pathlib import Path
from mathutils import Vector
ROOT=Path(__file__).resolve().parents[2]; OUT=ROOT/'video'; FPS=12; DURATION=60; W,H=1280,800
args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
p=argparse.ArgumentParser();p.add_argument('--preview',action='store_true');p.add_argument('--render',action='store_true');p.add_argument('--frames-dir',default='/tmp/solesense-r07-animation-frames');a=p.parse_args(args)
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='R07 assembly and magnetic sensing';s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=16
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100;s.render.fps=FPS
s.render.image_settings.file_format='PNG';s.render.film_transparent=False;s.render.use_file_extension=True
s.view_settings.view_transform='Standard';s.view_settings.look='None';s.world.use_nodes=True;s.world.node_tree.nodes['Background'].inputs['Color'].default_value=(.82,.88,.87,1);s.world.node_tree.nodes['Background'].inputs['Strength'].default_value=.065
wn=s.world.node_tree.nodes;wl=s.world.node_tree.links;camera_bg=wn.new('ShaderNodeBackground');camera_bg.inputs['Color'].default_value=(.82,.88,.87,1);camera_bg.inputs['Strength'].default_value=1
lp=wn.new('ShaderNodeLightPath');wm=wn.new('ShaderNodeMixShader');wl.new(lp.outputs['Is Camera Ray'],wm.inputs[0]);wl.new(wn['Background'].outputs[0],wm.inputs[1]);wl.new(camera_bg.outputs[0],wm.inputs[2]);wl.new(wm.outputs[0],wn['World Output'].inputs['Surface'])
s.frame_start=1;s.frame_end=DURATION*FPS
M={};objects={};meta={};original={}
def mat(name,c,metal=0,emit=False):
 if name in M:return M[name]
 m=bpy.data.materials.new(name);m.use_nodes=True;b=m.node_tree.nodes.get('Principled BSDF');b.inputs['Base Color'].default_value=(*c,1);b.inputs['Roughness'].default_value=.38;b.inputs['Metallic'].default_value=metal
 if emit:b.inputs['Emission Color'].default_value=(*c,1);b.inputs['Emission Strength'].default_value=1;b.inputs['Base Color'].default_value=(0,0,0,1)
 M[name]=m;return m
white=mat('White shell',(.83,.88,.87));teal=mat('Teal',(.025,.37,.38));blue=mat('Moving blue carriage',(.055,.47,.68));coral=mat('Moving magnet coral',(.98,.22,.16),.25);purple=mat('Fixed sensor violet',(.38,.12,.65));gold=mat('Metal leaves',(.70,.46,.11),.55)
ink=mat('HUD ink',(.025,.065,.075),emit=True);muted=mat('HUD muted',(.24,.34,.36),emit=True);paper=mat('HUD white',(.97,.985,.98),emit=True);accent=mat('HUD teal',(.015,.40,.36),emit=True)
for d in json.loads((ROOT/'source/assembly_manifest.json').read_text()):
 if d['group'] in ['Handle','Interface','Vibration_head','Fit_coupons','Legacy_contact_concept'] or d['name']=='49_Bench_Calibration_Cartridge':continue
 bpy.ops.wm.stl_import(filepath=str(ROOT/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];objects[o.name]=o;meta[o.name]=d
 o['part_description']=d['description'];o['moving_with_carriage']=d['moving'];o['source_mesh']=d['assembly_mesh']
 ma=mat(str(d['color']),d['color'],.45 if d['group'] in ['Fasteners','Springs'] else .04)
 if o.name=='REF_Magnet_6x3_Axial':ma=coral
 if o.name=='REF_DRV5055A3QLPG_Envelope':ma=purple
 o.data.materials.append(ma)
 for f in o.data.polygons:f.use_smooth=True
 mod=o.modifiers.new('Sharp display edges','EDGE_SPLIT');mod.split_angle=math.radians(30)
# CAD-derived cutaway copy: hide near wall solely for explanation.
ch=objects['42_Magnetic_Chassis'];cut=ch.copy();cut.data=ch.data.copy();s.collection.objects.link(cut);cut.name='Illustration_Cutaway_Chassis'
bpy.ops.mesh.primitive_cube_add(size=1,location=(201.5,28,1));cutter=bpy.context.object;cutter.dimensions=(74,7,33);bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
bpy.context.view_layer.objects.active=cut;mod=cut.modifiers.new('Presentation cutaway only','BOOLEAN');mod.operation='DIFFERENCE';mod.solver='EXACT';mod.object=cutter;bpy.ops.object.modifier_apply(modifier=mod.name);bpy.data.objects.remove(cutter,do_unlink=True)
# Replace the two flat reference leaves by equal-size subdivided strips for prescribed bending.
leaf_data={}
for i,x in enumerate([190,217],1):
 n=f'REF_Phosphor_Bronze_Leaf_{i}';o=objects[n];verts=[];faces=[]
 ys=[-25,-20]+[-20+18*j/36 for j in range(1,37)]+[3]
 for y in ys:verts.extend([(x,y,-6),(x+.1,y,-6),(x+.1,y,6),(x,y,6)])
 for j in range(len(ys)-1):
  for k in range(4):faces.append((4*j+k,4*j+(k+1)%4,4*(j+1)+(k+1)%4,4*(j+1)+k))
 faces.extend([(3,2,1,0),tuple(4*(len(ys)-1)+k for k in range(4))])
 me=bpy.data.meshes.new(n+'_segmented');me.from_pydata(verts,[],faces);me.update();o.data=me;o.data.materials.append(gold)
 basis=o.shape_key_add(name='Basis');bend=o.shape_key_add(name='Axial bend at 2 mm');side=o.shape_key_add(name='Lateral shortening at 2 mm')
 for j,v in enumerate(verts):
  q=max(0,min(1,(v[1]+20)/18));h=q*q*(3-2*q)
  bend.data[j].co.x-=2*h;side.data[j].co.y-=.6*4/18*q
 leaf_data[n]=(bend,side)
# Camera and studio.
bpy.ops.object.camera_add();cam=bpy.context.object;cam.name='Animated review camera';cam.data.type='ORTHO';cam.data.clip_end=3000;s.camera=cam
for pos,power,size in [((160,70,210),350000,160),((250,-100,150),240000,140),((120,30,60),60000,90)]:
 bpy.ops.object.light_add(type='AREA',location=pos);o=bpy.context.object;o.data.energy=power;o.data.size=size;o.rotation_euler=(Vector((200,0,0))-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.mesh.primitive_plane_add(size=2000,location=(200,0,-40));floor=bpy.context.object;floor.name='Studio';floor.data.materials.append(mat('Studio background',(.82,.88,.87)))
# Illustrative loading surface at tip; not a model of skin or calibrated filament buckling.
bpy.ops.mesh.primitive_uv_sphere_add(segments=24,ring_count=12,radius=1,location=(290.4,0,0));contact=bpy.context.object;contact.name='Illustrative contact surface';contact.scale=(7,12,12);contact.data.materials.append(mat('Contact surface',(.83,.59,.45)))
for f in contact.data.polygons:f.use_smooth=True
# HUD objects parented to camera; coordinates in normalized image space.
fontpath='/System/Library/Fonts/Supplemental/Arial.ttf';font=bpy.data.fonts.load(fontpath);font.pack()
hud=[]
def local(x,y,d):return Vector(((x/W-.5),(.5-y/H)*H/W,-d))
def text(body,x,y,size=24,ma=ink):
 cu=bpy.data.curves.new(body[:35],'FONT');cu.body=body;cu.size=size/W;cu.align_y='TOP';cu.font=font
 o=bpy.data.objects.new('HUD '+body[:35],cu);s.collection.objects.link(o);o.parent=cam;o.location=local(x,y,.015);cu.materials.append(ma);hud.append(o);return o
def panel(x,y,w,h,ma=paper):
 me=bpy.data.meshes.new('HUD panel');me.from_pydata([local(x,y,.02),local(x+w,y,.02),local(x+w,y+h,.02),local(x,y+h,.02)],[],[(0,1,2,3)])
 o=bpy.data.objects.new('HUD panel',me);s.collection.objects.link(o);o.parent=cam;me.materials.append(ma);hud.append(o);return o
panel(0,0,W,104);panel(962,104,318,646);panel(0,664,962,86);panel(0,750,W,50)
text('SOLESENSE   /   R07',28,17,19,accent)
footer=text('CAD-derived illustration  |  Prescribed motion; no measured force or accuracy claim',28,766,16,muted)
chapters=[
(0,4,'The final magnetic pressure head','01 / OVERVIEW',['Curved service cover','Replaceable cartridge','Magnetic sensing stage'], 'R07 geometry. Head only; handle and electronics omitted.'),
(4,10,'Every part has a place','02 / EXPLODED',['White: enclosure','Blue: moving carriage','Gold: metal springs','Coral: magnet','Violet: Hall sensor'], 'Exploded offsets separate parts for viewing; not tool or insertion paths.'),
(10,17,'Build the housing and carriage','03 / CORE ASSEMBLY',['41  Joint adaptor','42  Lower chassis','44  Moving carriage','46  Magnet retainer','6 x 3 mm magnet'], 'Retain the magnet in the carriage before lowering the carriage into the chassis.'),
(17,24,'Locate, clamp, then add the sensor','04 / SPRINGS + SENSOR',['55  Temporary bridge','50  Service pin','45  Four leaf clamps','Two metal leaves','47  Hall sensor mount'], 'Bridge and service pin locate the carriage while the two leaves are clamped.'),
(24,35,'Close the head and lock the cartridge','05 / CLOSE + LOCK',['Remove bridge first','43  Cover + 4 screws','56  Optional teal inlay','48  Insert + turn 30 deg','51  Cartridge lock'], 'Use service pin for cartridge changes. Remove the entire pin before measuring.'),
(35,44,'Press the filament: the carriage moves','06 / CUTAWAY',['Filament loads carriage','Metal leaves bend','Magnet moves with it','Hall sensor stays fixed','Release: leaves return'], '2.0 mm illustrative stroke within the modeled 2.4 mm stop; filament buckling not modeled.'),
(44,54,'A moving magnet. A fixed Hall sensor.','07 / SENSOR CLOSE-UP',['CORAL  Moving magnet','VIOLET  Fixed Hall sensor','Gap decreases on press','Gap increases on release','Calibrate signal to force'], 'Carriage, retainer and fasteners hidden to expose the magnet. No field simulation.'),
(54,60,'Ready for the first physical build','08 / NEXT STEP',['Print the fit coupons','Assemble and check return','Wire bench electronics','Calibrate known loads','Then assess 1 / 10 / 75 gf'], 'Final CAD revision; physical fit, force accuracy and filament performance remain unverified.')]
chapter_hud=[]
for start,end,title,kicker,lines,subtitle in chapters:
 group=[text(title,28,50,30),text(kicker,986,132,17,accent)]
 for i,line in enumerate(lines):group.append(text(line,986,195+i*53,19,muted))
 # Main caption above footer has two lines when long.
 import textwrap
 group.append(text('\n'.join(textwrap.wrap(subtitle,width=88)),28,687,19,ink));chapter_hud.append(group)
# Gap readout is symbolic, deliberately carries no voltage or force scale.
barback=panel(988,552,252,15,mat('Bar back',(.79,.85,.83),emit=True));bar=panel(988,552,252,15,accent)
for v in bar.data.vertices:v.co.z=-.018
barlabel=text('RELATIVE MAGNET APPROACH',986,520,15,muted)
restlabel=text('REST',986,582,17,muted);presslabel=text('PRESS',1175,582,17,accent)
# A displacement arrow in camera space. It is visible only in the full cutaway.
arrow=text('PRESS  >',145,610,26,accent)
def smooth(a,b,t):
 q=max(0,min(1,(t-a)/(b-a)));return q*q*(3-2*q)
def mix(v,w,q):return Vector(v).lerp(Vector(w),q)
def exploded(n):
 if n=='42_Magnetic_Chassis':return Vector((0,0,0))
 if n.startswith(('43_','56_','REF_Lid_Nut')):return Vector((0,0,92 if not n.startswith('56_') else 108))
 if n.startswith('REF_Lid_Screw'):return Vector((0,0,-45))
 if n.startswith(('41_','REF_Adaptor')):return Vector((-45,0,0))
 if n.startswith(('48_','REF_Nylon')):return Vector((45,0,0))
 if n.startswith(('51_','REF_Cartridge_Lock')):return Vector((0,0,68))
 if n.startswith(('47_','REF_DRV','REF_Hall','REF_Sensor_Adjust')):return Vector((-20,10,55))
 if n.startswith(('46_','REF_Magnet_Screw','REF_Magnet_Nut')):return Vector((-42,0,36))
 if n.startswith('REF_Magnet_6'):return Vector((-26,0,36))
 if n.startswith('45_Leaf_Clamp'):
  i=int(n[-1]);return Vector((10 if i%2 else 10, -20 if i%2 else 20,36))
 if n.startswith('REF_Leaf_'):
  i=int(n.split('_')[-2]);return Vector((18 if 'Screw' in n else -10,-20 if i%2 else 20,36))
 if n.startswith('REF_Phosphor'):return Vector((0,-28,36))
 return Vector((0,0,36))
def assembly_offset(n,t):
 e=exploded(n)
 if t<10:return e*smooth(4,8,t)
 if n.startswith(('41_','REF_Adaptor')):return e*(1-smooth(10,12,t))
 if n=='42_Magnetic_Chassis':return Vector((0,0,0))
 if n.startswith(('43_','REF_Lid_Nut')):return e*(1-smooth(26,28,t))
 if n.startswith('56_'):return e*(1-smooth(28,29,t))
 if n.startswith('REF_Lid_Screw'):return e*(1-smooth(28,29,t))
 if n.startswith(('48_','REF_Nylon')):return e*(1-smooth(29.5,31,t))
 if n.startswith(('51_','REF_Cartridge_Lock')):return e*(1-smooth(31.6,32.4,t))
 if n.startswith(('47_','REF_DRV','REF_Hall','REF_Sensor_Adjust')):return e*(1-smooth(22,24,t))
 if n.startswith(('45_','REF_Leaf_','REF_Phosphor')):
  station=2 if (n.endswith(('_3','_4','Leaf_2')) or '_3_' in n or '_4_' in n) else 1
  return e*(1-smooth(19 if station==1 else 20.5,20.5 if station==1 else 22,t))
 # Magnet and retainer first assemble into the elevated carriage.
 if n.startswith(('46_','REF_Magnet')):
  q=smooth(12,13.5,t) if n.startswith('REF_Magnet_6') else smooth(13.5,15,t)
  return mix(e,(0,0,36),q)-Vector((0,0,36*smooth(15,17,t)))
 return Vector((0,0,36*(1-smooth(15,17,t))))
def camera_pose(t):
 if t<4:
  ang=.65+.28*t/4;target=Vector((210,0,3));loc=target+Vector((150*math.sin(ang),150*math.cos(ang),115));scale=205
 elif t<10:target=Vector((204,0,32));loc=target+Vector((125,165,145));scale=480
 elif t<35:target=Vector((212,0,14));loc=target+Vector((122,160,155));scale=245
 elif t<44:target=Vector((221,0,0));loc=target+Vector((110,170,125));scale=178
 elif t<54:target=Vector((175,7,-3));loc=target+Vector((30,80,55));scale=52
 else:
  target=Vector((211,0,3));q=(t-54)/6;loc=target+Vector((115+20*q,160-20*q,125));scale=202
 cam.location=loc;cam.rotation_euler=(target-loc).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale
 # Place the model in the left panel without changing projection geometry.
 cam.location+=cam.rotation_euler.to_matrix()@Vector((scale*.13,0,0))
 for ob in hud:ob.scale=(scale,scale,scale)
 # HUD locations are parent-local and must scale in step with ortho scale.
 for ob in hud:
  if 'base_hud_location' not in ob:ob['base_hud_location']=list(ob.location)
  ob.location=Vector(ob['base_hud_location'])*scale
 return scale
closekeep={'REF_Magnet_6x3_Axial','47_Adjustable_Hall_Mount','REF_DRV5055A3QLPG_Envelope','REF_Hall_Lead_1','REF_Hall_Lead_2','REF_Hall_Lead_3'}
def motion(t):
 if 35<=t<44:return 1-math.cos(2*math.pi*(t-35)/4.5)
 if 44<=t<54:return 1-math.cos(2*math.pi*(t-44)/5)
 return 0.
reports=[]
def apply(t,frame,bake=True):
 d=motion(t);dy=-.6*d*d/18;close=44<=t<54;cutaway=35<=t<44
 for n,o in objects.items():
  o.hide_render=False;o.rotation_euler=(0,0,0);o.location=assembly_offset(n,t) if t<35 else Vector((0,0,0))
  if t>=35 and meta[n]['moving']:o.location+=Vector((-d,dy,0))
  if meta[n]['group']=='Service_lock':
   o.hide_render=not(17<=t<26 or 29<=t<34.7)
   if 17<=t<26:o.location=(0,0,55*(1-smooth(18,19,t))+70*smooth(24,25,t))
   elif 29<=t<34.7:o.location=(0,0,55*(1-smooth(29,29.5,t))+80*smooth(33,34.5,t))
  if n=='55_Spring_Assembly_Bridge':o.hide_render=not(17<=t<26);o.location=(0,0,65*(1-smooth(17,18,t))+90*smooth(25,26,t))
  if n.startswith(('48_','REF_Nylon')) and 29.5<=t<31.6:o.rotation_euler.x=math.radians(30)*(1-smooth(31,31.6,t))
  if 10<=t<26 and n.startswith(('43_','56_','REF_Lid_Nut')):o.hide_render=True
  if 10<=t<28 and n.startswith('REF_Lid_Screw'):o.hide_render=True
  if 17.7<=t<25.5 and n.startswith('REF_Lid_Screw_2'):
   o.hide_render=False;o.location=(0,0,-45*(1-smooth(17.7,18.2,t))-45*smooth(24.8,25.5,t))
  if 10<=t<29.5 and n.startswith(('48_','REF_Nylon','51_','REF_Cartridge_Lock')):o.hide_render=True
  if cutaway and n.startswith(('43_','56_','REF_Lid_','41_','REF_Adaptor')):o.hide_render=True
  if cutaway and n=='42_Magnetic_Chassis':o.hide_render=True
  if close and n not in closekeep:o.hide_render=True
  if n in leaf_data:
   bend,side=leaf_data[n];bend.value=d/2;side.value=(d/2)**2
   if bake:bend.keyframe_insert('value',frame=frame);side.keyframe_insert('value',frame=frame)
  if bake:
   for prop in ['location','rotation_euler','hide_render']:o.keyframe_insert(prop,frame=frame)
 cut.hide_render=not cutaway;contact.hide_render=not cutaway;contact.location.x=290.4-d;contact.location.y=dy;floor.hide_render=close;floor.location.z=-95 if 4<=t<10 else -40
 scale=camera_pose(t)
 for i,(start,end,*_) in enumerate(chapters):
  for o in chapter_hud[i]:o.hide_render=not(start<=t<end)
 for o in [barback,bar,barlabel,restlabel,presslabel]:o.hide_render=not(cutaway or close)
 # Scale the approach bar from the left edge rather than its center.
 bar.scale.x=scale*max(.006,d/2);bar.location.x=scale*((988/W-.5)*(1-max(.006,d/2)))
 arrow.hide_render=not(cutaway and d>.05)
 if bake:
  for o in [cut,contact,floor,cam]+hud:
   for prop in ['location','rotation_euler','scale','hide_render']:o.keyframe_insert(prop,frame=frame)
  cam.data.keyframe_insert('ortho_scale',frame=frame)
 reports.append({'frame':frame,'seconds':round(t,4),'stroke_mm':d,'magnet_dx':objects['REF_Magnet_6x3_Axial'].location.x,'sensor_dx':objects['REF_DRV5055A3QLPG_Envelope'].location.x,'service_pin_visible':not objects['REF_Service_Pin_M3x30'].hide_render,'bridge_visible':not objects['55_Spring_Assembly_Bridge'].hide_render})
for f in range(1,DURATION*FPS+1):apply((f-1)/FPS,f)
# Frame-by-frame sampled transforms, including discrete visibility, remain editable.
for action in bpy.data.actions:
 for layer in action.layers:
  for strip in layer.strips:
   for slot in action.slots:
    try:bag=strip.channelbag(slot)
    except:continue
    if bag:
     for curve in bag.fcurves:
      for k in curve.keyframe_points:k.interpolation='LINEAR' if curve.data_path not in ['hide_render'] else 'CONSTANT'
for row in reports:
 if 35<=row['seconds']<54:
  assert abs(row['magnet_dx']+row['stroke_mm'])<1e-6
  assert abs(row['sensor_dx'])<1e-8
  assert not row['service_pin_visible'] and not row['bridge_visible']
assert max(r['stroke_mm'] for r in reports)<=2.00001
(OUT/'motion_checks.json').write_text(json.dumps({'description':'Prescribed display motion; not FEA or force calibration. Leaves retain fixed anchors and guided moving ends.','samples':reports},indent=2))
(OUT/'source/storyboard.json').write_text(json.dumps([{'start':c[0],'end':c[1],'title':c[2],'caption':c[-1]} for c in chapters],indent=2))
s.frame_set(1);bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'SoleSense_R07_Assembly_and_Motion.blend'))
if a.preview:
 for sec in [1,8.5,14,20,30.5,37.25,46.5,57]:
  s.frame_set(round(sec*FPS)+1);s.render.filepath=str(OUT/'previews'/f'review_{sec:05.2f}.png');bpy.ops.render.render(write_still=True)
if a.render:
 frames=Path(a.frames_dir);frames.mkdir(parents=True,exist_ok=True)
 for f in range(1,DURATION*FPS+1):
  dest=frames/f'frame_{f:04d}.png'
  if dest.exists():continue
  s.frame_set(f);s.render.filepath=str(dest);bpy.ops.render.render(write_still=True)
  if f%12==0:print(f'R07_RENDER {f}/{DURATION*FPS}',flush=True)
print('R07_ANIMATION_READY',flush=True)
