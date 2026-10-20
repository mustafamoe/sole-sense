"""Render additional review angles from the existing R03 CAD-derived scene.
No mechanical geometry or print files are modified.
"""
import bpy, math, json, sys
from pathlib import Path
from mathutils import Vector
O=Path(__file__).resolve().parents[1]
D=O/'previews/expanded';D.mkdir(parents=True,exist_ok=True)
base=bpy.data.scenes['01 • Assembly']
manifest=json.loads((O/'source/assembly_manifest.json').read_text())
meta={d['name']:d for d in manifest}
filament_refs=['SG90','Nylon','Probe_','TCST','Stock_Horn']
def is_filament(n):return meta.get(n,{}).get('group')=='Filament_head' or any(k in n for k in filament_refs)
def is_vibration(n):return meta.get(n,{}).get('group')=='Vibration_head' or any(k in n for k in ['CoinMotor','Vibration_Driver'])
# More contrast than the initial studio renders, with the same part colors.
mat=bpy.data.materials.get('Surface')
if mat:
 mat.diffuse_color=(.12,.16,.185,1)
 mat.node_tree.nodes.get('Principled BSDF').inputs['Base Color'].default_value=(.12,.16,.185,1)
for o in base.objects:
 if o.type=='LIGHT':o.data.energy*=.65
base.world.color=(.2,.23,.25)
scenes=[]

def clone(name):
 s=bpy.data.scenes.new(name);s.world=base.world;s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
 objs={}
 for o in base.objects:
  ob=o.copy();s.collection.objects.link(ob);objs[o.name]=ob
  if o==base.camera:ob.data=o.data.copy();s.camera=ob
 s.render.engine='CYCLES';s.cycles.samples=32;s.cycles.use_denoising=True
 s.render.resolution_x=2000;s.render.resolution_y=1300;s.render.resolution_percentage=100
 s.render.image_settings.file_format='PNG';s.view_settings.view_transform='AgX';s.view_settings.exposure=-.15
 s.render.film_transparent=False
 return s,objs

def shift(ob,xyz):ob.location+=Vector(xyz)
def hide(ob):ob.hide_render=True

def emat(name,c):
 m=bpy.data.materials.get(name)
 if m:return m
 m=bpy.data.materials.new(name);m.use_nodes=True
 nodes=m.node_tree.nodes;nodes.clear();out=nodes.new('ShaderNodeOutputMaterial');e=nodes.new('ShaderNodeEmission');e.inputs['Color'].default_value=(*c,1);e.inputs['Strength'].default_value=.9;m.node_tree.links.new(e.outputs[0],out.inputs[0]);return m

def title(s,text,sub):
 cam=s.camera;scale=cam.data.ortho_scale;h=scale*s.render.resolution_y/s.render.resolution_x;q=cam.rotation_euler.to_quaternion()
 me=bpy.data.meshes.new('Header band');me.from_pydata([(-.5*scale,.325*h,0),(.5*scale,.325*h,0),(.5*scale,.5*h,0),(-.5*scale,.5*h,0)],[],[(0,1,2,3)])
 band=bpy.data.objects.new('Header band',me);s.collection.objects.link(band);band.rotation_euler=cam.rotation_euler;band.location=cam.location+q@Vector((0,0,-40.2));band.data.materials.append(emat('Header backdrop',(.018,.030,.037)));band['role']='annotation'
 for n,txt,x,y,size,col in [('Title',text,-.445*scale,.405*h,.025*scale,(.91,.96,.97)),('Caption',sub,-.445*scale,.345*h,.011*scale,(.70,.82,.85)),('Footer','SOLESENSE  /  R03  /  ENGINEERING PROTOTYPE',-.445*scale,-.445*h,.0083*scale,(.60,.72,.76))]:
  cu=bpy.data.curves.new(n,'FONT');cu.body=txt;cu.size=size;cu.align_x='LEFT';cu.extrude=0
  ob=bpy.data.objects.new(n,cu);s.collection.objects.link(ob);ob.rotation_euler=cam.rotation_euler;ob.location=cam.location+q@Vector((x,y,-40));cu.materials.append(emat('Annotation '+n,col));ob['role']='annotation'

def frame(s,obs,direction,scale=None,target=None,floor=True):
 visible=[o for o in obs.values() if o.type=='MESH' and not o.hide_render and o.name.split('.')[0]!='Studio surface']
 points=[o.matrix_world@Vector(c) for o in visible for c in o.bound_box]
 # Updated object transforms are evaluated explicitly, since scene clones are not the current scene yet.
 points=[]
 for ob in visible:
  matrix=ob.matrix_basis
  points.extend(matrix@Vector(v) for v in ob.bound_box)
 direction=Vector(direction).normalized();q=(-direction).to_track_quat('-Z','Y');inv=q.inverted()
 if target is None:
  projected=[inv@p for p in points]
  lo=Vector(tuple(min(p[i] for p in projected) for i in range(3)));hi=Vector(tuple(max(p[i] for p in projected) for i in range(3)))
  cen=(lo+hi)/2
  # Reserve the upper portion of the frame for title/caption.
  span=hi-lo;aspect=s.render.resolution_x/s.render.resolution_y
  scale=max(span.x*1.16,span.y*aspect*1.43)
  cen.y+=scale/aspect*.035
  target=q@cen
 else:target=Vector(target)
 cam=s.camera;cam.data.type='ORTHO';cam.data.ortho_scale=scale;cam.data.clip_end=5000;cam.location=target+direction*900;cam.rotation_euler=q.to_euler()
 ground=obs.get('Studio surface')
 if ground:
  ground.hide_render=not floor
  if floor:ground.location.z=min(p.z for p in points)-2
 for ob in obs.values():ob.hide_viewport=ob.hide_render

# 05: opposite side from the original view.
s,obs=clone('05 • Opposite quarter')
frame(s,obs,(-1.0,2.3,1.4))
title(s,'Opposite side','Filament head attached; vibration head shown alongside.')
scenes.append((s,'05_Opposite_Quarter'))
# 06: orthographic plan, both heads in the same frame.
s,obs=clone('06 • Top view')
frame(s,obs,(0,0,1))
title(s,'Top view','Display, response button, power switch and interchangeable head proportions.')
scenes.append((s,'06_Top_View'))
# 07: lower shell and charging access, without a floor hiding the view.
s,obs=clone('07 • Underside')
frame(s,obs,(-.45,-2,-1.25),floor=False)
title(s,'Underside','Lower enclosure, shell seam and USB-C charging opening.')
scenes.append((s,'07_Underside'))
# 08: deliberately separate subassemblies so each electronics layer can be seen.
s,obs=clone('08 • Exploded handle')
for n,ob in obs.items():
 if is_filament(n) or is_vibration(n) or n.startswith('Head retaining'):hide(ob);continue
 if n.startswith('02_'):shift(ob,(0,0,75))
 elif n.startswith(('12_','REF_Power_Slide')):shift(ob,(0,0,75))
 elif n.startswith(('REF_OLED','Display glass')):shift(ob,(0,0,105))
 elif n.startswith('30_'):shift(ob,(0,0,93))
 elif n.startswith(('03_','REF_Controller')):shift(ob,(-6,-38,36))
 elif n.startswith('REF_18650'):shift(ob,(0,0,13))
 elif n.startswith(('04_','REF_TP4056')):shift(ob,(0,-53,12))
 elif n.startswith(('05_','REF_MicroSD')):shift(ob,(5,15,29))
 elif n.startswith(('20_','REF_Pololu')):shift(ob,(5,15,58))
 elif n.startswith(('29_','REF_Button')):shift(ob,(0,0,29))
 elif n.startswith(('31_','REF_1S_Protection')):shift(ob,(7,0,16))
 elif n.startswith(('06_','REF_MicroFit')):shift(ob,(28,0,10))
 elif n.startswith('14_'):shift(ob,(0,-8,18))
frame(s,obs,(1.3,-2.4,1.35))
title(s,'Exploded handle','PCB and connector blocks represent nominal hardware envelopes; trays and shell are printable parts.')
scenes.append((s,'08_Exploded_Handle'))
# 09: head shell, actuator, cartridge stack, guide and sensor all separated.
s,obs=clone('09 • Exploded filament head')
for n,ob in obs.items():
 if ob.type not in ['MESH','CURVE']:continue
 if n=='Studio surface':continue
 if not is_filament(n):hide(ob);continue
 if n.startswith('07_'):shift(ob,(0,0,-77))
 elif n.startswith('08_'):shift(ob,(105,0,5))
 elif n.startswith('REF_Stock_Horn'):shift(ob,(10,0,0))
 elif n.startswith('21_'):shift(ob,(22,0,0))
 elif n.startswith(('22_','REF_Nylon_1')):shift(ob,(35,4,0))
 elif n.startswith(('23_','REF_Nylon_2')):shift(ob,(35,0,8))
 elif n.startswith(('24_','REF_Nylon_3')):shift(ob,(35,-4,0))
 elif n.startswith('25_'):shift(ob,(44,0,0))
 elif n.startswith(('26_','REF_Probe_Rod')):shift(ob,(60,0,0))
 elif n.startswith(('27_','REF_Probe_PTFE')):shift(ob,(79,0,0))
 elif n.startswith('28_'):shift(ob,(125,0,0))
 elif n.startswith('REF_TCST'):shift(ob,(56,0,-18))
frame(s,obs,(1.25,-2.5,1.6))
title(s,'Exploded filament head','SG90 cradle  /  stock horn  /  three nylon inserts  /  sliding probe  /  optical travel sensor')
scenes.append((s,'09_Exploded_Filament_Head'))
# 10: vibration module, separate cap and nominal motor/driver packages.
s,obs=clone('10 • Exploded vibration head')
for n,ob in obs.items():
 if ob.type not in ['MESH','CURVE'] or n=='Studio surface':continue
 if not is_vibration(n):hide(ob);continue
 ob.location=Vector((0,0,0))
 if n.startswith('11_'):shift(ob,(47,0,0))
 elif 'CoinMotor' in n:shift(ob,(27,0,0))
 elif 'Vibration_Driver' in n:shift(ob,(14,-8,28))
frame(s,obs,(1.3,-2.8,1.65))
title(s,'Exploded vibration head','Shared keyed pilot  /  driver-board envelope  /  coin motor  /  removable dome cap')
scenes.append((s,'10_Exploded_Vibration_Head'))

# 11: true printed interface, with split nominal connector envelopes for clarity.
s,obs=clone('11 • Head connector detail')
for n,ob in obs.items():
 if is_vibration(n) or n.startswith(('02_','12_','30_','REF_OLED','REF_Power_Slide','Display glass','REF_MicroFit')):hide(ob)
 if is_filament(n):shift(ob,(55,0,0))
 if n.startswith('Head retaining'):shift(ob,(0,13 if ob.location.y>0 else -13,0))
# Packaging envelope cuboids are explicitly illustrative; no invented contact detail.
def cube_in(s,n,lo,dim,c):
 x,y,z=lo;dx,dy,dz=dim
 vs=[(x+i*dx,y+j*dy,z+k*dz) for i,j,k in [(0,0,0),(1,0,0),(1,1,0),(0,1,0),(0,0,1),(1,0,1),(1,1,1),(0,1,1)]]
 fs=[(0,3,2,1),(4,5,6,7),(0,1,5,4),(1,2,6,5),(2,3,7,6),(3,0,4,7)]
 me=bpy.data.meshes.new(n);me.from_pydata(vs,[],fs);ob=bpy.data.objects.new(n,me);s.collection.objects.link(ob)
 m=bpy.data.materials.new(n);m.diffuse_color=(*c,1);m.use_nodes=True;m.node_tree.nodes.get('Principled BSDF').inputs['Base Color'].default_value=(*c,1);ob.data.materials.append(m);return ob
cube_in(s,'Panel connector envelope',(130.62,-4.925,-3.425),(16.89,9.85,6.85),(.035,.05,.06))
cube_in(s,'Detached head receptacle envelope',(167.5,-4.925,-3.425),(7.89,9.85,8.28),(.035,.05,.06))
def wire(s,n,pts,c,r=.45):
 cu=bpy.data.curves.new(n,'CURVE');cu.dimensions='3D';cu.resolution_u=18;cu.bevel_depth=r;cu.bevel_resolution=3
 sp=cu.splines.new('BEZIER');sp.bezier_points.add(len(pts)-1)
 for p,v in zip(sp.bezier_points,pts):p.co=v;p.handle_left_type='AUTO';p.handle_right_type='AUTO'
 ob=bpy.data.objects.new(n,cu);s.collection.objects.link(ob);m=bpy.data.materials.new(n);m.diffuse_color=(*c,1);m.use_nodes=True;m.node_tree.nodes.get('Principled BSDF').inputs['Base Color'].default_value=(*c,1);cu.materials.append(m)
for i,c in enumerate([(.045,.055,.06),(.6,.05,.025),(.83,.46,.035),(.025,.25,.32),(.26,.07,.36),(.65,.69,.70)]):
 d=(i-2.5)*.85
 wire(s,'Service lead '+str(i+1),[(175.35,d,0),(182,d,-1),(190,-8+d,-10),(198,-9+d,-5),(207,-11+d,0),(211,-19+d,0)],c,.37)
 wire(s,'Clamped handle lead '+str(i+1),[(111,-10+d*.2,-3),(119,-10+d*.2,-3),(125,-6+d*.2,-1),(127,d*.2,0),(131,d*.2,0)],c,.24)
frame(s,obs,(1.1,-2.8,1.9),scale=160,target=(158,-2,4))
title(s,'Head connection, separated','Printed key and retention screws; connector envelopes and service leads are illustrative.')
scenes.append((s,'11_Head_Connector_Detail'))
# 12: complete alternative configuration, not just the spare head.
s,obs=clone('12 • Vibration configuration')
for n,ob in obs.items():
 if is_filament(n):hide(ob)
 if is_vibration(n):ob.location=Vector((0,0,0))
frame(s,obs,(1.15,-2.4,1.4))
title(s,'Vibration configuration','The same electronics handle with the shorter vibration head fitted.')
scenes.append((s,'12_Vibration_Configuration'))

preview='--preview' in sys.argv
if preview:
 selected=[v for v in scenes if v[1].startswith(('05_','08_','09_','11_'))]
 for sc,n in selected:
  bpy.context.window.scene=sc;sc.render.resolution_percentage=50;sc.cycles.samples=16;sc.render.filepath=str(D/(n+'_draft.png'));bpy.ops.render.render(write_still=True,scene=sc.name)
else:
 # Keep the expanded native review file focused on these eight scenes.
 for old in list(bpy.data.scenes):
  if old not in [s for s,n in scenes]:bpy.data.scenes.remove(old)
 bpy.context.window.scene=scenes[0][0]
 for screen in bpy.data.screens:
  for area in screen.areas:
   if area.type=='VIEW_3D':area.spaces.active.region_3d.view_perspective='CAMERA';area.spaces.active.clip_end=5000
 bpy.ops.wm.save_as_mainfile(filepath=str(O/'cad/SoleSense_R03_Expanded_Views.blend'))
 for sc,n in scenes:
  bpy.context.window.scene=sc;sc.render.filepath=str(D/(n+'.png'));bpy.ops.render.render(write_still=True,scene=sc.name)
 (D/'views.json').write_text(json.dumps([{'scene':s.name,'image':n+'.png'} for s,n in scenes],indent=2))
print('EXPANDED_VIEWS_COMPLETE',flush=True)
