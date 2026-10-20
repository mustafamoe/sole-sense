"""Four educational sensing mechanisms; illustrative geometry, not production CAD."""
import sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from common import *

args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
MODE=args[args.index('--mode')+1]
CONFIG={
 'inline':('01_Inline_Load_Cell','Inline miniature load cell',.7,'Strain signal',[
  ('A small load cell sits directly behind the cartridge.','One end is fixed. The short blue pushrod loads the other end.'),
  ('Press: the metal sensing element flexes slightly.','Strain gauges on the metal turn that deformation into an electrical signal.'),
  ('Close-up: strain gauges sense the changing load.','The red patches represent gauges. The S-beam shape and movement are illustrative.'),
  ('Release: the sensor unloads and the reading returns.','Reader electronics and whole-assembly calibration convert the signal to grams-force.')]),
 'magnetic':('02_Magnetic_Flexure','Metal flexure + magnetic sensing',1.2,'Position signal',[
  ('Metal flexures support a floating cartridge holder.','Their outer edges attach to the head; their centres carry the blue pushrod.'),
  ('Press: the flexures bend and a small magnet moves.','A fixed Hall sensor detects the changing magnetic field across an air gap.'),
  ('Close-up: the sensor reads movement without contact.','Calibrating the complete flexure and magnetic system maps movement to force.'),
  ('Release: the flexures return the cartridge holder.','The magnetic sensor stays fixed. It measures position; calibration provides grams-force.')]),
 'optical':('03_Optical_Flexure','Metal flexure + optical sensing',1.2,'Received light',[
  ('A small flag moves with the floating cartridge holder.','Metal flexures support the holder. The light source and detector stay fixed.'),
  ('Press: the flag progressively covers a light beam.','An analogue light detector senses the change in light reaching it.'),
  ('Close-up: flag movement changes the optical signal.','This uses an analogue light measurement, not only an on/off optical switch.'),
  ('Release: the flag returns and the light level recovers.','Whole-assembly calibration maps optical signal and flexure movement to grams-force.')]),
 'capacitive':('04_Capacitive_Sensor','Thin capacitive force sensor',.06,'Capacitance',[
  ('The pushrod loads a thin sensor against rigid backing.','A small contact pad spreads force over the sensor. The sensor stays inside the head.'),
  ('Press: the thin sensing stack compresses slightly.','The changing geometry alters capacitance, which the electronics can measure.'),
  ('Layer diagram: the gap between conductors becomes smaller.','Layer thickness and motion are greatly enlarged here to explain the sensing principle.'),
  ('Release: the sensing stack recovers as the load is removed.','Calibration converts capacitance into grams-force. Low-force accuracy must be tested.')])
}
NAME,TITLE,STROKE,SIGNAL,STEPS=CONFIG[MODE]
s.name=TITLE;s['concept_mode']=MODE;s['output_name']=NAME;s['illustrative_stroke_mm']=STROKE
flexmat=mat('Metal flexures highlighted teal',(.015,.44,.34),.45)
purple=mat('Sensing elements',(.37,.15,.49),.25)
red=mat('Strain gauges or north magnet pole',(.66,.055,.055),.1)
magblue=mat('South magnet pole',(.055,.16,.50),.2)
yellow=mat('Dielectric layer',(.88,.62,.13),.1)
lightmat=mat('Optical incoming light',(.9,.30,.025),emission=True)
receive_mat=mat('Optical transmitted light',(.9,.30,.025),emission=True)
black=mat('Optical flag',(.035,.05,.06),.05)

moving=[];keys=[];fixed_objects=[];main_only=[];close_only=[];close_hidden=[]
manifest=json.loads((R04/'source/assembly_manifest.json').read_text());imported={}
for d in manifest:
 if d['name'] not in ['07_Pressure_Head_Body','35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated','33_Captive_Collar_Right','40_Captive_Collar_Left']:continue
 bpy.ops.wm.stl_import(filepath=str(R04/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];imported[o.name]=o
 o.data.materials.append(shellmat if o.name.startswith('07') else teal if 'Collar' in o.name else gold)
rear=imported['07_Pressure_Head_Body'];boolean(rear,cube('Remove original nose',(211,0,0),(100.4,100,100)))
shellparts=[rear,imported['33_Captive_Collar_Right'],imported['40_Captive_Collar_Left']]
for o in shellparts:boolean(o,cube('Cutaway',(180,-50,0),(150,100,130)))
shell=revolved('Illustrative extended housing',[(160.8,27),(162.8,29),(181,29),(196,12),(196,8.8),(180,26.5),(163.2,26.5),(160.8,24.5)],shellmat)
# Retain a bottom portion of the camera-facing shell to show how the detector bracket is supported.
boolean(shell,cube('Open upper camera-facing housing',(180,-50,40),(150,100,120)));shellparts.append(shell)
main_only.extend(shellparts)
for n in ['35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated']:
 imported[n].location.x+=15;moving.append(imported[n]);main_only.append(imported[n])
holder=ring('Moving cartridge receiver',194.6,7.5,5.2,7.6,blue);moving.append(holder)
web=cyl('Moving receiver rear web',191,7.5,.8,blue);moving.append(web)
surface=cube('Schematic skin contact',(242.2,0,0),(3,31,31),pink,1.2);main_only.append(surface)

def add_fixed(o):fixed_objects.append(o);return o
def add_move(o):moving.append(o);return o
def key_deform(o,fn):
 o.shape_key_add(name='Rest');k=o.shape_key_add(name='Illustrated deformation')
 for i,p in enumerate(k.data):fn(i,p)
 keys.append(k);return k
def soften(u):u=max(0,min(1,u));return u*u*(3-2*u)
def mounting_plate(x):
 plate=cyl('Fixed rear backing',x,23,1.5,fixedmat)
 boolean(plate,cube('Open rear backing upper half',(x,-25,18),(5,50,30)))
 add_fixed(plate);close_hidden.append(plate);return plate
def detector_mount(x,y,bottom=-23):
 # Bracket reaches the retained lower shell, remaining separate from the moving holder.
 return add_fixed(cube('Fixed detector mounting foot',(x,y,(bottom-5)/2),(4,3,-5-bottom),fixedmat,.3))

if MODE=='inline':
 mounting_plate(157.5)
 add_fixed(cube('Fixed load-cell mount',(159.2,0,0),(2.1,10,20),fixedmat,.3))
 cell=cube('Illustrative miniature S-beam',(169.8,0,0),(19.1,6.7,17.5),aluminium)
 boolean(cell,cube('Lower opening',(165.6,0,-2.15),(1.4,10,13.5)))
 boolean(cell,cube('Upper opening',(174,0,2.15),(1.4,10,13.5)))
 bevel=cell.modifiers.new('Machined edges','BEVEL');bevel.width=.18;bevel.segments=3
 key_deform(cell,lambda i,p:setattr(p.co,'x',p.co.x-STROKE*soften((p.co.x+9.55)/19.1)))
 cell['note']='S-beam architecture shown schematically inside an approximately 19.1 x 6.7 x 17.5 mm envelope. Not FUTEK manufacturer CAD.'
 for x,z,u in [(165.6,5.3,.28),(174,-5.3,.72)]:
  gauge=cube('Gauge patch',(x,-3.52,z),(2.5,.34,2),red,.1)
  gauge['fractional_motion']=soften(u)
  add_move(gauge)
 stem=cyl('Short axial pushrod',(179.35+191)/2,3.0,191-179.35,blue);add_move(stem)
 sensor_target=(170,-3.35,0);detail_target=(165.6,-3.7,5.3)
 sensor_label='Miniature S-beam';detail_label='Strain gauges'
 close_position=(213,-125,48);close_target=(177,0,0);close_scale=105
elif MODE in ['magnetic','optical']:
 stem=cyl('Moving flexure shaft',(164.5+191)/2,2.8,191-164.5,blue);add_move(stem)
 flex_objects=[]
 for ix,(x,outer) in enumerate([(166,20),(174,18)]):
  flex_objects.append(add_fixed(ring('Fixed flexure rim '+str(ix),x,outer,outer-1.6,1.1,fixedmat)))
  flex_objects.append(add_move(ring('Moving flexure hub '+str(ix),x,4.3,2.8,1.1,flexmat)))
  for sign in [-1,1]:
   foot=cube('Flexure mounting foot',(x,2,sign*(outer+26.8)/2),(3,4,26.8-outer),fixedmat,.2);add_fixed(foot);flex_objects.append(foot)
  for arm in range(4):
   verts=[];faces=[];N=32
   for i in range(N+1):
    u=i/N;r=(outer-1.1)*(1-u)+4.1*u;a=arm*math.pi/2+math.radians(65)*u
    for dx,w in [(-.18,-.65),(-.18,.65),(.18,.65),(.18,-.65)]:verts.append((x+dx,r*math.cos(a)-w*math.sin(a),r*math.sin(a)+w*math.cos(a)))
   for i in range(N):
    for j in range(4):faces.append((4*i+j,4*i+(j+1)%4,4*(i+1)+(j+1)%4,4*(i+1)+j))
   faces.extend([(0,3,2,1),(4*N,4*N+1,4*N+2,4*N+3)])
   me=bpy.data.meshes.new('Flexure leaf');me.from_pydata(verts,[],faces);me.update()
   o=bpy.data.objects.new('Bending leaf '+str(ix)+'-'+str(arm),me);s.collection.objects.link(o);me.materials.append(flexmat)
   key_deform(o,lambda i,p:setattr(p.co,'x',p.co.x-STROKE*soften((i//4)/N)))
   flex_objects.append(o)
 close_hidden.extend(flex_objects)
 if MODE=='magnetic':
  add_move(cube('Moving magnet carrier',(180,-5,0),(4.5,6.4,4),blue,.3))
  add_move(cube('Magnet north half',(179.1,-9.3,0),(1.8,2.2,3.6),red,.1))
  add_move(cube('Magnet south half',(180.9,-9.3,0),(1.8,2.2,3.6),magblue,.1))
  board=add_fixed(cube('Fixed Hall circuit board',(180,-9.3,-7),(12,10,1),fixedmat,.3))
  detector=add_fixed(cube('Fixed Hall sensor',(180,-9.3,-5.8),(3,3,1.4),purple,.15))
  support=detector_mount(180,-9.3,bottom=-25);support.dimensions.z=17.5;support.location.z=-16.25
  # A dashed line indicates an air gap, not a ray or a mechanical connection.
  for j in range(4):
   d=cube('Air gap marker '+str(j),(180,-9.3,-2.2-j*.7),(.16,.16,.3),purple);close_only.append(d)
  sensor_target=(180,-9.3,-5.8);detail_target=(180,-9.3,0)
  sensor_label='Fixed Hall sensor';detail_label='Magnet on moving holder'
 else:
  add_move(cube('Moving flag carrier',(183.8,-5.9,0),(4,7,3),blue,.3))
  flag=add_move(cube('Moving optical flag',(183.8,-10.3,0),(6,.5,6),black,.1))
  board=add_fixed(cube('Fixed optical board',(180,-10.5,-2.5),(9,12,1),fixedmat,.2))
  support=detector_mount(180,-10.5,bottom=-25);support.dimensions.z=22;support.location.z=-14
  led=add_fixed(cube('Fixed light source',(180,-6.2,0),(3,2,4),purple,.2))
  detector=add_fixed(cube('Fixed analogue light detector',(180,-14.7,0),(3,2,4),purple,.2))
  # Light path on either side of the flag, with received intensity changing under occlusion.
  for name,ya,yb,m in [('Incoming light',-7.25,-9.95,lightmat),('Transmitted light',-10.65,-13.65,receive_mat)]:
   o=cyl(name,180,.42,abs(yb-ya),m);o.rotation_euler=(0,0,math.pi/2);o.location=(180,(ya+yb)/2,0)
  sensor_target=(180,-14.7,0);detail_target=(183,-10.3,0)
  sensor_label='Fixed light detector';detail_label='Flag on moving holder'
 close_position=(208,-130,110);close_target=(181,-5,-3);close_scale=95
else:
 mounting_plate(165.4)
 backing=add_fixed(cyl('Rigid sensor backing',167.4,8,2.7,fixedmat))
 rear_electrode=add_fixed(cyl('Thin sensor rear layer',168.80,4,.1,purple))
 dielectric=cyl('Thin sensor dielectric',168.90,4,.1,yellow)
 front_electrode=add_move(cyl('Thin sensor front layer',169.0,4,.1,purple))
 pad=add_move(cyl('Moving load spreading pad',170.55,3.2,3,blue))
 stem=add_move(cyl('Moving capacitive pushrod',(172.05+191)/2,2.8,191-172.05,blue))
 cap_main=[backing,rear_electrode,dielectric,front_electrode,pad,stem,holder,web]
 for x in [178,186]:
  guide=add_fixed(ring('Axially free clearance guide',x,5.3,3.2,1.5,fixedmat));cap_main.append(guide)
  mount=add_fixed(cube('Guide support',(x,14.8,0),(2.5,20,4),fixedmat,.2));cap_main.append(mount)
 close_hidden.extend(cap_main)
 # Separate magnified layer diagram. This does not depict the actual SingleTact layer stack or thickness.
 expanded=[]
 b=cyl('Diagram rigid backing',168.8,10,1.6,fixedmat);expanded.append(b)
 rb=cyl('Diagram rear conductive layer',170,9,.8,purple);expanded.append(rb)
 diag_dielectric=cyl('Diagram soft dielectric',172.4,9,4,yellow);expanded.append(diag_dielectric)
 diag_front=cyl('Diagram front conductive layer',174.8,9,.8,purple);expanded.append(diag_front)
 diag_pad=cyl('Diagram pressure pad',177,7.0,3.6,blue);expanded.append(diag_pad)
 for o in expanded:boolean(o,cube('Diagram section',(173,-25,0),(30,50,40)))
 close_only.extend(expanded)
 sensor_target=(168.9,-4,0);detail_target=(170.55,-3.2,0)
 sensor_label='Thin capacitive sensor';detail_label='Load-spreading pad'
 close_position=(212,-120,55);close_target=(172.5,0,0);close_scale=76

# Studio and camera. Motion is explicitly illustrative; never show a fabricated gf reading.
floor=cube('Backdrop',(187,0,-36),(600,600,.5),mat('Backdrop',(.86,.89,.88)))
for name,loc,power,size in [('Key',(200,-130,200),400000,160),('Fill',(150,100,130),220000,150),('Rim',(260,20,100),180000,100)]:
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=name;o.data.energy=power;o.data.size=size;o.rotation_euler=(Vector((184,0,0))-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.object.camera_add(location=(215,-260,110));cam=bpy.context.object;s.camera=cam;cam.data.type='ORTHO';cam.data.clip_start=.1;cam.data.clip_end=2000
ui=bpy.data.objects.new('Camera labels',None);s.collection.objects.link(ui);ui.parent=cam;REF=140;U=REF/W
font=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial.ttf');bold=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial Bold.ttf')
def text(name,body,x,y,size,m=ink,b=False):
 cu=bpy.data.curves.new(name,'FONT');cu.body=body;cu.size=size*U;cu.font=bold if b else font;cu.align_y='TOP'
 o=bpy.data.objects.new(name,cu);s.collection.objects.link(o);o.parent=ui;o.location=((x-W/2)*U,(H/2-y)*U,-4);cu.materials.append(m);return o
def panel(name,x,y,w,h,m=paper):
 me=bpy.data.meshes.new(name);me.from_pydata([((xx-W/2)*U,(H/2-yy)*U,-5) for xx,yy in [(x,y),(x+w,y),(x+w,y+h),(x,y+h)]],[],[(0,1,2,3)])
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);o.parent=ui;me.materials.append(m);return o
panel('Header',0,0,W,125);panel('Footer',0,730,W,170)
text('Kicker','SOLESENSE   /   FOUR WAYS TO SENSE FORCE   /   CONCEPT C03',42,23,17,accent,True)
text('Title',NAME[:2]+'  /  '+TITLE,42,51,38,ink,True)
text('Subtitle','Replaceable filament cartridge + reusable internal sensing mechanism',42,98,18,muted)
text('Legend','GOLD  replaceable cartridge     BLUE  moving parts     DARK TEAL  fixed supports',42,831,17,muted,True)
text('Limitations','ILLUSTRATIVE MOTION  •  Geometry, clearances and 1 / 10 / 75 gf performance require engineering and calibration.',42,864,16,muted)
captions=[]
for i,(title,detail) in enumerate(STEPS):
 captions.append([text('Chapter '+str(i),['01  /  ARRANGEMENT','02  /  PRESS','03  /  SENSOR CLOSE-UP','04  /  RELEASE + READOUT'][i],42,746,16,accent,True),text('Action '+str(i),title,42,773,27,ink,True),text('Detail '+str(i),detail,42,807,17,muted)])

labels=[]
def callout(body,x,y,p,colour=ink,close=False):
 o=text('Label '+body,body,x,y,18,colour,True)
 me=bpy.data.meshes.new('Leader '+body);me.from_pydata([(0,0,0)]*4,[],[(0,1,2,3)])
 line=bpy.data.objects.new('Leader '+body,me);s.collection.objects.link(line);line.parent=ui;me.materials.append(colour)
 labels.append((o,line,x,y,p,close))
callout(sensor_label,85,190,sensor_target)
callout(detail_label,80,615,detail_target,accent)
callout('Replaceable cartridge',1000,180,(200,0,8),amber)
callout('Filament touches the skin',1030,675,(222,0,0),amber)
if MODE in ['magnetic','optical']:callout('Metal flexures',570,180,(166,-10,12),accent)
else:callout('Fixed to the housing',515,180,(158,0,10) if MODE=='inline' else (166,0,7),accent)
if MODE=='capacitive':
 callout('Rigid backing',100,200,(168.8,0,8),accent,True)
 callout('Soft dielectric layer',90,590,(172.4,0,0),amber,True)
 callout('Conductive layers',955,190,(174.8,0,7),ink,True)
 callout('Force from the cartridge',1000,580,(178,0,0),blueink,True)
else:
 callout(sensor_label,90,190,sensor_target,ink,True)
 callout(detail_label,100,610,detail_target,accent,True)
 if MODE in ['magnetic','optical']:callout('Moving holder',1030,190,(188,0,2),blueink,True)
 else:callout('Short force path',1030,190,(185,0,2),blueink,True)

signal_ui=[panel('Signal card',1050,405,345,140),text('Signal heading',SIGNAL,1070,422,20,ink,True),text('Signal note','Illustrative signal only',1070,500,15,muted),text('Calibration mapping','Calibration  →  force in gf',1070,522,15,accent,True)]
signal_bg=panel('Signal track',1070,463,290,13,mat('Track',(.80,.85,.84),emission=True));signal_ui.append(signal_bg)
signal_bg.location.z=.10
# Progress fill has its origin at its left edge, so scaling does not move its baseline.
signal_fill=panel('Signal fill',1070,463,290,13,accent)
for v in signal_fill.data.vertices:v.co.x-=(1070-W/2)*U
signal_fill.location.x=(1070-W/2)*U;signal_ui.append(signal_fill)
signal_fill.location.z=.15
push_label=text('Force label','CONTACT FORCE',1080,310,17,amber,True)
me=bpy.data.meshes.new('Force arrow');me.from_pydata([((x-W/2)*U,(H/2-y)*U,-4) for x,y in [(1040,350),(1068,334),(1068,345),(1200,345),(1200,355),(1068,355),(1068,366)]],[],[(0,1,2,3,4,5,6)])
arrow=bpy.data.objects.new('Force arrow',me);s.collection.objects.link(arrow);arrow.parent=ui;me.materials.append(amber)
layer_note=text('Layer diagram note','LAYER DIAGRAM  /  thickness greatly enlarged',445,665,18,muted,True)

def ease(t,a,b):return soften((t-a)/(b-a))
def show(o,v,f):o.hide_render=not v;o.keyframe_insert('hide_render',frame=f)
def camera(pos,target,scale,f):
 cam.location=pos;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale
 cam.keyframe_insert('location',frame=f);cam.keyframe_insert('rotation_euler',frame=f);cam.data.keyframe_insert('ortho_scale',frame=f)
 ui.scale=(scale/REF,)*3;ui.keyframe_insert('scale',frame=f)
def leader(line,x,y,point):
 p=world_to_camera_view(s,cam,Vector(point));sx=p.x*W;sy=(1-p.y)*H;ax=x+70;ay=y+24;dx=sx-ax;dy=sy-ay;n=max(1,math.hypot(dx,dy));nx=-dy/n*.65;ny=dx/n*.65
 for v,(px,py) in zip(line.data.vertices,[(ax+nx,ay+ny),(ax-nx,ay-ny),(sx-nx,sy-ny),(sx+nx,sy+ny)]):v.co=((px-W/2)*U,(H/2-py)*U,-4.2)

origins={o.name:o.location.copy() for o in moving};frame_manifest=[]
for f in range(1,s.frame_end+1):
 t=(f-1)/FPS;close=8<=t<12;chapter=0 if t<3 else 1 if t<8 else 2 if t<12 else 3
 q=ease(t,4,6)*(1-ease(t,12.5,14.5))
 if close:q=(1-ease(t,8.3,9.4))+ease(t,9.7,11)
 for o in moving:
  o.location.x=origins[o.name].x-STROKE*q*o.get('fractional_motion',1);o.keyframe_insert('location',frame=f)
 for k in keys:k.value=q;k.keyframe_insert('value',frame=f)
 surface.location.x=242.2-1.3*ease(t,3,4)-STROKE*q+4*ease(t,12.5,14.5);surface.keyframe_insert('location',frame=f)
 if MODE=='optical':
  strength=1-.85*q;bs=receive_mat.node_tree.nodes.get('Principled BSDF');bs.inputs['Emission Strength'].default_value=strength;bs.inputs['Emission Strength'].keyframe_insert('default_value',frame=f)
 if MODE=='capacitive':
  dielectric.scale.z=1 # Cylinder rotation was applied; its thickness axis is local X.
  dielectric.scale.x=1-.6*q;dielectric.location.x=168.90-.03*q;dielectric.keyframe_insert('scale',frame=f);dielectric.keyframe_insert('location',frame=f)
  diag_dielectric.scale.x=1-.3*q;diag_dielectric.location.x=172.4-.6*q;diag_dielectric.keyframe_insert('scale',frame=f);diag_dielectric.keyframe_insert('location',frame=f)
  for o,base in [(diag_front,174.8),(diag_pad,177)]:o.location.x=base-1.2*q;o.keyframe_insert('location',frame=f)
  # Diagram cut was applied in local coordinates; scaling compresses its thickness about the midpoint.
 camera(close_position,close_target,close_scale,f) if close else camera((215,-260,110),(189,0,1),160,f)
 s.frame_set(f);bpy.context.view_layer.update()
 for i,group in enumerate(captions):
  for o in group:show(o,i==chapter,f)
 for o,line,x,y,p,isclose in labels:
  show(o,isclose==close,f);show(line,isclose==close,f)
  if f==(193 if isclose else 1):leader(line,x,y,p)
 for o in main_only+close_hidden:show(o,not close,f)
 for o in close_only:show(o,close,f)
 for o in signal_ui:show(o,close,f)
 signal_fill.scale.x=.12+.8*((1-q) if MODE=='optical' else q);signal_fill.keyframe_insert('scale',frame=f)
 show(layer_note,close and MODE=='capacitive',f)
 show(push_label,4<=t<8 or 12<=t<14.5,f);show(arrow,4<=t<8 or 12<=t<14.5,f)
 frame_manifest.append({'frame':f,'pose':round(q,8),'skin_x':round(surface.location.x,8),'shot':'close' if close else 'main','chapter':chapter,'arrow':4<=t<8 or 12<=t<14.5})

for action in bpy.data.actions:
 for layer in action.layers:
  for strip in layer.strips:
   if strip.type=='KEYFRAME':
    for bag in strip.channelbags:
     for fc in bag.fcurves:
      for k in fc.keyframe_points:k.interpolation='LINEAR'
for frame,title in [(1,'Arrangement'),(73,'Press'),(193,'Sensor close-up'),(289,'Release + readout')]:s.timeline_markers.new(title,frame=frame)
s['moving_parts']=json.dumps([o.name for o in moving]);s['fixed_parts']=json.dumps([o.name for o in fixed_objects]);s['source']='C03 conceptual mechanisms; see README for manufacturer references and limitations.'
note=bpy.data.texts.new('Concept notes')
note.write('Educational animation, not manufacturing CAD or mechanical simulation. Original R04 is unchanged.\nParts are schematic. Inline S-beam envelope is approximately 19.1 x 6.7 x 17.5 mm, based on the LSB200 family, but slots and gauges are illustrative. Hall/optical parts and flexures are unselected custom geometry. Capacitive whole-head disk is 8 mm x 0.30 mm; the magnified layer diagram is not a manufacturer cross-section.\nMotion is prescribed and enlarged. No stiffness, strain, signal amplitude, force reading or 1/10/75 gf accuracy has been calculated or demonstrated. Sensor signal bars are qualitative.\nThe cartridge flange starts 2.4 mm clear of the nose. Clearance guides in the capacitive concept are schematic, with no validated friction, preload or retention scheme. Service locking, overload protection, hygiene sealing, gravity compensation, interference, wiring and calibration remain to be engineered.\nThe fixed and moving components have animation checks only. Retaining the replaceable cartridge does not establish that one filament can transmit every target force; buckling must be considered.\n')
s.frame_set(1);bpy.ops.file.pack_all();bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad'/f'{NAME}.blend'))
(OUT/'source'/f'{NAME}_frames.json').write_text(json.dumps(frame_manifest))
if '--preview' in args:
 for f,tag in [(145,'Cutaway'),(193,'Closeup')]:
  s.frame_set(f);s.render.filepath=str(OUT/'previews'/f'{NAME}_{tag}.png');bpy.ops.render.render(write_still=True)
print('BUILT',NAME,flush=True)
