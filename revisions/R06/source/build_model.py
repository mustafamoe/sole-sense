"""SoleSense R06: magnetic leaf-spring head, first physical prototype.
Millimetres; FreeCAD 1.1 bundled Python. No physical qualification implied.
"""
import sys, json, math
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App, Part, MeshPart
V=App.Vector
OUT=Path(__file__).resolve().parents[1]; ROOT=OUT.parents[1]
OLD=OUT/'source/dependencies/R04'
if not OLD.exists():OLD=ROOT/'revisions/R04'
for folder in ['cad','stl','reference','previews','validation','docs','print_first']:
    (OUT/folder).mkdir(exist_ok=True)
doc=App.newDocument('SoleSense_R06_Magnetic_Prototype')
items={}; groups={}
WHITE=[.74,.81,.80]; TEAL=[.025,.32,.34]; BLUE=[.055,.39,.66]
BRONZE=[.64,.38,.12]; GOLD=[.87,.61,.20]; RED=[.75,.09,.06]; DARK=[.045,.065,.08]
def box(x,y,z,dx,dy,dz):return Part.makeBox(dx,dy,dz,V(x,y,z))
def cyl(r,l,x,y=0,z=0,axis=V(1,0,0)):return Part.makeCylinder(r,l,V(x,y,z),axis)
def fuse(*shapes):
    s=shapes[0]
    for t in shapes[1:]:s=s.fuse(t)
    return s.removeSplitter()
def cut(s,*tools):
    for t in tools:s=s.cut(t)
    return s.removeSplitter()
def ring(ro,ri,x,l):return cut(cyl(ro,l,x),cyl(ri,l+2,x-1))
def sector(ri,ro,x,l,a,b):
    aa=[math.radians(a+(b-a)*i/80) for i in range(81)]
    pts=[V(x,ro*math.cos(t),ro*math.sin(t)) for t in aa]
    pts += [V(x,ri*math.cos(t),ri*math.sin(t)) for t in reversed(aa)]
    return Part.Face(Part.makePolygon(pts+[pts[0]])).extrude(V(l,0,0))
def hexx(x,y,z,af,length):
    r=af/math.sqrt(3)
    pts=[V(x,y+r*math.cos(math.radians(30+60*i)),z+r*math.sin(math.radians(30+60*i))) for i in range(6)]
    return Part.Face(Part.makePolygon(pts+[pts[0]])).extrude(V(length,0,0))
def hexz(x,y,z,af,length):
    r=af/math.sqrt(3)
    pts=[V(x+r*math.cos(math.radians(30+60*i)),y+r*math.sin(math.radians(30+60*i)),z) for i in range(6)]
    return Part.Face(Part.makePolygon(pts+[pts[0]])).extrude(V(0,0,length))
def slotz(x1,x2,y,z,r,h):return fuse(cyl(r,h,x1,y,z,V(0,0,1)),cyl(r,h,x2,y,z,V(0,0,1)),box(x1,y-r,z,x2-x1,2*r,h))
STAGE_OFFSET=7.0
LID_POSTS=[(178,-21),(180,21),(233.5,-18),(233.5,18)]
def stage(s):
    s=s.copy();s.translate(V(0,STAGE_OFFSET,0));return s
def outline(z,h,inner=False):
    # Flat rear mating face; tangent 10 mm front corners (7 mm internally).
    rear,front,half,r=(169,235,25,7) if inner else (165,238,28,10)
    return fuse(box(rear,-half,z,228-rear,2*half,h),box(228,-18,z,front-228,36,h),cyl(r,h,228,-18,z,V(0,0,1)),cyl(r,h,228,18,z,V(0,0,1)))
def add(n,s,g,color=WHITE,kind='print',note='',orient='flat',moving=False,qty=1):
    if g not in groups:groups[g]=doc.addObject('App::DocumentObjectGroup',g)
    o=doc.addObject('PartDesign::Feature','P_'+n);o.Label=n.replace('_',' ');o.Shape=s
    o.addProperty('App::PropertyString','DesignNotes');o.DesignNotes=note
    o.addProperty('App::PropertyString','ReleaseStatus');o.ReleaseStatus='R06 first-build bench prototype; physical fit and force not verified'
    o.addProperty('App::PropertyInteger','PrintQuantity');o.PrintQuantity=qty
    groups[g].addObject(o)
    items[n]=dict(shape=s,object=o,group=g,color=color,kind=kind,note=note,orient=orient,moving=moving,qty=qty)
    return s
def oldstep(n):return Part.read(str(OLD/'cad'/f'{n}.step'))
oldmanifest=json.loads((OLD/'source/assembly_manifest.json').read_text())
old=App.openDocument(str(OLD/'cad/SoleSense_R04.FCStd'))
# Retained handle, screen and vibration configuration remain dimensionally unchanged.
for d in oldmanifest:
    if d['group'] not in ['Handle','Interface','Vibration_head','Fit_coupons']:continue
    o=old.getObject('P_'+d['name'])
    if o is None:continue
    g=d['group']
    # R04 contact hardware is not passed off as selected or finished hardware.
    if 'Contact_Carrier' in d['name'] or 'Fixed_Contact' in d['name'] or '_Pad_' in d['name'] or '_Spring_Pin_' in d['name']:g='Legacy_contact_concept'
    add(d['name'],o.Shape.copy(),g,d['color'],'reference' if g=='Legacy_contact_concept' else d['kind'],d['description'],orient='axial' if d['group'] in ['Interface','Vibration_head','Fit_coupons'] else 'flat')
App.closeDocument(old.Name);App.setActiveDocument(doc.Name)

# Separate joint adaptor: preserves exact R04 pilot/key/lugs, bolts to new chassis.
rear=oldstep('07_Pressure_Head_Body').common(box(140,-40,-40,20.8,80,80))
adapter=fuse(rear,box(160.8,-28,-19,4.2,56,38))
adapter=cut(adapter,cyl(20,6,160),box(164.0,-3.3,-16.3,1.1,20.6,3.6))
for y in [-22.5,22.5]:
    for z in [-12,12]:adapter=cut(adapter,cyl(1.7,12,156,y,z),cyl(3.2,2.1,160.7,y,z))
add('41_R04_Joint_Adaptor',adapter,'Magnetic_head',TEAL,orient='axial',note='R04 mechanical twist-lock interface. Four M3 x 8 button-head bolts join the head chassis. Electrical contacts are a separate unfinished R04 subsystem; use the cable port for initial bench testing.')

# 56 mm shell with rounded front corners and a centered cartridge.
base=cut(outline(-19,35),outline(-16,33,inner=True))
base=cut(base,box(164,-5,-16,6,23,30),cyl(11.5,5,234),box(234,-7,7,5,14,10))
for y in [-22.5,22.5]:
    for z in [-12,12]:
        base=cut(base,cyl(1.7,8,164,y,z),hexx(166.5,y,z,5.8,3.0))
# Four lid screw pillars, nuts enter from above before closing the cover.
for x,y in LID_POSTS:
    base=fuse(base,cyl(4.4,32,x,y,-16,V(0,0,1)))
    base=cut(base,cyl(1.7,15,x,y,3,V(0,0,1)),hexz(x,y,13.2,5.8,3.0))
# Fixed spring seats are only on one side: the parallel leaves can shorten sideways.
for x in [190,217]:
    seat=box(x-4,-33,-16,4,6,27)
    for z in [-8.2,8.2]:seat=cut(seat,cyl(1.2,6,x-5,-30,z),hexx(x-4.1,-30,z,4.5,2.2))
    base=fuse(base,stage(seat))
    base=cut(base,stage(box(x,-33.3,-11.3,3.4,2.3,22.6)))
# Lower half-ring travel stops permit vertical assembly of the moving carriage.
backstop=stage(ring(18,13.8,219.1,3).common(box(218,-19,-16,5,38,11)))
# Shoulder follows the stage; front aperture follows the centered nose.
frontstop=cut(stage(cyl(18,3,228.5)),cyl(11.5,5,227.5)).common(box(227,-19,-16,6,45,11))
base=fuse(base,backstop,frontstop)
# M3 sensor adjustment fasteners, with nuts captured in the underside.
for y in [0,14]:base=cut(base,cyl(1.7,5,170,y,-20,V(0,0,1)),hexz(170,y,-19.1,5.8,2.6))
# Bench cable exit plus two tie holes in the stationary positive-Y wall.
base=cut(base,box(176,24,-12,8,6,5))
for x in [174.5,185.5]:base=cut(base,cyl(1.2,6,x,24,-9.5,V(0,1,0)))
add('42_Magnetic_Chassis',base,'Magnetic_head',WHITE,note='Print open side upward. Includes 2.4 mm compression and 1.0 mm extension stops, spring seats, M3 nut pockets and cable exit. Clear holes and fit coupons first; no sliding bearing touches the carriage during measurement.')

lid=cut(outline(16,3),box(232.5,-7,15.5,7,14,5))
for x,y in LID_POSTS:lid=cut(lid,cyl(1.7,5,x,y,15.5,V(0,0,1)))
# Removable M3 service screw pins the carriage during spring/cartridge installation.
lid=cut(lid,cyl(1.7,5,226,7,15.5,V(0,0,1)),hexz(226,7,15.9,5.8,2.6))
add('43_Removable_Lid',lid,'Magnetic_head',TEAL,note='Four M3 x 10 screws. Front M3 x 25 service screw (7 mm off center) is removed completely during sensing. Insert its M3 nut from below before fitting the cover.')

# Carriage: two spring seats, stiff connecting rod, retained magnet and cartridge receiver.
car=fuse(box(186,-9,-11,4,18,22),box(213,-9,-11,4,18,22),cyl(2.8,43,189),cyl(15,3,224.5),box(178.8,-8,-5,7.2,16,10))
for x in [190,217]:
    for z in [-8.2,8.2]:car=cut(car,cyl(1.2,6,x-5,-6,z),hexx(x-4.1,-6,z,4.5,2.2))
# 6 x 3 magnet slip pocket, retained by separate screwed cap and a small adhesive bond.
car=cut(car,cyl(3.2,3.5,178.7))
for y in [-5.5,5.5]:
    car=cut(car,cyl(1.2,13,178,y),hexx(184,y,0,4.5,2.1),box(184,min(y,8 if y>0 else -8),-2.25,2.1,2.5,4.5))
car=fuse(stage(car),cyl(10.3,11.4,231))
# Receiver uses the exact R04 cartridge bore and track profile, translated +59 mm.
car=cut(car,cyl(5.15,12,232))
for a in [0,180]:car=cut(car,sector(5.1,7.5,237.6,2.9,a-7,a+37),sector(5.1,7.5,237.6,6,a+23,a+37))
# Cartridge locking screw, plus separate blind service-pin hole behind the cartridge stem.
car=fuse(car,box(237.5,-3.5,8,4.9,7,5.2))
car=cut(car,cyl(1.2,12,240,0,3,V(0,0,1)),hexz(240,0,10.8,4.5,1.8),box(237.4,-2.25,10.8,3,4.5,1.8),cyl(1.8,24,226,7,-7,V(0,0,1)))
add('44_Moving_Carriage',car,'Magnetic_head',BLUE,orient='axial',moving=True,note='Two parallel leaf springs, no rubbing guide. Magnet pocket 6.4 x 3.4 mm; M2 retained cap. R04 bayonet plus added M2 lock screw. Large rear shoulder meets chassis overload stops. Service-pin bore is in the large travel-stop shoulder.')

clamps=[]
for i,(x,y,moving) in enumerate([(190.1,-33,False),(190.1,-9,True),(217.1,-33,False),(217.1,-9,True)],1):
    s=box(x,y,-11,3,6,22)
    if moving:s=s.common(cyl(13.6,5,x-1))
    for z in [-8.2,8.2]:s=cut(s,cyl(1.2,5,x-1,y+3,z))
    add(f'45_Leaf_Clamp_{i}',stage(s),'Magnetic_head',TEAL,orient='axial',moving=moving,note='Spring clamp (inner pair has relieved corners): M2 x 10 screws, nuts in rear seat. Two screws lie outside the 12 mm-wide spring strip; do not drill the spring material.')
    clamps.append(s)
magcap=box(177.4,-8,-5,1.4,16,10)
magcap=cut(magcap,cyl(2.4,3,177))
for y in [-5.5,5.5]:magcap=cut(magcap,cyl(1.2,3,177,y))
add('46_Magnet_Retainer',stage(magcap),'Magnetic_head',BLUE,orient='axial',moving=True,note='Two M2 x 10 screws; opening is smaller than magnet diameter. Thin adhesive layer prevents movement within the clearance pocket.')
add('REF_Magnet_6x3_Axial',stage(cyl(3,3,179.2)),'Hardware',RED,'reference','6 mm diameter x 3 mm thick axially magnetized N35–N42 disc; pole faces normal to device axis. Fix orientation before calibration.',moving=True)

# TO-92 (TI LPG) holder: open top/front; retain package with a small adhesive fillet.
sensorbase=box(165.2,-10,-16,10,20,3)
for y in [-7,7]:sensorbase=cut(sensorbase,slotz(169,171,y,-17,1.7,5))
post=box(166.2,-4.1,-13,1.9,8.2,17)
sides=fuse(box(168.1,-4.1,-4,3.3,1.8,8),box(168.1,2.3,-4,3.3,1.8,8),box(168.1,-4.1,-4.5,3.3,8.2,1.7))
for y in [-1.27,0,1.27]:sides=cut(sides,cyl(.55,3,169.6,y,-5,V(0,0,1)))
sensorbase=fuse(sensorbase,post,sides)
add('47_Adjustable_Hall_Mount',stage(sensorbase),'Magnetic_head',TEAL,note='DRV5055A3QLPG TO-92 pocket: 4.6 mm width, 3.3 mm depth, open top. Flat sensing face toward magnet. ±1 mm axial adjustment gives nominal 7.2–9.2 mm package-face gap. Two M3 x 6 screws; strain-relieve stationary wires.')
hall=box(168.36,-2.05,-2.525,2.64,4.1,5.05)
add('REF_DRV5055A3QLPG_Envelope',stage(hall),'Hardware',DARK,'reference','TI LPG package maximum-envelope reference, not detailed manufacturer CAD; pin 1 VCC, 2 GND, 3 OUT. Flat face at X171 toward magnet.')
for i,y in enumerate([-1.27,0,1.27],1):add(f'REF_Hall_Lead_{i}',stage(box(169.4,y-.2,-10.5,.4,.4,7.975)),'Hardware',GOLD,'reference','Solder insulated leads before seating sensor; no wire crosses moving carriage.')

# Replaceable cartridge with blind radial lock pocket. Original flange/lugs retained.
cart=oldstep('35_Replaceable_Filament_Cartridge');cart.translate(V(59,0,0))
cart=cut(cart,cyl(1.4,3,240,0,3,V(0,0,1)))
add('48_Locking_Filament_Cartridge',cart,'Magnetic_head',GOLD,orient='axial',moving=True,note='Same R04 quarter-turn geometry, plus radial M2 lock pocket; press flange against receiver face while clamping. Unrated nylon references only. Cartridge lock screw must be loosened before turning; install service pin first.')
add('REF_Nylon_Unrated',cyl(.45,38,245.4),'Hardware',GOLD,'reference','0.9 mm diameter / 38 mm length is an uncalibrated layout reference. A monofilament that buckles below a target cannot apply that target force.',moving=True)
benchprobe=fuse(cart,cyl(2,10,245.3),cyl(6,2,254.3))
add('49_Bench_Calibration_Cartridge',benchprobe,'Accessories',BLUE,orient='axial',note='Rigid broad pad for pressing against a reference balance; NEVER a skin-testing substitute. Swap for filament cartridge after mechanical/sensor calibration; recalibrate assembled cartridge as needed.')

# Hardware envelopes make screw lengths and assembly access inspectable.
def screwx(name,xhead,y,z,length,diam=2,moving=False):
    s=fuse(cyl(diam/2,length,xhead-length,y,z),cyl(1.9 if diam==2 else 2.75,2 if diam==2 else 3,xhead,y,z))
    return add(name,s,'Fasteners',GOLD,'reference',f'M{diam} x {length} socket cap screw envelope; threads not modeled.',moving=moving)
def nutx(name,x,y,z,af=4.0,h=1.6,moving=False):
    return add(name,cut(hexx(x,y,z,af,h),cyl(.85 if af<5 else 1.3,h+2,x-1,y,z)),'Fasteners',GOLD,'reference','Standard hex nut envelope; pocket includes clearance.',moving=moving)
for i,(x,y,m) in enumerate([(190.1,-23,False),(190.1,1,True),(217.1,-23,False),(217.1,1,True)],1):
    for j,z in enumerate([-8.2,8.2],1):
        screwx(f'REF_Leaf_Screw_{i}_{j}',x+3,y,z,10,moving=m);nutx(f'REF_Leaf_Nut_{i}_{j}',x-4,y,z,moving=m)
for i,y in enumerate([1.5,12.5],1):
    # Heads face the sensor (-X), shafts extend toward the carriage.
    s=fuse(cyl(1,10,177.4,y),cyl(1.9,2,175.4,y))
    add(f'REF_Magnet_Screw_{i}',s,'Fasteners',GOLD,'reference','M2 x 10; tighten cap before inserting carriage into chassis.',moving=True)
    nutx(f'REF_Magnet_Nut_{i}',184.2,y,0,moving=True)
for i,y in enumerate([-22.5,22.5],1):
    for j,z in enumerate([-12,12],1):
        add(f'REF_Adaptor_Screw_{i}_{j}',fuse(cyl(1.5,8,162.8,y,z),cyl(2.85,1.65,161.15,y,z)),'Fasteners',GOLD,'reference','M3 x 8 button head, inserted from rear into 2 mm counterbore; socket-cap heads do not fit.')
        nutx(f'REF_Adaptor_Nut_{i}_{j}',166.6,y,z,5.5,2.4)
def screwz(name,x,y,underhead,length,diam=3,group='Fasteners',moving=False):
    return add(name,fuse(cyl(diam/2,length,x,y,underhead-length,V(0,0,1)),cyl(2.75 if diam==3 else 1.9,3 if diam==3 else 2,x,y,underhead,V(0,0,1))),group,GOLD,'reference',f'M{diam} x {length} screw envelope.',moving=moving)
for index,(x,y) in enumerate(LID_POSTS):
    i,j=index//2+1,index%2+1
    screwz(f'REF_Lid_Screw_{i}_{j}',x,y,19.0,10)
for i,y in enumerate([0,14],1):screwz(f'REF_Sensor_Adjust_Screw_{i}',170,y,-13,6)
screwz('REF_Cartridge_Lock_M2x12',240,0,15.0,12,2,moving=True)
screwz('REF_Service_Pin_M3x25',226,7,19.0,25,3,group='Service_lock')
knob=cut(cyl(5.5,6,226,7,19.1,V(0,0,1)),cyl(2.9,3.2,226,7,19.0,V(0,0,1)),cyl(1.7,8,226,7,19,V(0,0,1)))
add('50_Service_Lock_Knob',knob,'Service_lock',RED,note='Bond over the M3 x 25 socket head. REMOVE ENTIRE SCREW for measurement. Pin is only for cartridge changes and spring assembly; not a travel-adjustment screw.')
cknob=cut(cyl(4.5,4,240,0,15.1,V(0,0,1)),cyl(2.05,2.2,240,0,15.0,V(0,0,1)),cyl(1.2,6,240,0,14.8,V(0,0,1)))
add('51_Cartridge_Lock_Knob',cknob,'Magnetic_head',TEAL,moving=True,note='Bond over M2 x 12 head. Back out at least 3 mm before rotating cartridge; use service lock while doing so.')

def spring_shape(x,travel=0):
    dy=-.6*travel*travel/18
    pts=[(x,-32),(x,-27)]
    for i in range(1,41):
        t=i/40;pts.append((x-travel*(3*t*t-2*t*t*t),-27+(18+dy)*t))
    pts.append((x-travel,-4+dy))
    vv=[V(px,py,-6) for px,py in pts]+[V(px+.1,py,-6) for px,py in reversed(pts)]
    return Part.Face(Part.makePolygon(vv+[vv[0]])).extrude(V(0,0,12))
for i,x in enumerate([190,217],1):add(f'REF_Phosphor_Bronze_Leaf_{i}',stage(spring_shape(x)),'Springs',BRONZE,'reference','C51000 H08 spring temper, 28 x 12 x 0.10 mm. 5 mm clamped at each end, 18 mm free. Two parallel leaves; do not print these or substitute soft copper.')

# Print-first tolerance coupon, matching magnet pocket, TO92 pocket, holes and nuts.
coupon=box(0,0,0,65,28,5)
for i,diam in enumerate([2.2,2.4,3.2,3.4]):coupon=cut(coupon,cyl(diam/2,7,6+8*i,7,-1,V(0,0,1)))
coupon=cut(coupon,cyl(3.2,3.5,42,8,1.5,V(0,0,1)),box(52,4,1.5,4.6,3.3,5),hexz(8,20,2.6,4.5,3),hexz(20,20,2.4,5.8,3))
add('52_Hardware_Fit_Coupon',coupon,'Fit_coupons',TEAL,note='Left to right holes 2.2 / 2.4 / 3.2 / 3.4 mm; Ø6.4 x 3.5 magnet pocket; 4.6 x 3.3 TO92 pocket. Hex pockets AF4.5 / AF5.8. Print before full head.')
# Detached exact receiver coupon and matching cartridge, for low-cost bayonet trials.
receiver=car.common(box(234.7,-15,-15,8,30,30))
add('53_Cartridge_Receiver_Coupon',receiver,'Fit_coupons',BLUE,orient='axial',note='Exact front of R06 carriage including lock pocket and R04 bayonet track. Test with part 48 before full carriage.')
template=cut(box(0,0,0,36,20,2),box(4,4,1,28,12,2))
add('54_Leaf_Length_Template',template,'Fit_coupons',BRONZE,note='28 x 12 mm recess, 1 mm deep. Alignment/length template only; measure spring thickness with micrometer. No printed spring substitute.')
bridge=outline(16,3).common(box(222,-23,16,15.5,46,3))
for y in [-18,18]:bridge=cut(bridge,cyl(1.7,5,233.5,y,15.5,V(0,0,1)))
bridge=cut(bridge,cyl(1.7,5,226,7,15.5,V(0,0,1)),hexz(226,7,15.9,5.8,2.6))
add('55_Spring_Assembly_Bridge',bridge,'Accessories',RED,note='Temporary open assembly fixture: replaces lid using the two front lid screws, holds the service pin while leaving both leaf stations accessible. One extra M3 nut. Remove bridge before fitting lid; never leave it inside the head.')

# Export solids and print-oriented meshes.
report={'revision':'R06','status':'FIRST-BUILD BENCH PROTOTYPE','parts':{},'static_collisions':[],'motion':[],'stops':[]}
manifest=[]
for n,d in items.items():
    s=d['shape'];b=s.BoundBox
    report['parts'][n]={'valid':s.isValid(),'closed':s.isClosed(),'solids':len(s.Solids),'volume_mm3':s.Volume,'bbox_mm':[b.XLength,b.YLength,b.ZLength],'kind':d['kind']}
    if d['kind']=='print':
        s.exportStep(str(OUT/'cad'/f'{n}.step'))
        pr=s.copy()
        if d['orient']=='axial':pr.rotate(V(),V(0,1,0),90)
        elif d['orient']=='carriage':pr.rotate(V(),V(1,0,0),90)
        b=pr.BoundBox;pr.translate(V(-b.XMin,-b.YMin,-b.ZMin))
        mesh=MeshPart.meshFromShape(Shape=pr,LinearDeflection=.04,AngularDeflection=.12,Relative=False)
        mesh.write(str(OUT/'stl'/f'{n}.stl'))
        if d['group']=='Fit_coupons' or n=='48_Locking_Filament_Cartridge':mesh.write(str(OUT/'print_first'/f'{n}.stl'))
    mesh=MeshPart.meshFromShape(Shape=s,LinearDeflection=.04,AngularDeflection=.12,Relative=False)
    mesh.write(str(OUT/'reference'/f'{n}.stl'))
    d['object'].Visibility=d['group'] not in ['Vibration_head','Fit_coupons','Accessories','Legacy_contact_concept','Service_lock']
    manifest.append({'name':n,'group':d['group'],'kind':d['kind'],'color':d['color'],'description':d['note'],'moving':d['moving'],'print_orientation':d['orient'],'quantity':d['qty'],'assembly_mesh':f'reference/{n}.stl'})
doc.recompute();doc.saveAs(str(OUT/'cad/SoleSense_R06.FCStd'))
head=[d['shape'] for d in items.values() if d['kind']=='print' and d['group']=='Magnetic_head']
Part.makeCompound(head).exportStep(str(OUT/'cad/SoleSense_R06_Magnetic_Head_Assembly.step'))
full=[d['shape'] for d in items.values() if d['kind']=='print' and d['group'] in ['Magnetic_head','Handle','Interface']]
Part.makeCompound(full).exportStep(str(OUT/'cad/SoleSense_R06_Pressure_Assembly.step'))
(OUT/'source/assembly_manifest.json').write_text(json.dumps(manifest,indent=2))
dimensions={'leaf_stock_mm':[28,12,.10],'leaf_free_span_mm':18,'leaf_clamp_each_end_mm':5,'leaf_count':2,'leaf_material':'C51000 H08 phosphor bronze','compression_stop_mm':2.4,'extension_stop_mm':1.0,'magnet_mm':[6,3],'magnet_type':'axially magnetized N35–N42','hall_part':'DRV5055A3QLPG, TI LPG TO92','package_face_gap_nominal_mm':8.2,'gap_adjustment_mm':[7.2,9.2],'housing_mm':[73,56,38.0],'previous_housing_width_mm':70,'width_reduction_percent':20,'front_corner_radius_mm':10,'stage_offset_y_mm':7,'filament_axis_y_mm':0,'grip_diameter_mm':46,'collar_diameter_mm':62,'new_head_length_from_joint_mm':140.05,'overall_length_with_reference_filament_mm':283.4,'printer_assumption':'FDM 0.4 mm nozzle, 0.2 mm layer, PLA for bench prototype; coupons required','date':'2026-10-20'}
(OUT/'source/design_dimensions.json').write_text(json.dumps(dimensions,indent=2))
(OUT/'validation/geometry_build.json').write_text(json.dumps(report,indent=2))
bad={n:d for n,d in report['parts'].items() if not(d['valid'] and d['closed'] and d['solids']==1)}
print('INVALID_SOLIDS',json.dumps(bad),flush=True)
assert not bad,'Invalid/disconnected solid'
print('R06_SOLIDS_EXPORTED',len(items),flush=True)
