"""Numbered assembly review sheets rendered from native Blender geometry.
P IDs match existing STL prefixes. H IDs identify nominal purchased hardware.
All camera-space labels live in their own collection. No print geometry changes.
"""
import bpy, json, math, sys
from pathlib import Path
from mathutils import Vector
from mathutils.bvhtree import BVHTree
from bpy_extras.object_utils import world_to_camera_view
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'previews/labeled';OUT.mkdir(exist_ok=True,parents=True)
W,H=3200,2200
MANIFEST=json.loads((ROOT/'source/assembly_manifest.json').read_text())
PRINT_NAMES={
1:'Lower handle shell',2:'Upper handle shell',3:'ESP32 controller tray',4:'USB-C charger tray',5:'microSD tray',6:'Connector panel insert',7:'Filament head body',8:'Filament front cap',9:'SG90 strap cradle',10:'Vibration head body',11:'Vibration dome cap',12:'Response button cap',13:'Fastener fit coupon',14:'Handle wire clamp',15:'Male joint fit coupon',16:'Female fit coupon / 0.25 mm',17:'Female fit coupon / 0.35 mm',18:'Female fit coupon / 0.45 mm',19:'Connector panel fit coupon',20:'Boost converter shelf',21:'Three-position carrier',22:'Nylon cartridge 1',23:'Nylon cartridge 2',24:'Nylon cartridge 3',25:'Cartridge retainer',26:'Probe rear pad + optical flag',27:'Probe guide flange',28:'Rounded probe contact tip',29:'Tactile switch platform',30:'OLED retaining frame',31:'Battery protection tray'}
HARDWARE=[
('H01','REF_Controller','ESP32-DevKitC V4','52 x 28 x 12 mm board allowance'),
('H02','REF_OLED','SSD1306 OLED module','0.96 in; max. 27 x 27 x 5 mm'),
('H03','REF_18650','18650 battery','Pre-tabbed; max. diameter 18.6 x 67 mm'),
('H04','REF_TP4056','TP4056 USB-C charger','Module max. 28 x 17 x 5 mm'),
('H05','REF_1S_Protection','1S battery protection board','Max. 16 x 12 x 5 mm; specify >=5 A'),
('H06','REF_Pololu','Pololu U3V40F5 boost board','5 V supply; Pololu part 4012'),
('H07','REF_MicroSD','microSD SPI breakout','3.3 V module; max. 24 x 25 x 5 mm'),
('H08','REF_Button','Response tactile switch','6 x 6 x 5 mm'),
('H09','REF_Power_Slide','Power slide switch','SS12D00G3-style; boost enable'),
('H10','REF_MicroFit','Mated 6-way connector','Molex 43020-0600 + 43025-0600'),
('H11','REF_SG90','SG90 micro servo','TowerPro; nominal package shown'),
('H12','REF_Stock_Horn','Supplied SG90 servo horn','Retain original spline and centre screw'),
('H13','REF_Nylon_1','Nylon monofilament 1','38 mm free length; calibrate force'),
('H14','REF_Nylon_2','Nylon monofilament 2','38 mm free length; calibrate force'),
('H15','REF_Nylon_3','Nylon monofilament 3','38 mm free length; calibrate force'),
('H16','REF_Probe_Rod','Polished probe shaft','Diameter 3 x 20 mm'),
('H17','REF_Probe_PTFE','PTFE guide bushing','OD 4 / ID 3.2 x 7.5 mm'),
('H18','REF_TCST','TCST2103 optical interrupter','Probe travel gate; Vishay'),
('H19','REF_CoinMotor','Coin vibration motor','Adafruit 1201; diameter 10 x 2.7 mm'),
('H20','REF_Vibration_Driver','Motor driver board','Custom MOSFET board; 20 x 10 x 6 mm'),
('H21','Head retaining screw','Head retaining screws','Two M3 x 8; one may be hidden'),
('H22','Panel connector envelope','Handle-side panel plug','Molex 43020-0600; envelope only'),
('H23','Detached head receptacle','Head-side receptacle','Molex 43025-0600; envelope only'),
('H24','Service lead ','Head service harness','Six flexible conductors; loop illustrative'),
('H25','Clamped handle lead ','Handle wire bundle','Six conductors through strain relief'),
]
CAT={}
for d in MANIFEST:
 if d['kind']=='print':
  i=int(d['name'][:2]);CAT[f'P{i:02}']={'name':PRINT_NAMES[i],'prefix':d['name'],'type':'printed','detail':d.get('description',''),'stl':d['name']+'.stl','group':d['group']}
for i,p,n,d in HARDWARE:CAT[i]={'name':n,'prefix':p,'type':'hardware','detail':d}
CAT['F01']={'name':'USB-C charging opening','type':'feature','detail':'Opening in the lower handle shell'}
CAT['F02']={'name':'Head alignment key','type':'feature','detail':'Integral printed feature of each head'}
CAT['F03']={'name':'Handle pilot receiver rim','type':'feature','detail':'Integral part of the lower handle shell'}
COL={'printed':(.10,.64,.64),'hardware':(.96,.62,.23),'feature':(.65,.74,.82)}
BG=(.012,.025,.033);WHITE=(.9,.95,.96);MUTED=(.52,.65,.70)

# Separate small stacked components for readable callouts in the exploded sheets.
def find(sc,p):return [o for o in sc.objects if o.name.startswith(p) and not o.hide_render and o.type in {'MESH','CURVE'} and o.get('role')!='annotation']
def shift(sc,p,v):
 for ob in find(sc,p):ob.location+=Vector(v)
scenes=sorted(list(bpy.data.scenes),key=lambda s:s.name)
for s in scenes:
 for ob in list(s.objects):
  if ob.get('role')=='annotation':bpy.data.objects.remove(ob,do_unlink=True)
 if s.name.startswith('08'):
  for p in ['REF_Controller','REF_TP4056','REF_MicroSD','REF_Pololu','REF_1S_Protection']:shift(s,p,(0,0,10))
  shift(s,'20_', (40,-50,-22));shift(s,'REF_Pololu',(40,-50,-22))
  shift(s,'REF_Button',(0,0,9));shift(s,'REF_MicroFit',(14,0,3));shift(s,'REF_Power_Slide',(0,0,11));shift(s,'12_', (0,0,13))
 if s.name.startswith('09'):
  shift(s,'REF_SG90',(-15,-18,13));shift(s,'REF_Probe_PTFE',(12,0,8))

# Material / camera-space geometry helpers.
def emission(n,c):
 m=bpy.data.materials.get(n)
 if m:return m
 m=bpy.data.materials.new(n);m.use_nodes=True;nd=m.node_tree.nodes;nd.clear();out=nd.new('ShaderNodeOutputMaterial');e=nd.new('ShaderNodeEmission');e.inputs[0].default_value=(*c,1);e.inputs[1].default_value=1;m.node_tree.links.new(e.outputs[0],out.inputs[0]);return m

def annotations(sc):
 co=bpy.data.collections.new('LABELS | '+sc.name);sc.collection.children.link(co)
 cam=sc.camera;q=cam.rotation_euler.to_quaternion();unit=cam.data.ortho_scale/W
 def point(x,y,z=18):return cam.location+q@Vector(((x-W/2)*unit,(H/2-y)*unit,-z))
 def setup(ob):
  co.objects.link(ob);ob['role']='annotation'
  for attr in ['visible_shadow','visible_diffuse','visible_glossy','visible_transmission','visible_volume_scatter']:
   if hasattr(ob,attr):setattr(ob,attr,False)
 def poly(n,pts,c,z=18):
  me=bpy.data.meshes.new(n);me.from_pydata([point(x,y,z) for x,y in pts],[],[tuple(range(len(pts)))]);ob=bpy.data.objects.new(n,me);setup(ob);me.materials.append(emission('Label '+str(c),c));return ob
 def rect(n,x,y,w,h,c,z=18):return poly(n,[(x,y),(x+w,y),(x+w,y+h),(x,y+h)],c,z)
 def txt(n,body,x,y,size,c=WHITE,center=False,z=17):
  cu=bpy.data.curves.new(n,'FONT');cu.body=body;cu.size=size*unit;cu.align_x='CENTER' if center else 'LEFT';cu.align_y='CENTER' if center else 'TOP';cu.space_character=1.05
  ob=bpy.data.objects.new(n,cu);setup(ob);ob.location=point(x,y,z);ob.rotation_euler=cam.rotation_euler;cu.materials.append(emission('Label '+str(c),c));return ob
 def line(n,pts,c,width=1.5,z=18.5):
  cu=bpy.data.curves.new(n,'CURVE');cu.dimensions='3D';cu.bevel_depth=width*unit/2;cu.bevel_resolution=1;sp=cu.splines.new('POLY');sp.points.add(len(pts)-1)
  for p,(x,y) in zip(sp.points,pts):p.co=(*point(x,y,z),1)
  ob=bpy.data.objects.new(n,cu);setup(ob);cu.materials.append(emission('Label '+str(c),c));return ob
 def dot(n,x,y,r,c,z=17.4):return poly(n,[(x+r*math.cos(a*math.tau/24),y+r*math.sin(a*math.tau/24)) for a in range(24)],c,z)
 def badge(n,x,y,c):
  rect(n+' fill',x-37,y-20,74,40,BG,17.7);rect(n+' accent',x-37,y-20,5,40,c,17.5);txt(n,n,x+2,y,23,WHITE,True,17)
 return point,rect,txt,line,dot,badge

def proj(sc,p):
 v=world_to_camera_view(sc,sc.camera,p);return Vector((v.x*W,(1-v.y)*H))
def visible_meshes(sc):return [o for o in sc.objects if o.type=='MESH' and not o.hide_render and not o.name.startswith('Studio surface') and o.get('role')!='annotation']
def frame(sc,close=False):
 cam=sc.camera;q=cam.rotation_euler.to_quaternion();inv=q.inverted();meshes=visible_meshes(sc)
 if close:
  # Match the previous close-up while expanding the canvas for labels and a key.
  oldtarget=cam.location+q@Vector((0,0,-900));scale=160*W/2050
  center=inv@oldtarget
 else:
  pts=[inv@(o.matrix_world@Vector(p)) for o in meshes for p in o.bound_box]
  lo=Vector([min(p[i] for p in pts) for i in range(3)]);hi=Vector([max(p[i] for p in pts) for i in range(3)]);center=(lo+hi)/2
  span=hi-lo;scale=max(span.x*W/1700,span.y*W/1420)
 # Set projected model centre to (1160,1190); key occupies the right side.
 center.x-=(1160-W/2)*scale/W;center.y+=(1190-H/2)*scale/W
 cam.location=q@center+q@Vector((0,0,900));cam.data.ortho_scale=scale;cam.data.clip_start=.1;cam.data.clip_end=5000
 sc.view_layers[0].update()

# Build one ray tree per scene so leader targets land on a visible surface.
def ray_tree(sc):
 vs=[];fs=[];owners=[]
 for ob in visible_meshes(sc):
  off=len(vs);vs.extend(ob.matrix_world@v.co for v in ob.data.vertices)
  for p in ob.data.polygons:fs.append(tuple(off+i for i in p.vertices));owners.append(ob.name)
 return BVHTree.FromPolygons(vs,fs,all_triangles=False),owners

def label_targets(sc,ids,bvh,owners):
 cam=sc.camera;q=cam.rotation_euler.to_quaternion();unit=cam.data.ortho_scale/W;fwd=q@Vector((0,0,-1))
 def ray(x,y):return bvh.ray_cast(cam.location+q@Vector(((x-W/2)*unit,(H/2-y)*unit,-25)),fwd)
 def occupied(x,y):return ray(x,y)[0] is not None
 entries=[]
 for ident in ids:
  d=CAT[ident]
  if ident=='H21' and sc.name.startswith('11'):
   for ob in find(sc,d['prefix']):entries.append((ident,proj(sc,ob.matrix_world.translation),True))
   continue
  if ident=='P02' and sc.name.startswith('06'):
   entries.append((ident,proj(sc,Vector((108,0,23))),True));continue
  if ident.startswith('F'):
   coords={'F01':(104.5,-26,-7.5),'F02':(202,-1.5,24.4),'F03':(150,-23,-7.5)}
   p=proj(sc,Vector(coords[ident]));entries.append((ident,p,True));continue
  objects=find(sc,d['prefix'])
  if ident=='H02':objects+=find(sc,'Display glass')
  if not objects:raise RuntimeError('Missing '+ident+' in '+sc.name)
  candidates=[];fallback=[]
  for ob in objects:
   if ob.type=='CURVE':
    if not ob.data.splines:continue
    sp=ob.data.splines[0];points=[ob.matrix_world@p.co for p in sp.bezier_points]
    if points:fallback.append(proj(sc,points[2 if ident=='H24' else len(points)//2]))
    continue
   pixels=[proj(sc,ob.matrix_world@Vector(p)) for p in ob.bound_box];lx=min(p.x for p in pixels);hx=max(p.x for p in pixels);ly=min(p.y for p in pixels);hy=max(p.y for p in pixels);cx=(lx+hx)/2;cy=(ly+hy)/2
   fallback.append(Vector((cx,cy)))
   for iy in range(13):
    for ix in range(13):
     x=lx+(hx-lx)*(ix+.5)/13;y=ly+(hy-ly)*(iy+.5)/13
     if not (100<x<2220 and 310<y<2020):continue
     hit=ray(x,y)
     if hit[0] is not None and owners[hit[2]]==ob.name:candidates.append(((x-cx)**2+(y-cy)**2,Vector((x,y))))
  if candidates:p=min(candidates,key=lambda t:t[0])[1];ok=True
  else:p=fallback[0];ok=d['prefix'].startswith(('Service','Clamped'))
  entries.append((ident,p,ok))
 return entries,occupied

def cross(a,b,c,d):
 def ccw(u,v,w):return (w.y-u.y)*(v.x-u.x)>(v.y-u.y)*(w.x-u.x)
 return ccw(a,c,d)!=ccw(b,c,d) and ccw(a,b,c)!=ccw(a,b,d)

def place_badges(entries,occupied):
 placed=[]
 # Dense inner parts first, shells last; all endpoints remain fixed on their part.
 entries=sorted(entries,key=lambda t:(t[0] in ['P01','P02','P07','P08','P10','P11'],t[1].y))
 for ident,target,ok in entries:
  best=None
  for r in [65,85,110,140,180,225,275,340]:
   for a in range(32):
    angle=a*math.tau/32;p=target+Vector((r*math.cos(angle),r*math.sin(angle)))
    if not (115<=p.x<=2175 and 325<=p.y<=1995):continue
    if any(abs(p.x-v.x)<96 and abs(p.y-v.y)<63 for _,_,v,_ in placed):continue
    score=r+140*occupied(p.x,p.y)
    score+=sum(170 for _,t,v,_ in placed if cross(target,p,t,v))
    score+=sum(280 for _,t,_,_ in placed if (p-t).length<50)
    if best is None or score<best[0]:best=(score,p)
  if best is None:raise RuntimeError('Could not place '+ident)
  placed.append((ident,target,best[1],ok))
 return placed

CONFIG={
'05':('Opposite side','External components / filament head fitted', ['P01','P02','P07','P08','P10','P11','P12','P28','H02','H09','H21']),
'06':('Top view','Controls, interchangeable heads and contact tip', ['P02','P07','P08','P10','P11','P12','P28','H02','H09','H21']),
'07':('Underside','Lower housing, head interface and charging access',['P01','P07','P08','P10','P11','P28','H21','F01']),
'08':('Exploded handle','Shells, electronics, removable trays and wiring retention', ['P01','P02','P03','P04','P05','P06','P12','P14','P20','P29','P30','P31','H01','H02','H03','H04','H05','H06','H07','H08','H09','H10']),
'09':('Exploded filament head','Carrier, three replaceable nylon cartridges and sliding probe', ['P07','P08','P09','P21','P22','P23','P24','P25','P26','P27','P28','H11','H12','H13','H14','H15','H16','H17','H18']),
'10':('Exploded vibration head','Printed housing and cap / motor and driver envelopes',['P10','P11','H19','H20']),
'11':('Swappable head connection','Manual 6-way disconnect / key / mechanical retention',['P01','P06','P07','P14','H21','H22','H23','H24','H25','F02','F03']),
'12':('Vibration configuration','Same handle with the shorter vibration head fitted',['P01','P02','P10','P11','P12','H02','H09','H21','F01']),
}
# Readable short detail lines for the printed parts.
DETAIL={1:'Battery saddles and PCB support posts',2:'Display pod and control openings',3:'Removable; strap slots',4:'Removable; aligns side charging port',5:'Storage board beneath boost shelf',6:'Replaceable 2 mm connector panel',7:'Keyed body; mechanism chamber',8:'Carries probe guide and sensor',9:'Strap-retained servo mount',10:'Keyed body; motor-driver cavity',11:'Removable cap; rear motor pocket',12:'Printed actuator over tactile switch',14:'Screw-down harness strain relief',20:'Upper shelf above microSD',21:'Three pockets; 120-degree total travel',22:'Printed potting insert; position 1',23:'Printed potting insert; position 2',24:'Printed potting insert; position 3',25:'Retains all three potted cartridges',26:'Integral opaque travel-sensor flag',27:'Holds the PTFE sleeve',28:'Printed rounded contact tip',29:'Removable tactile-switch support',30:'Frame behind OLED module',31:'Dedicated removable PCB mount'}
RECORD=[]
for sc in scenes:
 bpy.context.window.scene=sc;sc.view_layers[0].update()
 code=sc.name[:2];title,subtitle,ids=CONFIG[code]
 sc.name=code+' | '+title+' | labeled';sc.render.resolution_x=W;sc.render.resolution_y=H;sc.render.resolution_percentage=100;sc.cycles.samples=32;sc.cycles.use_denoising=True
 frame(sc,code=='11');tree,owners=ray_tree(sc);entries,occupied=label_targets(sc,ids,tree,owners)
 layout=place_badges(entries,occupied)
 point,rect,txt,line,dot,badge=annotations(sc)
 rect('Header',0,0,W,250,BG,19);rect('Component key',2310,250,890,H-250,BG,19)
 txt('Title',title,88,64,61);txt('Subtitle',subtitle,90,157,29,MUTED)
 txt('Key heading','COMPONENT KEY',2365,295,27)
 for j,(typ,label) in enumerate([('printed','P = printed part'),('hardware','H = hardware'),('feature','F = feature')]):
  x=90+j*440;rect('Legend swatch',x,2058,12,12,COL[typ]);txt('Legend type',label,x+25,2050,23)
 txt('Model note','Hardware blocks are nominal envelopes. Exploded offsets are for illustration.',90,2095,23,MUTED)
 txt('Footer','SOLESENSE  /  R03  /  LABELED ASSEMBLY REVIEW',90,2147,20,MUTED)
 txt('Number',code+' / 12',3090,2110,22,MUTED,True)
 # Dense sheets use compact single-line entries; details are retained in the key document.
 dense=len(ids)>15;step=min(115,1710/max(1,len(ids)))
 for j,ident in enumerate(ids):
  d=CAT[ident];y=365+j*step;col=COL[d['type']]
  badge(ident,2410,y+17,col)
  txt('Key '+ident,d['name'],2470,y,29 if dense else 32)
  detail=DETAIL.get(int(ident[1:]),'') if ident.startswith('P') else d['detail']
  if detail:txt('Detail '+ident,detail,2470,y+39,20 if dense else 22,MUTED)
 for ident,target,pos,ok in layout:
  color=COL[CAT[ident]['type']]
  # Stroke halo keeps leader lines legible against both shell and floor.
  delta=target-pos;endpoint=pos+delta.normalized()*39
  line('Leader halo '+ident,[target,endpoint],BG,4.8,18.6)
  line('Leader '+ident,[target,endpoint],color,2.2,18.4)
  dot('Target halo '+ident,target.x,target.y,6.2,BG,18)
  dot('Target '+ident,target.x,target.y,3.6,color,17.8)
  badge(ident,pos.x,pos.y,color)
 sc.render.filepath=str(OUT/(code+'_'+title.replace(' ','_')+'_Labeled.png'))
 RECORD.append({'scene':sc.name,'image':Path(sc.render.filepath).name,'labels':[{'id':i,'target':list(t),'badge':list(p),'visible_target':ok} for i,t,p,ok in layout]})
 print('LABELED_SCENE',code,'labels',len(layout),'occluded',[i for i,t,p,ok in layout if not ok],flush=True)

# Complete textual index, including the six fit coupons (not device components).
CATPATH=OUT/'component_key.json';CATPATH.write_text(json.dumps(CAT,indent=2))
lines=['# SoleSense R03 — component key','','P numbers match the existing STL filename prefixes. H numbers identify hardware references in the review scenes. F labels identify integral features, not separate parts.','','The hardware is shown as simplified packaging envelopes, not detailed vendor CAD. Exploded offsets are illustrative. Nylon reference diameters do not specify calibrated forces.','','## Printed device components','','| Label | Component | STL |','|---|---|---|']
for i,d in CAT.items():
 if d['type']=='printed' and d['group']!='Fit_coupons':lines.append(f"| {i} | {d['name']} | `{d['stl']}` |")
lines+=['','## Hardware references','','| Label | Component | Description |','|---|---|---|']
for i,d in CAT.items():
 if d['type']=='hardware':lines.append(f"| {i} | {d['name']} | {d['detail']} |")
lines+=['','Display glass is a visual face of H02, not an additional supplied part. H10 is the mated packaging reference; H22 and H23 show its two halves separated. H21 represents two head retaining screws. H24/H25 are illustrative wire routes, not separate PCB components.','','## Fit coupons — print aids, not installed components','','| Label | Coupon | STL |','|---|---|---|']
for i,d in CAT.items():
 if d['type']=='printed' and d['group']=='Fit_coupons':lines.append(f"| {i} | {d['name']} | `{d['stl']}` |")
lines+=['','## Other assembly hardware','','Most small screws, inserts, cable ties, foam and adhesive are not modeled separately. Their quantities and installation locations are in the included `assembly_and_printing.md`. Labels identify modeled components; a numbered illustration is not a complete purchasing list.','','## Image files','']
for r in RECORD:lines.append('- '+r['image'])
feature_lines=['## Integral features','','| Label | Feature | Description |','|---|---|---|']
for i,d in CAT.items():
 if d['type']=='feature':feature_lines.append(f"| {i} | {d['name']} | {d['detail']} |")
idx=lines.index('## Fit coupons — print aids, not installed components')
lines[idx:idx]=feature_lines+['']
(OUT/'COMPONENT_KEY.md').write_text('\n'.join(lines)+'\n');(OUT/'views.json').write_text(json.dumps(RECORD,indent=2))
block=bpy.data.texts.new('SoleSense — component labels');block.write('\n'.join(lines))
preview='--preview' in sys.argv
only=next((a.split('=')[1] for a in sys.argv if a.startswith('--only=')),None)
selected=[s for s in scenes if (s.name.startswith(('08','09','11')) if preview else True)]
if only:selected=[s for s in scenes if s.name[:2] in only.split(',')]
if not preview:
 bpy.context.window.scene=next(s for s in scenes if s.name.startswith('08'))
 bpy.ops.wm.save_as_mainfile(filepath=str(ROOT/'cad/SoleSense_R03_Labeled_Views.blend'))
for sc in selected:
 bpy.context.window.scene=sc
 if preview:sc.render.resolution_percentage=50;sc.cycles.samples=12;sc.render.filepath=sc.render.filepath.replace('.png','_draft.png')
 bpy.ops.render.render(write_still=True,scene=sc.name)
print('LABELED_VIEWS_COMPLETE',flush=True)
