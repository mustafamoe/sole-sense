"""SoleSense R04 review prototype. Derives unchanged solids from the R03 package.
Run using FreeCAD's bundled Python. Coordinates and exports are millimetres.
This is a mechanical concept, not a validated medical device or release to print.
"""
import sys, json, math
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App, Part, MeshPart
V=App.Vector
OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[1]
for p in ['cad','stl','reference','previews','validation','source','docs']:
    (OUT/p).mkdir(parents=True,exist_ok=True)
doc=App.newDocument('SoleSense_R04_Concept')
parts={}; refs={}; groups={}
WHITE=[.77,.83,.82]; TEAL=[.025,.28,.29]; GOLD=[.78,.48,.14]; DARK=[.035,.065,.075]
def box(x,y,z,dx,dy,dz):return Part.makeBox(dx,dy,dz,V(x,y,z))
def cyl(r,l,x,y=0,z=0,axis=V(1,0,0)):return Part.makeCylinder(r,l,V(x,y,z),axis)
def cone(a,b,l,x):return Part.makeCone(a,b,l,V(x,0,0),V(1,0,0))
def fuse(*shapes):
    s=shapes[0]
    for t in shapes[1:]:s=s.fuse(t)
    return s
def cut(s,*tools):
    for t in tools:s=s.cut(t)
    return s
def ring(ro,ri,x,l):return cut(cyl(ro,l,x),cyl(ri,l+2,x-1))
def sector(ri,ro,x,l,a,b):
    # Polygonal radial sectors; increments <= 0.5 degree are part of CAD geometry.
    steps=max(2,int(math.ceil((b-a)/.5)))
    aa=[math.radians(a+(b-a)*i/steps) for i in range(steps+1)]
    pts=[V(x,ro*math.cos(t),ro*math.sin(t)) for t in aa]
    pts += [V(x,ri*math.cos(t),ri*math.sin(t)) for t in reversed(aa)]
    return Part.Face(Part.makePolygon(pts+[pts[0]])).extrude(V(l,0,0))
def rounded(x,y,z,dx,dy,dz,r):
    s=box(x,y,z,dx,dy,dz)
    ee=[e for e in s.Edges if e.BoundBox.ZLength>dz-.01 and e.BoundBox.XLength<.01 and e.BoundBox.YLength<.01]
    return s.makeFillet(r,ee)
def add(n,s,g,color=WHITE,kind='print',note=''):
    if g not in groups:groups[g]=doc.addObject('App::DocumentObjectGroup',g)
    obj=doc.addObject('PartDesign::Feature','P_'+n)
    obj.Label=n.replace('_',' ');obj.Shape=s
    obj.addProperty('App::PropertyString','DesignNotes');obj.DesignNotes=note
    obj.addProperty('App::PropertyString','Status');obj.Status='R04 REVIEW PROTOTYPE — hardware, fit, force and hygiene not validated'
    groups[g].addObject(obj)
    d=dict(shape=s,group=g,color=color,kind=kind,note=note,object=obj)
    (parts if kind=='print' else refs)[n]=d
    return s
def replace(n,s):parts[n]['shape']=s;parts[n]['object'].Shape=s
def original(n):return Part.read(str(ROOT/'cad'/f'{n}.step'))
manifest=json.loads((ROOT/'source/assembly_manifest.json').read_text())
retain=['01_Handle_Lower','02_Handle_Upper','03_Controller_Tray','04_Charger_Tray','05_SD_Tray','12_Button_Cap','14_Handle_Wire_Clamp','20_Boost_Shelf','29_Button_Platform','31_Battery_Protection_Tray']
for d in manifest:
    if d['name'] in retain:add(d['name'],original(d['name']),'Handle',d['color'],note='Retained from R03 except where described in R04 change notes.')

# Capture the collar between two fixed annular shoulders. The split shell permits assembly.
low=parts['01_Handle_Lower']['shape'];up=parts['02_Handle_Upper']['shape']
support=fuse(ring(30,26.5,138,2),ring(29,26.5,142.8,2.2),ring(27,22.5,143,7))
support=cut(support,box(142.7,-3.3,20.5,8,6.6,4.3))
low=fuse(low,support.common(box(-1,-45,-45,165,90,44.85)))
up=fuse(up,support.common(box(-1,-45,.15,165,90,50)))

# Remove the original pod and enlarge its cavity while retaining the original shell.
up=cut(up,box(21.9,-16.3,22.9,34.2,32.6,15))
pod=rounded(19,-19.6,14,42,39.2,16,3)
pod=cut(pod,box(21.6,-17.1,13.5,36.8,34.2,14.2),box(24.8,-7.9,27.5,30.4,15.8,4))
up=fuse(up,pod)
up=cut(up,box(21.6,-17.1,13.5,36.8,34.2,14.2))
up=cut(up,box(17.7,-14.3,2.6,52.6,28.6,12.5))
# Thin adhesive/foam retainer below the module, with an opening for underside wiring.
ret=cut(box(21.9,-16.8,19.0,36.2,33.6,1.25),box(25,-12,18.5,30,24,3))
add('30_OLED_13in_Retainer',ret,'Handle',TEAL,note='Foam/adhesive rear retainer; headerless module. Final glass offset and cable egress require sample verification.')
add('REF_OLED_Adafruit938_35p6x33x6p2',box(22.2,-16.5,20.6,35.6,33,6.2),'Handle',DARK,'reference','Published Adafruit 938 envelope. Active area 29.42 x 14.70; screen aperture 30.4 x 15.8. Centered active-area location is provisional; verify current PCB drawing/sample.')

# Axially sliding safety latch: pull back 5 mm, then rotate collar 30 degrees.
# Upper-shell rails capture the slider shoulders; an M2 shoulder screw retains its travel.
pedestal=box(123,-6.2,22.8,16,12.4,5.2)
rails=fuse(pedestal,box(123,-6.2,27.5,16,2.1,5),box(123,4.1,27.5,16,2.1,5),box(123,-6.2,30.7,16,3.1,1.8),box(123,3.1,30.7,16,3.1,1.8))
rails=cut(rails,cyl(.85,7,129.5,0,23,V(0,0,1)))
up=fuse(up,rails)
latch=fuse(box(125,-3.8,28.4,13,7.6,2),box(132,-2.8,30.2,12.4,5.6,2.4),rounded(132,-2.8,32.4,4,5.6,3.6,.7))
latch=cut(latch,box(126,-1.25,28,10,2.5,3),box(125.5,-2.3,30.4,11,4.6,7))
add('32_Collar_Safety_Slider',latch,'Handle',TEAL,note='Pull toward heel by 5 mm before turning collar; push forward after locking. Captive under rails with M2 shoulder screw. No spring or automatic relock is claimed.')
low=cut(low,cyl(18,3,140.8))
up=cut(up,cyl(18,3,140.8))
replace('01_Handle_Lower',low);replace('02_Handle_Upper',up)

collar=ring(31,27.35,140.4,19.6)
collar=cut(collar,cyl(29.35,7.6,142.4))
for a in [0,180]:
    collar=cut(collar,sector(27.1,32,154.0,3.8,a-5,a+35),sector(27.1,32,154,8,a+25,a+35))
# A positive slider notch locks the collar in its seated position.
collar=cut(collar,box(140,-3.2,29.8,5,6.4,5))
# Shallow axial grip flutes, avoiding functional tracks and latch notch.
for a in range(0,360,20):
    if 70<=a<=110:continue
    t=math.radians(a)
    collar=cut(collar,cyl(.8,5,144,31*math.cos(t),31*math.sin(t)))
# Two bolted halves allow the captive collar to be installed and serviced around
# the fixed handle shoulders. One-piece captive rings would lack a simple assembly path.
for z in [-29,29]:
    collar=fuse(collar,box(149.7,-11.8,z-1.5,3.6,4.3,3),box(149.7,7.5,z-1.5,3.6,4.3,3))
    collar=cut(collar,cyl(1.1,26,151.5,-13,z,V(0,1,0)))
collar_right=collar.common(box(135,.15,-40,30,40,80))
collar_left=collar.common(box(135,-40,-40,30,39.85,80))
add('33_Captive_Collar_Right',collar_right,'Interface',TEAL,note='One of two collar halves assembled around fixed shoulders using two M2 through bolts and nuts at X151.5/Z+/-29. Rotate -30 degrees after retracting slider. Validate screw bearing, print fit, fatigue and torque.')
add('40_Captive_Collar_Left',collar_left,'Interface',TEAL,note='Matching collar half. Split is away from head lugs. 0.30 mm seam. Fasteners are installed once; head changes require no screw removal.')
collar=Part.makeCompound([collar_right,collar_left])

# Replace the six-wire plug with stationary contact carriers. Four custom contacts are
# RESERVED ENVELOPES, not a selected connector or production PCB design.
plate=box(139,-15,-11,4.7,30,22).common(cyl(17.8,4.7,139))
for y in [-12,12]:plate=cut(plate,cyl(1.25,6,138,y,-8))
for y in [-9,-3,3,9]:plate=cut(plate,cyl(.8,6,138,y,0))
add('06_Fixed_Contact_Carrier',plate,'Handle',TEAL,note='Four embedded pad/tail reserves; M2 attachment uses original panel supports. Supplier contact hardware and PCB design remain to be selected.')
for i,y in enumerate([-9,-3,3,9],1):
    add(f'REF_Handle_Pad_{i}',fuse(cyl(2,.2,143.7,y),cyl(.5,3,140.7,y)),'Handle',GOLD,'reference','Proposed plated contact land; schematic assignment GND / regulated supply / motor control / head ID. No hot-swap claim.')

def pilot():
    s=cut(fuse(cone(21.55,22.15,.8,143.35),cyl(22.15,6.2,144.15)),cyl(18,9,142.8))
    s=fuse(s,box(143.7,-2.9,20.8,6.65,5.8,3.6))
    for y in [-19.5,19.5]:s=cut(s,cyl(2.6,3.4,146,y))
    return s
def lugs():return fuse(sector(26.5,30.25,154.4,3, -4,4),sector(26.5,30.25,154.4,3,176,184))
def carrier(g,prefix):
    s=cyl(17.65,3,146.2)
    for y in [-9,-3,3,9]:s=cut(s,cyl(1.15,5,145.5,y))
    # Integral tabs screw into the rear face of the head's internal bulkhead.
    for y in [-19.5,19.5]:
        s=fuse(s,cyl(2.3,3,146.2,y));s=cut(s,cyl(1.1,5,145.5,y))
    add(prefix+'_Head_Contact_Carrier',s,g,TEAL,note='Removable four-pin spring-contact reserve, two M2 screws. Pins remain aligned while outer collar rotates.')
    for i,y in enumerate([-9,-3,3,9],1):
        pin=fuse(cyl(.95,5.5,146.2,y),cyl(.55,2.3,143.9,y))
        add(f'REF_{g}_Spring_Pin_{i}',pin,g,GOLD,'reference','Illustrative compressed spring-contact envelope, not a selected part. Working stroke, force, current rating and sealing unverified.')
def rear_body():
    s=fuse(pilot(),cut(cyl(27,10.5,150.3),cyl(24.6,8,153.35),cyl(18,4,150)))
    for y in [-19.5,19.5]:s=cut(s,cyl(.85,6,149,y))
    return fuse(s,lugs())

# Short, passive pressure head, one manually exchanged external filament cartridge.
pbody=fuse(rear_body(),cut(cone(27,12,22.2,160.8),cone(24.6,9.6,18.8,160.7)),cyl(10.3,4.4,178.6))
pbody=cut(pbody,cyl(5.3,11,173))
for a in [0,180]:
    pbody=cut(pbody,sector(5.1,7.5,178.6,2.9,a-7,a+37),sector(5.1,7.5,178.6,6,a+23,a+37))
add('07_Pressure_Head_Body',pbody,'Pressure_head',note='Single passive filament. Cartridge twist 30 degrees, pull out by flange. No servo, probe guide, force sensor or automatic contact timing.')
carrier('Pressure_head','34')
cart=fuse(cyl(4.95,7.4,176),cyl(10.5,3,183.4))
for a in [0,180]:cart=fuse(cart,sector(4.6,7.1,179,2.1,a-5,a+5))
cart=cut(cart,cyl(.65,12,175))
# Grip scallops on rear-facing flange, outside the calibrated free filament.
for a in range(0,360,60):
    t=math.radians(a);cart=cut(cart,cyl(1.1,4,183,10.7*math.cos(t),10.7*math.sin(t)))
add('35_Replaceable_Filament_Cartridge',cart,'Pressure_head',GOLD,note='Replace cartridge plus filament as one unit. 1.3 mm potting bore; 38 mm free length is a layout assumption, not calibration. Supply preassembled/calibrated cartridges for intended use; no field trimming.')
add('REF_Exposed_Nylon_Uncalibrated',cyl(.45,38,186.4),'Pressure_head',GOLD,'reference','0.9 mm clearance reference only. This is nylon monofilament, NOT printing filament. No force rating assigned.')
cap=cut(cyl(12,46,183.5),cyl(10.85,44,183.4))
add('36_Filament_Storage_Cap',cap,'Accessories',TEAL,note='Loose concept storage cover with no filament contact in nominal position. Retention and clean packaging remain to be developed; not a sterile barrier.')

# Vibration head retains R03 motor/dome packaging and receives the same new joint.
vbody=original('10_Vibration_Head_Body')
vbody=cut(vbody,box(140,-35,-35,10.3,70,70))
vbody=fuse(vbody,pilot(),lugs())
for y in [-19.5,19.5]:vbody=cut(vbody,cyl(.85,6,149,y))
add('10_Vibration_Head_Body',vbody,'Vibration_head',note='R03 vibration chamber with new stationary four-contact connection and common collar lugs.')
add('11_Vibration_Dome_Cap',original('11_Vibration_Dome_Cap'),'Vibration_head',note='Retained R03 dome and coin motor pocket. Cleaning/contact-surface validation is unresolved; no disposable barrier has been validated.')
carrier('Vibration_head','37')

# Retain the native hardware envelope solids from the original document, not STL reconstructions.
old=App.openDocument(str(ROOT/'cad/SoleSense_R03.FCStd'))
hardware_keep=['REF_18650_67x18p6','REF_Controller_52x28x12','REF_TP4056_28x17x5','REF_MicroSD_24x25x5','REF_Pololu_U3V40F5','REF_1S_Protection_16x12x5','REF_Button_6x6x5','REF_Power_Slide_Switch','REF_Vibration_Driver_Reserve_6x20x10','REF_CoinMotor_10x2p7']
for n in hardware_keep:
    o=old.getObject(n)
    if o is None:o=next(a for a in old.Objects if a.Label==n.replace('_',' '))
    md=next(d for d in manifest if d['name']==n)
    g='Vibration_head' if ('Vibration' in n or 'CoinMotor' in n) else 'Handle'
    add(n,o.Shape.copy(),g,md['color'],'reference',md['description'])
App.closeDocument(old.Name);App.setActiveDocument(doc.Name)

# Test pieces use exactly the finished interface geometry.
male=fuse(pilot(),ring(27,18,150.3,10.5),lugs())
add('38_Joint_Male_Coupon',male,'Fit_coupons',TEAL,note='Exact pilot, key and lugs. Use with female coupon and collar before a complete handle print.')
female=fuse(ring(27,22.5,143,7),ring(30,22.5,138,2),ring(27,22.5,140,3),ring(29,22.5,142.8,2.2))
female=cut(female,box(142.7,-3.3,20.5,8,6.6,4.3))
add('39_Joint_Female_Coupon',female,'Fit_coupons',WHITE,note='Exact socket and collar shoulders. Assemble the two collar halves around this coupon using the same M2 through bolts.')

report={'status':'REVIEW PROTOTYPE ONLY','units':'mm','parts':{},'collisions':[],'motion':[],
        'unverified':['Contact hardware selection, spring force and stroke, PCB/electrical design','Latch usability, retention, fatigue and print tolerances','Cartridge retention, potting and calibrated force','Patient-contact materials, cleaning and hygiene workflow','Display glass alignment and wiring against actual purchased module']}
allitems={**parts,**refs}
for n,d in allitems.items():
    s=d['shape'];bb=s.BoundBox
    report['parts'][n]={'kind':d['kind'],'valid':s.isValid(),'closed':s.isClosed(),'solids':len(s.Solids),'volume_mm3':round(s.Volume,3),'bbox_mm':[round(bb.XLength,3),round(bb.YLength,3),round(bb.ZLength,3)]}
    if d['kind']=='print':
        s.exportStep(str(OUT/'cad'/f'{n}.step'))
        pr=s.copy()
        if d['group'] in ['Pressure_head','Vibration_head','Interface','Fit_coupons','Accessories']:pr.rotate(V(),V(0,1,0),90)
        b=pr.BoundBox;pr.translate(V(-b.XMin,-b.YMin,-b.ZMin))
        mesh=MeshPart.meshFromShape(Shape=pr,LinearDeflection=.06,AngularDeflection=.15,Relative=False)
        mesh.translate(0,0,-mesh.BoundBox.ZMin);mesh.write(str(OUT/'stl'/f'{n}.stl'))
    mesh=MeshPart.meshFromShape(Shape=s,LinearDeflection=.06,AngularDeflection=.15,Relative=False)
    mesh.write(str(OUT/'reference'/f'{n}.stl'))
for cfg in ['Pressure_head','Vibration_head']:
    names=[n for n,d in allitems.items() if d['group'] in ['Handle','Interface',cfg]]
    for i,n in enumerate(names):
        for m in names[i+1:]:
            a=allitems[n]['shape'];b=allitems[m]['shape']
            if not a.BoundBox.intersect(b.BoundBox):continue
            vol=a.common(b).Volume
            if vol>.03:report['collisions'].append({'config':cfg,'a':n,'b':m,'volume_mm3':round(vol,5)})
    Part.makeCompound([parts[n]['shape'] for n in names if n in parts]).exportStep(str(OUT/'cad'/f'SoleSense_R04_{cfg}_Assembly.step'))

def motion(label,moving,fixed,positions,transform):
    worst=0;at=None
    for value in positions:
        sh=moving.copy();transform(sh,value)
        for n,s in fixed.items():
            if not sh.BoundBox.intersect(s.BoundBox):continue
            vol=sh.common(s).Volume
            if vol>worst:worst=vol;at={'position':value,'part':n}
    report['motion'].append({'operation':label,'samples':len(positions),'max_overlap_mm3':round(worst,5),'at':at})
handle={n:d['shape'] for n,d in allitems.items() if d['group']=='Handle'}
motion('Safety slider retracts 5 mm',latch,{**{n:s for n,s in handle.items() if n!='32_Collar_Safety_Slider'},'collar':collar},[0,1,2,3,4,5],lambda s,v:s.translate(V(-v,0,0)))
unlatched=latch.copy();unlatched.translate(V(-5,0,0))
for cfg in ['Pressure_head','Vibration_head']:
    fixed={**handle,**{n:d['shape'] for n,d in allitems.items() if d['group']==cfg}}
    fixed['32_Collar_Safety_Slider']=unlatched
    motion(cfg+' collar unlocks with head stationary',collar,fixed,list(range(-30,1,2)),lambda s,v:s.rotate(V(),V(1,0,0),v))
    unlocked=collar.copy();unlocked.rotate(V(),V(1,0,0),-30)
    fixed={**handle,'33_Captive_Twist_Collar':unlocked};fixed['32_Collar_Safety_Slider']=unlatched
    moving=Part.makeCompound([d['shape'] for d in allitems.values() if d['group']==cfg])
    motion(cfg+' axial head withdrawal',moving,fixed,[0,.5,1,2,4,6,8,12,20,30],lambda s,v:s.translate(V(v,0,0)))
motion('Cartridge unlock 30 degrees',cart,{'body':pbody},list(range(0,31,2)),lambda s,v:s.rotate(V(),V(1,0,0),v))
unlocked_cart=cart.copy();unlocked_cart.rotate(V(),V(1,0,0),30)
motion('Cartridge axial withdrawal',unlocked_cart,{'body':pbody},[0,.5,1,2,4,6,8,10,15],lambda s,v:s.translate(V(v,0,0)))

# These deliberate collisions confirm geometric stops; they do not prove strength.
report['retention_checks']=[]
for cfg in ['Pressure_head','Vibration_head']:
    body=parts['07_Pressure_Head_Body' if cfg=='Pressure_head' else '10_Vibration_Head_Body']['shape'].copy()
    body.translate(V(1,0,0))
    report['retention_checks'].append({'check':cfg+' cannot withdraw 1 mm with collar locked','interference_mm3':round(body.common(collar).Volume,5)})
turned=collar.copy();turned.rotate(V(),V(1,0,0),-5)
report['retention_checks'].append({'check':'Engaged safety slider blocks 5 degree collar turn','interference_mm3':round(turned.common(latch).Volume,5)})
for dx in [-1,1]:
    sh=collar.copy();sh.translate(V(dx,0,0))
    report['retention_checks'].append({'check':f'Collar axial capture at {dx:+d} mm','interference_mm3':round(sh.common(fuse(low,up)).Volume,5)})
for n,d in allitems.items():d['object'].Visibility=d['group'] not in ['Vibration_head','Accessories','Fit_coupons']

doc.recompute();doc.saveAs(str(OUT/'cad/SoleSense_R04.FCStd'))
(OUT/'source/assembly_manifest.json').write_text(json.dumps([{'name':n,'group':d['group'],'kind':d['kind'],'color':d['color'],'description':d['note'],'assembly_mesh':f'reference/{n}.stl'} for n,d in allitems.items()],indent=2))
(OUT/'source/design_dimensions.json').write_text(json.dumps({'revision':'R04 review concept','handle_length_mm':150,'grip_diameter_mm':46,'collar_diameter_mm':62,'pressure_length_mm':224.4,'vibration_length_mm':185.3,'previous_pressure_length_mm':270.3,'screen_diagonal_in':1.3,'screen_aperture_mm':[30.4,15.8],'screen_module_envelope_mm':[35.6,33,6.2],'head_unlock_deg':30,'safety_slider_travel_mm':5,'filament_free_length_reference_mm':38,'filament_force_rating':'UNASSIGNED; reference geometry only'},indent=2))
(OUT/'validation/cad_validation.json').write_text(json.dumps(report,indent=2))
bad={n:v for n,v in report['parts'].items() if not(v['valid'] and v['closed'] and v['solids']==1)}
print(json.dumps({'invalid':bad,'collisions':report['collisions'],'motion':report['motion']},indent=2),flush=True)
assert not bad,'Invalid CAD geometry'
assert not report['collisions'],'Assembly collisions'
assert all(v['max_overlap_mm3']<.03 for v in report['motion']),'Motion collision'
assert all(v['interference_mm3']>.03 for v in report['retention_checks']),'Missing geometric retention stop'
print('R04_GEOMETRY_CHECKS_PASSED')
