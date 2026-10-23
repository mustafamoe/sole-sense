"""Render exact R08 assembly meshes in a separate background Blender process.
Illustrative exploded separation; assembly transforms do not certify insertion clearance.
No released design or open Blender scene is modified.
"""
import bpy, sys, json, math, argparse
from pathlib import Path
from mathutils import Vector, Matrix
from bpy_extras.object_utils import world_to_camera_view
HERE=Path(__file__).resolve().parent;sys.path.insert(0,str(HERE))
from content import ROOT,GUIDE,PARTS
R=ROOT/'revisions/R08';A=GUIDE/'assets';A.mkdir(exist_ok=True)
p=argparse.ArgumentParser();p.add_argument('--preview',action='store_true');p.add_argument('--render',action='store_true');p.add_argument('--only');a=p.parse_args(sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else [])
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='R08 assembly guide - exact CAD geometry';s.render.engine='BLENDER_WORKBENCH';s.render.resolution_x=1400;s.render.resolution_y=1000;s.render.resolution_percentage=100;s.render.film_transparent=True;s.render.image_settings.file_format='PNG';s.render.image_settings.color_mode='RGBA'
s.display.shading.light='STUDIO';s.display.shading.studio_light='paint.sl';s.display.shading.color_type='OBJECT';s.display.shading.show_shadows=True;s.display.shading.show_cavity=True;s.display.shading.cavity_type='BOTH';s.display.shading.curvature_ridge_factor=1.15;s.display.shading.curvature_valley_factor=1.05;s.display.shading.cavity_ridge_factor=1.1;s.display.shading.cavity_valley_factor=1.1;s.display.shading.show_specular_highlight=True
s.view_settings.view_transform='Standard';s.view_settings.look='None';s.render.fps=12;s.world.color=(.8,.8,.8)
O={};meta={}
for d in json.loads((R/'source/assembly_manifest.json').read_text()):
 if d['group'] in ['Handle','Interface','Vibration_head','Legacy_contact_concept'] or d['name'].startswith(('38_','39_','52_','58_','59_')):continue
 bpy.ops.wm.stl_import(filepath=str(R/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];O[o.name]=o;meta[o.name]=d
 for face in o.data.polygons:face.use_smooth=True
 mod=o.modifiers.new('Sharp CAD edges','EDGE_SPLIT');mod.split_angle=.52
 c=(.79,.82,.82)
 if o.name.startswith(('44_','46_','49_','53_')):c=(.28,.58,.78)
 if o.name.startswith(('47_','51_','56_','57_')):c=(.13,.65,.56)
 if o.name.startswith(('50_','55_','REF_Magnet_6')):c=(.91,.34,.20)
 if d['group']=='Fasteners' or o.name.startswith('REF_Service'):c=(.85,.68,.33)
 if o.name.startswith('REF_DRV'):c=(.48,.35,.65)
 if o.name.startswith('REF_Hall'):c=(.68,.66,.6)
 o.color=(*c,1)
# Additional nut reference envelopes, placed at the CAD pocket centres.
def clone_nut(name,src,at):
 base=O[src];o=base.copy();o.data=base.data.copy();s.collection.objects.link(o);o.name=name
 points=[v.co for v in o.data.vertices];c=(Vector((min(v.x for v in points),min(v.y for v in points),min(v.z for v in points)))+Vector((max(v.x for v in points),max(v.y for v in points),max(v.z for v in points))))/2
 for v in o.data.vertices:v.co+=Vector(at)-c
 O[name]=o;return o
for i,y in enumerate([0,14],1):clone_nut('Sensor_Nut_'+str(i),'REF_Lid_Nut_1_1',(170,y,-17.8))
clone_nut('Cartridge_Nut','REF_Flexure_Moving_Nut_1',(240,0,11.6))
clone_nut('Cover_Service_Nut','REF_Lid_Nut_1_1',(226,7,17.4))
for i,(x,y) in enumerate([(235.5,-15.8),(235.5,15.8),(226,7)],1):clone_nut('Bridge_Nut_'+str(i),'REF_Lid_Nut_1_1',(x,y,17.4))
# An illustrative insulated wire bundle follows fixed structure to the real side port.
for i,y in enumerate([5.73,7,8.27]):
 cu=bpy.data.curves.new('Wire route','CURVE');cu.dimensions='3D';cu.bevel_depth=.42;cu.bevel_resolution=2
 sp=cu.splines.new('POLY');pts=[(169.6,y,-9),(169.6,y,-12),(167.8,y,-12),(167.8,20+i*.8,-12),(180,20+i*.8,-10),(180,34,-9.5)]
 sp.points.add(len(pts)-1)
 for v,pt in zip(sp.points,pts):v.co=(*pt,1)
 o=bpy.data.objects.new('Wire_'+str(i),cu);s.collection.objects.link(o);o.color=(*[(.7,.24,.17),(.18,.23,.26),(.85,.61,.18)][i],1);O[o.name]=o
bpy.ops.object.camera_add();cam=bpy.context.object;cam.name='Guide camera';cam.data.type='ORTHO';cam.data.clip_end=5000;s.camera=cam

def keys(*prefix):return [n for n in O if n.startswith(prefix)]
SHELL=keys('41_','42_','REF_Adaptor','REF_Flexure_Fixed_Nut','Sensor_Nut')
CARR=keys('44_','46_','REF_Magnet','REF_Flexure_Moving_Nut')
MOVING=CARR+keys('57_','REF_Flexure_Moving_Screw','51_','REF_Cartridge','Cartridge_Nut')
SENSOR=keys('47_','REF_DRV','REF_Hall','REF_Sensor','Wire_')
BRIDGE=keys('55_','Bridge_Nut','REF_Lid_Screw_2')
PIN=keys('50_','REF_Service')
FIXED=keys('REF_Flexure_Fixed_Screw')
COVER=keys('43_','56_','REF_Lid_','Cover_Service')
BASE=SHELL+MOVING+FIXED
FINAL=BASE+SENSOR+COVER+keys('49_')
VIEWS=['hero','chassis','magnet','moving','lock','lower','bridge','fixed','sensor','cover','cartridge','check']
DIRS={'hero':(1.2,-1.6,1.2),'chassis':(-1.1,-1.2,-1.5),'magnet':(-1.2,-1.8,1.25),'moving':(.65,-1.4,-1.6),'lock':(1.4,-1.4,1.2),'lower':(.65,-1.3,1.65),'bridge':(.8,-1.2,1.65),'fixed':(.15,-.5,2.6),'sensor':(-.9,1.4,1.5),'cover':(.6,-1.4,1.5),'cartridge':(1.5,-1.2,1.0),'check':(1.0,-1.6,1.3)}
DIRS.update({'post_nuts':(.4,1,-1.5),'cover_nuts':(.4,-.8,-1.8),'bridge_nuts':(.2,-.8,-1.8),'sensor_close':(1.2,-2,1.5),'cassette':(0,-.15,2)})
DETAIL_VIEWS=['post_nuts','cover_nuts','bridge_nuts','sensor_close','cassette']
ANCHORS={}
def ease(q):q=max(0,min(1,q));return q*q*(3-2*q)
def ramp(q,a,b):return ease((q-a)/(b-a))
def show(names):
 for n in names:O[n].hide_render=False

def shift(names,v):
 for n in names:O[n].location+=Vector(v)
def visibility(names,state):
 for n in names:O[n].hide_render=not state

def pose(view,q):
 for o in O.values():o.hide_render=True;o.location=(0,0,0);o.rotation_euler=(0,0,0)
 if view=='post_nuts':show(keys('44_','REF_Magnet_Nut','REF_Flexure_Moving_Nut'));return
 if view=='cover_nuts':show(keys('43_','REF_Lid_Nut','Cover_Service'));return
 if view=='bridge_nuts':show(keys('55_','Bridge_Nut'));return
 if view=='sensor_close':show(keys('47_','REF_DRV','REF_Hall','REF_Magnet_6'));return
 if view=='cassette':show(keys('57_'));return
 if view=='hero':show(FINAL);return
 if view=='chassis':
  show(SHELL)
  shift(keys('41_'),(-15*(1-ramp(q,.1,.5)),0,0));shift(keys('REF_Adaptor_Screw'),(-28*(1-ramp(q,.5,1)),0,0))
  shift(keys('REF_Flexure_Fixed_Nut','Sensor_Nut'),(0,0,-10*(1-ramp(q,0,.4))))
 elif view=='magnet':
  show(CARR)
  shift(keys('REF_Magnet_6'),(-12*(1-ramp(q,0,.35)),0,0));shift(keys('46_'),(-24*(1-ramp(q,.35,.7)),0,0));shift(keys('REF_Magnet_Screw'),(-34*(1-ramp(q,.7,1)),0,0))
 elif view=='moving':
  show(CARR+keys('57_','REF_Flexure_Moving_Screw'))
  shift(keys('57_'),(0,0,-11*(1-ramp(q,0,.5))));shift(keys('REF_Flexure_Moving_Screw'),(0,0,-25*(1-ramp(q,.5,1))))
 elif view=='lock':
  show(keys('44_','51_','REF_Cartridge','Cartridge_Nut'))
  shift(keys('51_','REF_Cartridge'),(0,0,16*(1-ramp(q,.35,1))+3))
  shift(['Cartridge_Nut'],(-10*(1-ramp(q,0,.35)),0,0))
 elif view=='lower':
  show(SHELL+MOVING);shift(MOVING,(0,0,33*(1-ramp(q,0,1))))
  shift(keys('51_','REF_Cartridge'),(0,0,3))
 elif view=='bridge':
  show(BASE+BRIDGE+PIN);visibility(FIXED,False)
  shift(keys('55_','Bridge_Nut'),(0,0,22*(1-ramp(q,0,.4))));shift(keys('REF_Lid_Screw_2'),(0,0,-15*(1-ramp(q,.4,.7))));shift(PIN,(0,0,42*(1-ramp(q,.7,1))))
 elif view=='fixed':
  show(BASE+BRIDGE+PIN);shift(FIXED,(0,0,20*(1-ramp(q,0,1))))
 elif view=='sensor':
  show(BASE+SENSOR)
  # Isolate the sensor, magnet, and their mounting hardware for access and orientation.
  visibility(keys('41_','REF_Adaptor','55_','Bridge_Nut'),False)
  shift(SENSOR,(0,0,17*(1-ramp(q,0,1))))
  visibility(keys('Wire_'),q>.9)
 elif view=='cover':
  show(BASE+SENSOR+COVER)
  shift(keys('43_','REF_Lid_Nut','Cover_Service'),(0,0,26*(1-ramp(q,0,.55))))
  shift(keys('56_'),(0,0,39*(1-ramp(q,.7,1))))
  shift(keys('REF_Lid_Screw'),(0,0,-20*(1-ramp(q,.55,.85))))
 elif view=='cartridge':
  show(FINAL+PIN)
  shift(keys('51_','REF_Cartridge'),(0,0,3*(1-ramp(q,.85,1))))
  for n in keys('49_'):
   o=O[n];o.location.x=24*(1-ramp(q,0,.55));o.rotation_euler.x=math.radians(30)*(1-ramp(q,.55,.85))
 elif view=='check':
  show(FINAL+PIN);shift(PIN,(0,0,40*ramp(q,0,1)))

def fit(view):
 cam.rotation_euler=Vector(DIRS[view]).to_track_quat('Z','Y').to_euler();rot=cam.rotation_euler.to_matrix();inv=rot.inverted();pts=[]
 for q in [0,.4,.7,1]:
  pose(view,q);bpy.context.view_layer.update()
  for n,o in O.items():
   if not o.hide_render:pts.extend(inv@(o.matrix_world@Vector(c)) for c in o.bound_box)
 mn=Vector(tuple(min(p[i] for p in pts) for i in range(3)));mx=Vector(tuple(max(p[i] for p in pts) for i in range(3)));mid=(mn+mx)/2
 scale=max((mx.x-mn.x)*1.18,(mx.y-mn.y)*1.18*1.4)
 cam.data.ortho_scale=scale;cam.location=rot@Vector((mid.x,mid.y,mx.z+350));bpy.context.view_layer.update()

def project(pt):
 v=world_to_camera_view(s,cam,Vector(pt));return [round(v.x*1400,2),round((1-v.y)*1000,2)]
def objpoint(n,pt):return project(O[n].matrix_world@Vector(pt))
def annotations(view):
 out={}
 if view=='chassis':
  out={'M2 rail nuts':objpoint('REF_Flexure_Fixed_Nut_1',(185.5,-21.6,-15.3)),'M3 sensor nuts':objpoint('Sensor_Nut_1',(170,0,-17.8)),'41 adaptor':objpoint('41_R04_Joint_Adaptor',(159,0,23))}
 elif view=='magnet':
  out={'6 x 3 magnet':objpoint('REF_Magnet_6x3_Axial',(180,7,0)),'46 retainer':objpoint('46_Magnet_Retainer',(178,7,4)),'Post nut slots':project((215,11,-5.4))}
 elif view=='moving':
  out={'Wide moving rail':objpoint('57_Printed_Flexure_080',(203,7.4,-11)),'Narrow fixed rail':objpoint('57_Printed_Flexure_080',(203,-22,-10)),'UP from below':objpoint('REF_Flexure_Moving_Screw_2',(215,7.4,-12))}
 elif view=='lock':out={'M2 nut side slot':objpoint('Cartridge_Nut',(240,0,11.6)),'M2 x 12 lock':objpoint('REF_Cartridge_Lock_M2x12',(240,0,16))}
 elif view=='lower':out={'Fixed-rail pads':project((185.5,-21.6,-11)),'Shoulder between stops':objpoint('44_Moving_Carriage',(226,7,-7))}
 elif view=='bridge':out={'55 bridge':objpoint('55_Spring_Assembly_Bridge',(235,0,19)),'M3 x 30 service screw':objpoint('50_Service_Lock_Knob',(226,7,28)),'Two screws from below':objpoint('REF_Lid_Screw_2_1',(235.5,-15.8,-18))}
 elif view=='fixed':out={'DOWN from above':objpoint('REF_Flexure_Fixed_Screw_1',(185.5,-21.6,-7)),'Front screw access notch':project((222.5,-21.6,19))}
 elif view=='sensor':out={'Flat face toward magnet':objpoint('REF_DRV5055A3QLPG_Envelope',(171,7,0)),'47 stationary mount':objpoint('47_Adjustable_Hall_Mount',(169,15,-13)),'Fixed wire route':objpoint('Wire_1',(180,30,-9.5))}
 elif view=='cover':out={'43 cover + 5 nuts':objpoint('43_Removable_Lid',(205,-13,23)),'Four underside screws':objpoint('REF_Lid_Screw_2_1',(235.5,-15.8,-18))}
 elif view=='cartridge':out={'49 bench cartridge':objpoint('49_Bench_Calibration_Cartridge',(255.3,0,0)),'Small lock':objpoint('51_Cartridge_Lock_Knob',(240,0,18)),'Service screw installed':project((226,7,29))}
 elif view=='check':out={'Remove the WHOLE screw':objpoint('REF_Service_Pin_M3x30',(226,7,18)),'Small lock stays tight':project((240,0,18))}
 if view=='moving':out['__arrows__']=[[project((x,7.4,-34)),project((x,7.4,-15))] for x in [188,215]]
 if view=='fixed':out['__arrows__']=[[project((x,-21.6,12)),project((x,-21.6,-4))] for x in [185.5,222.5]]
 return out

def render(path):s.render.filepath=str(path);bpy.ops.render.render(write_still=True)
# Individual identification views preserve shape; each card is independently scaled.
if a.preview and not a.only:
 for pid,title in PARTS:
  n=next(n for n in O if n.startswith(pid+'_'));show([])
  for o in O.values():o.hide_render=True;o.location=(0,0,0);o.rotation_euler=(0,0,0)
  O[n].hide_render=False;pts=[O[n].matrix_world@Vector(p) for p in O[n].bound_box];center=sum(pts,Vector())/8
  direction=Vector((.5,-.8,1.5)) if pid not in ['44','46','47','48','49','53'] else Vector((-1,-1.5,1.1))
  if pid=='57':direction=Vector((0,-.15,2))
  cam.rotation_euler=direction.to_track_quat('Z','Y').to_euler();rot=cam.rotation_euler.to_matrix();inv=rot.inverted();pp=[inv@p for p in pts];mn=Vector(tuple(min(p[i] for p in pp) for i in range(3)));mx=Vector(tuple(max(p[i] for p in pp) for i in range(3)));mid=(mn+mx)/2
  cam.data.ortho_scale=max(mx.x-mn.x,(mx.y-mn.y)*1.4)*1.2;cam.location=rot@Vector((mid.x,mid.y,mx.z+350));s.render.resolution_percentage=50
  render(A/f'part_{pid}.png')
 s.render.resolution_percentage=100
for view in VIEWS+(DETAIL_VIEWS if a.preview else []):
 if a.only and view not in a.only.split(','):continue
 fit(view)
 if a.preview:
  for label,q in [('start',0),('detail',.28),('end',1)]:
   pose(view,q);bpy.context.view_layer.update();render(A/f'{view}_{label}.png');(A/f'{view}_{label}.json').write_text(json.dumps(annotations(view)))
 if a.render:
  dest=A/'motion24'/view;dest.mkdir(parents=True,exist_ok=True)
  for f in range(97):
   file=dest/f'{f:04}.png'
   if file.exists():continue
   pose(view,f/96);bpy.context.view_layer.update();render(file)
  print('VIEW_COMPLETE',view,flush=True)
pose('hero',1);fit('hero');bpy.ops.wm.save_as_mainfile(filepath=str(GUIDE/'SoleSense_R08_Assembly_Guide.blend'))
print('R08_GUIDE_GEOMETRY_COMPLETE',flush=True)
