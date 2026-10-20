import sys, json, math, os
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App, Part, MeshPart
V=App.Vector
OUT=Path(__file__).resolve().parents[1]
for folder in ['cad','stl','source','reference','validation','previews']: (OUT/folder).mkdir(exist_ok=True)
C=json.loads((OUT/'source/interface_config.json').read_text())
M3_CLEAR=C['fastener_clearance_diameter_mm']/2
M3_INSERT=C['m3_insert_bore_diameter_mm']/2
P={'revision':'R03 engineering prototype — selected component envelopes','grip_diameter':46.0,'handle_length':150.0,'head_diameter':54.0,'wall':2.4,'joint_radial_clearance':C['joint_radial_clearance_mm'],'split_gap':0.30,'connector_passage':[16,12],'battery_envelope':[67,18.6],'controller_envelope':[52,28,12],'oled_envelope':[27,27,5],'charger_envelope':[17,28,5],'sd_envelope':[24,25,5],'servo_envelope':[30.3,32.3,12.2],'connector_status':'Molex Micro-Fit 6-way manual disconnect; see wiring.md'}
(OUT/'source/design_dimensions.json').write_text(json.dumps(P,indent=2))
DOC=App.newDocument('SoleSense_R03_Engineering')
parts={}; refs={}; groups={}
for g in ['Handle','Filament_head','Vibration_head','Hardware_envelopes','Fit_coupons']:
 groups[g]=DOC.addObject('App::DocumentObjectGroup',g)

def box(x,y,z,dx,dy,dz):return Part.makeBox(dx,dy,dz,V(x,y,z))
def cyl(r,l,x,y=0,z=0,axis=V(1,0,0)):return Part.makeCylinder(r,l,V(x,y,z),axis)
def cone(r1,r2,l,x):return Part.makeCone(r1,r2,l,V(x,0,0),V(1,0,0))
def cleaned(s):
 # Preserve split faces: OCC refinement can invert a charging-pod shell.
 return s
def fuse(*ss):
 s=ss[0]
 for a in ss[1:]: s=s.fuse(a)
 return cleaned(s)
def cut(s,*ss):
 for a in ss:s=s.cut(a)
 return cleaned(s)
def add(n,s,g,color,kind='print',desc=''):
 s=cleaned(s)
 o=DOC.addObject('PartDesign::Feature',n);o.Label=n.replace('_',' ');o.Shape=s
 o.addProperty('App::PropertyString','DesignStatus');o.DesignStatus='BENCH PROTOTYPE — physical fit and force calibration required'
 o.addProperty('App::PropertyString','AssemblyNotes');o.AssemblyNotes=desc
 groups[g].addObject(o)
 (refs if kind=='ref' else parts)[n]={'shape':s,'group':g,'color':color,'object':o,'description':desc}
 return s
def setpart(n,shape):
 shape=cleaned(shape);parts[n]['shape']=shape;parts[n]['object'].Shape=shape
 if n=='01_Handle_Lower':print('LOW_CHECK',shape.isValid(),len(shape.Solids),flush=True)

def round_vertical_box(x,y,z,dx,dy,dz,r):
 sh=box(x,y,z,dx,dy,dz)
 edges=[e for e in sh.Edges if e.BoundBox.ZLength>dz-.01 and e.BoundBox.XLength<.01 and e.BoundBox.YLength<.01]
 return sh.makeFillet(r,edges)

WHITE=[.79,.84,.84]; TEAL=[.035,.29,.32]; DARK=[.06,.09,.11]; GREEN=[.03,.24,.17]; GOLD=[.72,.49,.15]; BLUE=[.04,.24,.43]
# Continuous handle shell with a serviceable top display pod.
outer=fuse(cyl(23,122,0),cone(23,27,20,122),cyl(27,8,142))
outer=outer.makeFillet(.8,[e for e in outer.Edges if abs(e.BoundBox.XMin)<.01 and e.BoundBox.XLength<.01])
inner=fuse(cyl(20.6,119.6,2.4),cone(20.6,24.6,19,122))
shell=cut(outer,inner,cyl(22.5,8,143),box(140.5,-8,-6,4,16,12),box(142.8,-3.3,20.5,8,6.6,4.3))
# Display pod has a real opening, shelf and 0.4 mm perimeter fitting allowance.
pod=round_vertical_box(22,-16.2,14,34,32.4,12,2.5)
pod=cut(pod,box(24.6,-13.9,13.5,28.8,27.8,10.8),box(27.5,-6.25,23.5,23,12.5,4))
shell=fuse(shell,pod)
shell=cut(shell,box(24.6,-13.9,12.5,28.8,27.8,11.8))
# USB-C charging access is provided by the reinforced side pod.
# Charging aperture is cut into a reinforced side pod below.
# Connector cassette mounting holes in the forward bulkhead.
# Cassette screw supports are added to the lower shell after splitting.
# Side head-retention screw access. Both holes remain clear of the shell seam.
for sy in [-1,1]:shell=cut(shell,cyl(M3_CLEAR,12,146.5,sy*18,5,V(0,sy,0)))
# Screw bosses join the outer walls, avoiding electronics footprints.
fasteners=[(6,-13),(6,13),(85,-16),(85,16),(132,-18),(132,18)]
for x,y in fasteners:
 shell=fuse(shell,cyl(3.5,38,x,y,-19,V(0,0,1)).common(outer))
 shell=cut(shell,cyl(M3_CLEAR,48,x,y,-24,V(0,0,1)),cyl(M3_INSERT,4.3,x,y,-4.35,V(0,0,1)),cyl(3.05,15,x,y,10,V(0,0,1)))
low=shell.common(box(-2,-40,-40,160,80,39.85)).removeSplitter()
# Build the upper half independently to avoid a kernel split ambiguity at the pod.
up=outer.common(box(-5,-45,.15,170,90,45)).removeSplitter()
up=cut(up,inner,cyl(22.5,8,143),box(140.5,-8,-6,4,16,12),box(142.8,-3.3,20.5,8,6.6,4.3))
up=fuse(up,pod)
up=cut(up,box(24.6,-13.9,12.5,28.8,27.8,11.8))
for x,y in fasteners:
 up=fuse(up,cyl(3.5,18.85,x,y,.15,V(0,0,1)).common(outer))
 up=cut(up,cyl(M3_CLEAR,48,x,y,-24,V(0,0,1)),cyl(3.05,15,x,y,10,V(0,0,1)))
for sy in [-1,1]:up=cut(up,cyl(M3_CLEAR,12,146.5,sy*18,5,V(0,sy,0)))

# Integral battery saddles: grooves, bottom feet, upward removal clearance.
for x in [23,64]:
 saddle=cut(cyl(11.5,5,x,0,-9.7),cyl(9.65,7,x-1,0,-9.7),box(x-1,-13,-6.2,7,26,20))
 foot=box(x,-5,-21,5,10,5)
 low=fuse(low,saddle)
 low=cut(low,cyl(9.65,7,x-1,0,-9.7))
# Controller supports sit beneath the board and join the side wall; hold board with straps.
for x in [18,65]:
 for sy in [-1,1]:
  low=fuse(low,box(x,sy*14.4 if sy==1 else -20.7,-7,4,6.3,7))
  low=cut(low,box(x+.7,14.0 if sy==1 else -21,-3.2,2.6,7.0,2.1))
# Two service-board shelves: charger below and SD above, separate in Z.
for x in [91,110]:
 low=fuse(low,box(x,-10.5,-18,3,21,5))
 for sy in [-1,1]:low=fuse(low,box(x,13.1 if sy==1 else -20.8,-8,3,7.7,9))
# Clear only tiny lower-support interference at the seam.
low=cut(low,box(88,-24,-.2,30,3.7,5),box(88,20.3,-.2,30,3.7,5))
# Slot for a top button, independent of OLED pod.
up=cut(up,box(17.7,-14.3,2.6,52.6,28.6,12.5))
up=cut(up,cyl(4.2,20,74,0,15,V(0,0,1)),cyl(5.8,5,74,0,16,V(0,0,1)))
add('01_Handle_Lower',low,'Handle',WHITE,desc='Battery saddles, board supports, six M3 insert seats. Insert fit requires test coupon.')
add('02_Handle_Upper',up,'Handle',WHITE,desc='OLED pod, button opening, six recessed M3 screw channels.')
# Removable electronics shelves: no assumed PCB mounting-hole pattern.
tray=box(16,-14.5,0.35,56,29,2.2)
for x in [20,64]:tray=cut(tray,box(x,-12,-1,2.8,24,6))
add('03_Controller_Tray',tray,'Handle',TEAL,desc='52 x 28 x 12 mm reference board; strap slots, no fictitious mounting holes.')
charger=box(94,-24,-13,21,31,2)
for x in [95,111]:charger=cut(charger,box(x,-18,-14,2,19,4))
add('04_Charger_Tray',charger,'Handle',TEAL)
sd=box(88,-13,1.35,30,26,1.8)
for x in [91,112]:sd=cut(sd,box(x,-10,0,2.5,20,5))
add('05_SD_Tray',sd,'Handle',TEAL)
# Connector insert, installed from inside before closing the handle. Passage accepts a prewired connector.
# Molex 43020-0600 recommended profile: C=10.21, D=13.89,
# main opening 7.11 high, ear slots 4.06, upper key 1.98 wide x 1.60 high.
def microfit_cutout(x,depth,allowance=0):
 a=allowance
 return fuse(box(x,-5.105-a,-3.555-a,depth,10.21+2*a,7.11+2*a),
             box(x,-6.945-a,-2.03-a,depth,13.89+2*a,4.06+2*a),
             box(x,-.99-a,3.50,depth,1.98+2*a,1.655+a))
cs=round_vertical_box(139,-15,-11,2,30,22,0.3)
cs=cut(cs,microfit_cutout(138,5,C['microfit_cutout_allowance_per_side_mm']))
for y in [-12,12]:cs=cut(cs,cyl(1.25,4,138,y,-8))
add('06_MicroFit_Panel_Insert',cs,'Handle',TEAL,desc='2 mm panel with manufacturer-profile opening for Molex 43020-0600. Two M2 screws. Print coupon and check actual connector latches.')
# Mounting ribs attach this insert to the lower housing only.
for sy in [-1,1]:
 rib=box(135,10 if sy==1 else -25,-13,4,15,8).common(outer)
 low=fuse(low,rib)
 low=cut(low,cyl(1.0,5,134,sy*12,-8))
setpart('01_Handle_Lower',low)
# Keyed head pilot is common to both heads.
def pilot():
 r=22.5-C['joint_radial_clearance_mm']; lead=C['joint_lead_in_mm']
 s=cut(fuse(cone(r-.6,r,lead,143.35),cyl(r,7-lead,143.35+lead)),cyl(18,9,142.8))
 key=box(143.7,-2.9,20.8,6.65,5.8,3.6)
 key=key.makeFillet(.3,[e for e in key.Edges if e.BoundBox.XLength<.01 and abs(e.BoundBox.XMin-143.7)<.01])
 s=fuse(s,key)
 for sy in [-1,1]:s=cut(s,cyl(M3_INSERT,6,146.5,sy*18,5,V(0,sy,0)))
 return s
# Filament module: direct SG90 drive; three pockets at 60-degree spacing.
# All dimensions explicitly chosen for a bench prototype with replaceable loose nylon.
fs=fuse(pilot(),cut(cyl(27,101.65,150.30),cyl(24.6,102,153.35),cyl(18,4,150)))
for a in [90,210,330]:
 y=22*math.cos(math.radians(a));z=22*math.sin(math.radians(a))
 fs=fuse(fs,cyl(3.1,8,244,y,z));fs=cut(fs,cyl(1.25,9,244,y,z))
for x in [156,176]:
 anchor=cut(box(x,-26,-5,5,5.7,10),box(x+1,-24,-2.4,3,6,4.8));fs=fuse(fs,anchor)
# Rear carrier plate screws into these axial bosses; insert plate through the open nose.
for y in [-21,21]:
 fs=fuse(fs,cyl(4,5,164,y,0));fs=cut(fs,cyl(1.25,6,164,y,0))
add('07_Filament_Head_Body',fs,'Filament_head',WHITE,desc='102 mm mechanism chamber; servo, 3-position nylon carrier, guide and optical travel gate. Index only with probe fully withdrawn.')
fc=fuse(cyl(27,3,252.3),cut(cyl(24.25,3,249.3),cyl(21.3,4,249)))
fc=cut(fc,cyl(3.5,10,248,0,10))
for a in [90,210,330]:
 y=22*math.cos(math.radians(a));z=22*math.sin(math.radians(a))
 fc=cut(fc,cyl(3.5,3.05,249.25,y,z),cyl(1.7,8,248,y,z),cyl(3,2,254,y,z))
for y in [-6,6]:fc=cut(fc,cyl(.85,4,252,y,10))
# Optical sensor arms are integral with the removable front cap.
for y in [-9.5,9.5]:
 arm=box(235.5,y-2.8,-20.2,17.2,5.6,2.7)
 fc=fuse(fc,arm);fc=cut(fc,cyl(1.25,4,240.5,y,-21,V(0,0,1)))
add('08_Filament_Front_Cap',fc,'Filament_head',WHITE,desc='Probe guide and TCST2103 mounts. Sensor screw centers 19 mm apart. Front guide removable with two M2 screws.')
# Strap cradle uses the stock SG90 horn; no printed servo spline.
sp=cut(cyl(20,3,169.3),box(168,-17.7,-6.7,6,24.2,13.4))
for y in [-21,21]:sp=fuse(sp,cyl(3.3,3,169.3,y,0));sp=cut(sp,cyl(1.7,5,168.5,y,0))
for y in [-18.9,7.7]:
 sp=fuse(sp,box(169.3,y-1,-8.8,23,2,17.6))
 for x in [175,181]:sp=cut(sp,box(x,y-1.5,-5,2.5,3,10))
sp=cut(sp,box(184.4,-22,-6.5,3.6,33.4,13))
add('09_SG90_Strap_Cradle',sp,'Filament_head',TEAL,desc='Tie SG90 into open adjustable cradle with two 2.5 mm straps. Align output shaft with X-axis using stock horn; do not print a spline.')
# Vibration head reuses the exact same handle interface.
vs=fuse(pilot(),cut(cyl(27,21.65,150.30),cyl(24.6,22,153.35),cyl(18,4,150)))
for a in [90,210,330]:
 y=22*math.cos(math.radians(a));z=22*math.sin(math.radians(a))
 vs=fuse(vs,cyl(3.1,8,164,y,z));vs=cut(vs,cyl(1.25,9,164,y,z))
for x in [156,162]:
 anchor=cut(box(x,-26,-5,4,7,10),box(x+.8,-24,-2.4,2.4,6,4.8));vs=fuse(vs,anchor)
add('10_Vibration_Head_Body',vs,'Vibration_head',WHITE)
vc=fuse(cyl(27,3,172.3),cut(cyl(24.25,3,169.3),cyl(21.3,4,169)))
# Dome faces forward; a 10.4 mm x 3.2 mm motor pocket opens from the rear.
sph=Part.makeSphere(10,V(175.3,0,0));dome=sph.common(box(175.3,-11,-11,11,22,22))
vc=fuse(vc,dome,cyl(7,4,168.3))
vc=cut(vc,cyl(5.2,3.25,168.2),box(168,-7,-1.2,4.5,14,2.4))
for a in [90,210,330]:
 y=22*math.cos(math.radians(a));z=22*math.sin(math.radians(a))
 vc=cut(vc,cyl(3.5,3.05,169.25,y,z),cyl(1.7,9,168,y,z),cyl(3,2,174,y,z))
add('11_Vibration_Dome_Cap',vc,'Vibration_head',WHITE,desc='Adafruit 1201 coin motor (10 x 2.7 mm), adhesive retained. Prototype dome must be physically assessed for vibration transfer.')
# Switch cap with retention flange, separated from upper shell by clearance.
bc=fuse(cyl(3.8,4.6,74,0,20.5,V(0,0,1)),cyl(5.4,1.2,74,0,19.3,V(0,0,1)))
add('12_Button_Cap',bc,'Handle',TEAL,desc='0.3 mm nominal switch gap; set final switch height with thin shims.')
# Coupon for hole/insert print calibration.
cp=box(0,0,0,52,18,6)
for x,d in zip([7,19,31,43],[3.2,3.4,3.9,4.1]):cp=cut(cp,cyl(d/2,8,x,9,-1,V(0,0,1)))
add('13_Fastener_Fit_Coupon',cp,'Fit_coupons',TEAL,desc='Left to right: 3.2 / 3.4 / 3.9 / 4.1 mm bores. Use before full enclosure print.')
# Removable cable clamp anchors the handle harness before the connector.
cr=C['cable_clamp_bore_radius_mm']
base_clamp=box(114,-24,-10,6,22,6.85).common(outer)
base_clamp=cut(base_clamp,cyl(cr,8,113,-10,-3))
low=fuse(low,base_clamp)
for y in [-16,-4]:low=cut(low,cyl(1.6,4.2,117,y,-7.3,V(0,0,1)))
clamp=round_vertical_box(114,-19,-2.85,6,18,3.65,.6)
clamp=cut(clamp,cyl(cr,8,113,-10,-3))
for y in [-16,-4]:clamp=cut(clamp,cyl(1.2,6,117,y,-4,V(0,0,1)))
add('14_Handle_Wire_Clamp',clamp,'Handle',TEAL,desc='M2 screw clamp over 4.8 mm bore; 4.2 mm diameter bundle reserve. Optional soft liner adapted to the real wires.')
# Asymmetric seam locators resist sideways sliding while the screws clamp the halves.
for x,y in [(12,19.5),(125,-21)]:
 wing=box(x-2,17.5 if y>0 else -23,-3,4,5.5,2.85).common(outer)
 low=fuse(low,wing,cyl(1.4,2.55,x,y,-.4,V(0,0,1)))
 uwing=box(x-2,17.5 if y>0 else -23,.15,4,5.5,3.4).common(outer)
 up=fuse(up,uwing);up=cut(up,cyl(1.7,3.2,x,y,0,V(0,0,1)))
setpart('01_Handle_Lower',low);setpart('02_Handle_Upper',up)
# Actual interface sections for test printing, not arbitrary loose rings.
male_coupon=fuse(pilot(),cut(cyl(25,2,150.3),cyl(18,4,150)))
add('15_Head_Joint_Test_Male',male_coupon,'Fit_coupons',TEAL,desc='Exact pilot and key geometry from both heads. Use with each female fit coupon.')
for idx,delta in enumerate([-.10,0,.10],16):
 socket=cyl(27,8,143)
 socket=cut(socket,cyl(22.5+delta,10,142),box(142,-3.3,20.5,10,6.6,4.3))
 add(f'{idx:02d}_Head_Joint_Test_Female_{int((C["joint_radial_clearance_mm"]+delta)*100):02d}',socket,'Fit_coupons',WHITE,desc=f'Radial clearance {C["joint_radial_clearance_mm"]+delta:.2f} mm against current male. Same keyway as full handle.')
panel_coupon=box(0,0,0,30,22,2)
pc=cs.copy();pc.rotate(V(0,0,0),V(0,1,0),90)
bb=pc.BoundBox;pc.translate(V(-bb.XMin,-bb.YMin,-bb.ZMin))
add('19_MicroFit_Panel_Test',pc,'Fit_coupons',TEAL,desc='Actual 2 mm connector insert rotated flat, for checking the connector snap-in fit before printing housing.')
# Side USB-C charging pod: selected generic TP4056 board 28 x 17 x 5 max.
charging_pod=round_vertical_box(92,-26,-14,25,12,11,2)
low=fuse(low,charging_pod)
low=cut(low,box(95.2,-24.2,-11,18.6,29.5,5.8),box(98.8,-28,-10,11.4,6,5))
# Provide explicit pockets for board / tray edges at the shell.
low=cut(low,box(93.8,-24.2,-13.15,21.4,31.4,2.3))
setpart('01_Handle_Lower',low)
# Removable boost shelf above microSD: four columns outside the SD footprint.
boost=box(88,-13,8.7,30,26,1.2)
for x in [89.4,116.6]:
 for y in [-11,11]:
  sd=fuse(sd,cyl(1.3,5.55,x,y,3.15,V(0,0,1)))
  sd=cut(sd,cyl(.8,5,x,y,4.5,V(0,0,1)))
  boost=cut(boost,cyl(1.1,3,x,y,8,V(0,0,1)))
for x in [94,112]:boost=cut(boost,box(x,-8,8,2,16,3))
setpart('05_SD_Tray',sd)
add('20_Boost_Shelf',boost,'Handle',TEAL,desc='U3V40F5 strap platform. Four M2 screws into SD shelf columns; remove for SD access.')
# Carrier: stock two-arm horn seats in rear pocket. M2 screws clamp horn through slots.
rotor=fuse(cyl(17.2,4,202.5),cyl(7.5,4,198.5))
rotor=cut(rotor,box(198,-14,-3.2,3.5,28,6.4),cyl(1.3,10,197))
for y in [-10,10]:rotor=cut(rotor,box(201,y-2.4,-1.1,7,4.8,2.2))
for a in [30,90,150]:
 y=10*math.cos(math.radians(a));z=10*math.sin(math.radians(a))
 rotor=cut(rotor,cyl(2.85,6,201.5,y,z))
add('21_Three_Position_Carrier',rotor,'Filament_head',TEAL,desc='Three cartridge pockets spaced 60 degrees on R10. Carrier travel -60 / 0 / +60 degrees. Stock SG90 horn in rear pocket, two M2 screws in radial slots.')
# Individual epoxy-potted inserts; retained by clamping ring and two screws.
for i,a in enumerate([30,90,150],22):
 y=10*math.cos(math.radians(a));z=10*math.sin(math.radians(a))
 ins=cut(fuse(cyl(2.6,3.6,202.7,y,z),cyl(3.6,1.4,206.5,y,z),cyl(2.6,.3,206.25,y,z)),cyl(.65,8,201,y,z))
 add(f'{i:02d}_Nylon_Insert_{i-21}',ins,'Filament_head',GOLD,desc='1.3 mm potting bore. Bond independently calibrated nylon; trim free length to 38 mm for this mechanical build. Diameters are calibration variables, not a force guarantee.')
 # Reference filaments are diameter envelopes only. Actual gauge selected by complete-assembly force measurement.
 add(f'REF_Nylon_{i-21}',cyl(.45,38,207.9,y,z),'Hardware_envelopes',GOLD,'ref')
ret=cyl(16.8,1.6,208.2)
ret=cut(ret,cyl(7.8,3,208),box(207.5,-18,-18,4,36,18))
for a in [30,90,150]:
 y=10*math.cos(math.radians(a));z=10*math.sin(math.radians(a))
 ret=cut(ret,cyl(1.2,4,207,y,z))
for y in [-14,14]:
 ret=cut(ret,cyl(1.2,4,207,y,5))
 rotor=cut(rotor,cyl(.85,5,202,y,5))
setpart('21_Three_Position_Carrier',rotor)
add('25_Insert_Retainer',ret,'Filament_head',TEAL,desc='Two M2 screws at Y +/-14, Z5 retain the three potted inserts without clamping the free nylon.')
# 38 mm free nylon ends at 245.9; unloaded rear contact pad starts 246.9.
pad=fuse(cyl(3.5,3.0,246.9,0,10),box(246.9,-.55,-10,1.6,1.1,20))
pad=cut(pad,cyl(1.55,2.2,248,0,10))
add('26_Probe_Rear_Pad_and_Flag',pad,'Filament_head',TEAL,desc='Low-mass pad with integral optical flag. Bond onto 3 mm polished shaft; 1 mm initial gap. No return spring: pull tip collar to fully extend before indexing.')
guide=fuse(cyl(3.1,7.5,250.3,0,10),box(255.6,-9,7,2.2,18,6))
guide=cut(guide,cyl(2.05,9,250,0,10))
for y in [-6,6]:guide=cut(guide,cyl(1.1,4,254.5,y,10))
add('27_Probe_Guide',guide,'Filament_head',TEAL,desc='Seat for PTFE tube OD4/ID3.2, length7.5. Two M2 screws hold flange. Fit must slide freely; measure breakaway force.')
ptfe=cut(cyl(2,7.5,250.3,0,10),cyl(1.6,9,250,0,10))
add('REF_Probe_PTFE_Bushing',ptfe,'Hardware_envelopes',WHITE,'ref')
rod=cyl(1.5,20,248.2,0,10)
add('REF_Probe_Rod_3x20',rod,'Hardware_envelopes',[.5,.55,.58],'ref')
tip=fuse(cyl(3.5,3,263.8,0,10),Part.makeSphere(3.5,V(266.8,0,10)).common(box(266.8,-4,6,4,8,8)))
tip=cut(tip,cyl(1.55,4.7,263.5,0,10))
add('28_Probe_Tip',tip,'Filament_head',WHITE,desc='Removable prototype contact tip; bond to rod. Guide flange gives 6 mm travel stop. Bench use pending surface and force verification.')
# TCST2103 manufacturer footprint with open 3.1 mm gap and 19 mm mounting pitch.
sensor=fuse(box(238.75,-12.25,-8.0,6.3,24.5,3.1),box(238.75,-5.95,-4.9,6.3,11.9,7.7))
sensor=cut(sensor,box(238,-1.55,-4.9,8,3.1,8))
for y in [-9.5,9.5]:sensor=cut(sensor,cyl(1.65,5,241.9,y,-9,V(0,0,1)))
# Optical axis at X241.9: flag crosses after 5 mm inward travel. Slotted mount permits adjustment.
sensor.translate(V(0,0,-9))
add('REF_TCST2103',sensor,'Hardware_envelopes',DARK,'ref')
# Shift cap sensor mount to match the selected sensor axis.
fc=parts['08_Filament_Front_Cap']['shape']
for y in [-9.5,9.5]:fc=cut(fc,box(239.25,y-1.25,-21,4,2.5,5))
setpart('08_Filament_Front_Cap',fc)
# Button support for a generic 6 x 6 x 5 mm tactile switch; glued to platform, flexible wires.
but=box(70.4,-11,12.2,13.1,22,1.8)
for sy in [-1,1]:
 low=fuse(low,box(80,5 if sy>0 else -22,-8,3,17,7.85).common(outer),box(80,5 if sy>0 else -8,-8,3,3,19.9))
 low=cut(low,cyl(.85,5,81.5,sy*6.5,7.2,V(0,0,1)))
 but=cut(but,cyl(1.1,3,81.5,sy*6.5,12,V(0,0,1)))
add('29_Button_Platform',but,'Handle',TEAL,desc='6 mm tactile switch mounted centrally. Two M2 mounting screws. Shim switch to give 0.3 mm cap travel.')
add('REF_Button_6x6x5',box(71,-3,14.15,6,6,5),'Hardware_envelopes',DARK,'ref')
setpart('01_Handle_Lower',low)
# OLED rear retainer, fixed to the upper shell. Generic 27 x 27 x 5 max module.
obr=box(25,-13.7,17.2,28,27.4,1.3)
obr=cut(obr,box(28,-10,16,22,20,4))
# Retainer uses adhesive foam at the four PCB corners; no imaginary hole pattern.
add('30_OLED_Retainer',obr,'Handle',TEAL,desc='Rear retaining frame with thin foam/adhesive at PCB corners. Remove upper shell as a module with display, frame and button cap.')
# Accessible power-enable slide switch at the heel, independent of charging.
up=cut(up,box(4.8,-2.5,16.0,9.4,5,6),box(7,-1.4,21.5,5,2.8,5))
setpart('02_Handle_Upper',up)
add('REF_Power_Slide_Switch',fuse(box(5.2,-2.1,17.6,8.6,4.2,4.2),box(8,-1.1,21.8,2,2.2,3.2)),'Hardware_envelopes',DARK,'ref',desc='SS12D00G3-style slide switch envelope. Adhesive retained under heel slot. Switch EN only, not servo supply current.')
# Space and support for a separately rated single-cell protection board.
prot=box(121,-8,-15.2,18,16,1.7)
for x in [124,133]:prot=cut(prot,box(x,-5,-16,2,10,4))
for sy in [-1,1]:low=fuse(low,box(123,8 if sy>0 else -24,-18.5,4,16,3.0).common(outer))
add('31_Battery_Protection_Tray',prot,'Handle',TEAL,desc='Strap or adhesive mount for 1S protection board, 16 x 12 x 5 max. Specify at least 5 A discharge rating; physical sample required.')
add('REF_1S_Protection_16x12x5',box(122,-6,-13.2,16,12,5),'Hardware_envelopes',GREEN,'ref')
setpart('01_Handle_Lower',low)
# Electronics reference volumes; these are purchased hardware and MUST NOT be printed.
add('REF_18650_67x18p6',cyl(9.3,67,12,0,-9.7),'Hardware_envelopes',BLUE,'ref')
add('REF_Controller_52x28x12',box(18,-14,2.8,52,28,12),'Hardware_envelopes',GREEN,'ref')
add('REF_TP4056_28x17x5',box(96,-23.5,-10.7,17,28,5),'Hardware_envelopes',GREEN,'ref')
add('REF_MicroSD_24x25x5',box(91,-12.5,3.5,24,25,5),'Hardware_envelopes',GREEN,'ref')
add('REF_OLED_27x27x5',box(25.5,-13.5,18.8,27,27,5),'Hardware_envelopes',DARK,'ref')
connector=fuse(box(130.62,-4.925,-3.425,16.89,9.85,6.85),box(147.50,-4.925,-3.425,7.89,9.85,8.28))
add('REF_MicroFit_Mated_24p77',connector,'Hardware_envelopes',DARK,'ref',desc='Combined packaging envelope based on Molex drawings, not manufacturer solid CAD. 43020-0600 + 43025-0600, 24.77 mm mated length. Six 24 AWG wires, max insulation OD1.3 mm; service-loop connection. See wiring.md for pin assignments and terminal options.')
add('REF_Pololu_U3V40F5',box(96,-7.62,10.2,15.24,15.24,5.6),'Hardware_envelopes',GREEN,'ref',desc='Pololu 4012 U3V40F5 boost regulator, headerless 15.24 x 15.24 x 5.6 mm. Validate servo transient load, not a 4 A output claim.')
add('REF_Vibration_Driver_Reserve_6x20x10',box(155,-10,9,6,20,10),'Hardware_envelopes',GREEN,'ref',desc='Custom 20 x 10 x 6 max perfboard: AO3400A MOSFET, flyback diode, gate resistor and pull-down. Mount in head with adhesive pad; 5 V supply.')
horn=cut(box(198.6,-13.5,-2.8,2.5,27,5.6),cyl(1.2,4,198))
add('REF_Stock_Horn',horn,'Hardware_envelopes',WHITE,'ref',desc='Stock two-arm horn envelope: trim outer length to 27 mm if needed; preserve spline, center screw and mounting holes.')
servo=fuse(box(168,-17,-6.1,27,23,12.2),box(184.7,-21.65,-6.1,3,32.3,12.2),cyl(2.8,3.3,195))
add('REF_SG90_Body_and_Flanges',servo,'Hardware_envelopes',BLUE,'ref')
add('REF_CoinMotor_10x2p7',cyl(5,2.7,168.55),'Hardware_envelopes',GOLD,'ref')
def tube_keepout(points,r):
 shapes=[]
 for p,q in zip(points,points[1:]):
  a,b=V(*p),V(*q);dv=b-a
  shapes.append(Part.makeCylinder(r,dv.Length,a,dv))
 for p in points[1:-1]:shapes.append(Part.makeSphere(r,V(*p)))
 return fuse(*shapes)
wirepts=[(72,-16,-2.3),(79,-13,-2.3),(85,-10,-3),(112,-10,-3),(122,-10,-3),(125,-6,-1),(126,0,0),(130.62,0,0)]
keepout=tube_keepout(wirepts,C['cable_bundle_reserved_radius_mm'])
low=cut(low,box(78,-15.5,-5.4,8,7,5.5))
setpart('01_Handle_Lower',low)

# Validation: exact BREP validity, number of solids, assembled part interference.
report={'status':'PROVISIONAL — not released for manufacture','units':'mm','parts':{},'interference':[],'reference_interference':[],'notes':['Reference envelopes are selected nominal dimensions; generic-module limits are purchasing requirements.','Force output, sliding friction, servo indexing and electrical performance require physical validation.','The two heads are alternatives; they occupy the same interface coordinates.']}
manifest=[]
for n,d in parts.items():
 s=d['shape'];bb=s.BoundBox
 report['parts'][n]={'valid':s.isValid(),'closed':s.isClosed(),'solids':len(s.Solids),'volume_mm3':round(s.Volume,3),'assembled_bbox_mm':[round(bb.XLength,3),round(bb.YLength,3),round(bb.ZLength,3)]}
 s.exportStep(str(OUT/'cad'/f'{n}.step'))
 # Printable part in millimetres, normalized onto Z=0. Orientation listed in manifest.
 pr=s.copy()
 if d['group'] in ['Filament_head','Vibration_head'] or n=='06_MicroFit_Panel_Insert' or n.startswith(('15_','16_','17_','18_')):pr.rotate(V(0,0,0),V(0,1,0),90)
 if n=='01_Handle_Lower':pr.rotate(V(0,0,0),V(0,1,0),-90)
 bbp=pr.BoundBox;pr.translate(V(-bbp.XMin,-bbp.YMin,-bbp.ZMin))
 mesh=MeshPart.meshFromShape(Shape=pr,LinearDeflection=.06,AngularDeflection=.15,Relative=False)
 mesh.translate(0,0,-mesh.BoundBox.ZMin)
 mesh.write(str(OUT/'stl'/f'{n}.stl'))
 # Separate assembly meshes for rendering: do not pass these to a slicer.
 am=MeshPart.meshFromShape(Shape=s,LinearDeflection=.06,AngularDeflection=.15,Relative=False);am.write(str(OUT/'reference'/f'{n}.stl'))
 manifest.append({'name':n,'kind':'print','group':d['group'],'color':d['color'],'description':d['description'],'assembly_mesh':f'reference/{n}.stl'})
for n,d in refs.items():
 mesh=MeshPart.meshFromShape(Shape=d['shape'],LinearDeflection=.06,AngularDeflection=.15,Relative=False);mesh.write(str(OUT/'reference'/f'{n}.stl'))
 manifest.append({'name':n,'kind':'reference','group':d['group'],'color':d['color'],'description':d['description'],'assembly_mesh':f'reference/{n}.stl'})
# Exact collision checks within each configuration.
for cfg in ['Filament_head','Vibration_head']:
 names=[n for n,d in parts.items() if d['group'] in ['Handle',cfg]]
 for i,n in enumerate(names):
  for m in names[i+1:]:
   a=parts[n]['shape'];b=parts[m]['shape']
   if not a.BoundBox.intersect(b.BoundBox):continue
   vol=a.common(b).Volume
   if vol>.05:report['interference'].append({'configuration':cfg,'a':n,'b':m,'overlap_mm3':round(vol,3)})
for n,d in refs.items():
 group='Vibration_head' if ('CoinMotor' in n or 'Vibration_Driver' in n) else ('Filament_head' if any(w in n for w in ['SG90','Nylon','Probe_','TCST','Stock_Horn']) else 'Handle')
 for m,p in parts.items():
  if p['group']!=group:continue
  a=d['shape'];b=p['shape']
  if not a.BoundBox.intersect(b.BoundBox):continue
  vol=a.common(b).Volume
  if vol>.05:report['reference_interference'].append({'reference':n,'part':m,'overlap_mm3':round(vol,3)})
report['reference_to_reference_interference']=[]
for cfg in ['Filament_head','Vibration_head']:
 rn=[n for n in refs if ('CoinMotor' not in n and 'Vibration_Driver' not in n) or cfg=='Vibration_head']
 if cfg=='Vibration_head':rn=[n for n in rn if not any(w in n for w in ['SG90','Nylon','Probe_','TCST','Stock_Horn'])]
 for i,n in enumerate(rn):
  for m in rn[i+1:]:
   vol=refs[n]['shape'].common(refs[m]['shape']).Volume
   if vol>.05:report['reference_to_reference_interference'].append({'configuration':cfg,'a':n,'b':m,'overlap_mm3':round(vol,3)})
# Sampled rigid insertion checks: these do not simulate flexible cable motion.
report['assembly_paths']=[]
handle_shapes=[v['shape'] for v in parts.values() if v['group']=='Handle']
for cfg in ['Filament_head','Vibration_head']:
 moving=Part.makeCompound([v['shape'] for v in parts.values() if v['group']==cfg])
 worst=0;worst_at=None
 for dx in [0,.2,.5,1,2,4,6,8,12,20,30,45]:
  sh=moving.copy();sh.translate(V(dx,0,0))
  for n,d in parts.items():
   if d['group']!='Handle':continue
   overlap=sh.common(d['shape']).Volume
   if overlap>worst:worst=overlap;worst_at={'translation_x_mm':dx,'part':n}
 report['assembly_paths'].append({'operation':cfg+' axial withdrawal','max_overlap_mm3':round(worst,5),'at':worst_at,'samples':12})
worst=0;worst_at=None
for dz in [0,.2,.5,1,2,3,5,10,20,40,65]:
 sh=up.copy();sh.translate(V(0,0,dz))
 for n,d in parts.items():
  if d['group'] not in ['Handle'] or n in ['02_Handle_Upper','12_Button_Cap','30_OLED_Retainer']:continue
  overlap=sh.common(d['shape']).Volume
  if overlap>worst:worst=overlap;worst_at={'translation_z_mm':dz,'part':n}
report['assembly_paths'].append({'operation':'Upper shell removal after screw removal','max_overlap_mm3':round(worst,5),'at':worst_at,'samples':11})
# Carrier rotation includes all three straight nylon clearance envelopes.
# Probe travel excludes flexible nylon deflection; buckling requires physical testing.
report['mechanism_motion']=[]
rotating_names=['21_Three_Position_Carrier','22_Nylon_Insert_1','23_Nylon_Insert_2','24_Nylon_Insert_3','25_Insert_Retainer']
fixed_names=[n for n,d in parts.items() if d['group']=='Filament_head' and n not in rotating_names+['26_Probe_Rear_Pad_and_Flag','28_Probe_Tip']]
for label,values,names,axis in [('carrier',range(-60,61,10),rotating_names,'rotate'),('probe',[0,1,2,3,4,5,6],['26_Probe_Rear_Pad_and_Flag','28_Probe_Tip'],'translate')]:
 worst=0;at=None
 moving_shapes=[parts[n]['shape'] for n in names]
 if label=='carrier':moving_shapes += [d['shape'] for n,d in refs.items() if 'REF_Nylon_' in n]
 moving=Part.makeCompound(moving_shapes)
 for value in values:
  sh=moving.copy()
  if axis=='rotate':sh.rotate(V(0,0,0),V(1,0,0),value)
  else:sh.translate(V(-value,0,0))
  for n in fixed_names:
   overlap=sh.common(parts[n]['shape']).Volume
   if overlap>worst:worst=overlap;at={'position':value,'part':n}
  overlap=sh.common(refs['REF_TCST2103']['shape']).Volume
  if overlap>worst:worst=overlap;at={'position':value,'part':'REF_TCST2103'}
 report['mechanism_motion'].append({'operation':label,'samples':len(values),'max_overlap_mm3':round(worst,5),'at':at})
report['wire_route']={'reserved_bundle_diameter_mm':2*C['cable_bundle_reserved_radius_mm'],'path_mm':wirepts,'interference':[],'note':'Piecewise rounded clearance reserve only; final flexible-wire bend radius and endpoint strain relief depend on selected wire.'}
for n,d in parts.items():
 if d['group']!='Handle':continue
 overlap=keepout.common(d['shape']).Volume
 if overlap>.05:report['wire_route']['interference'].append({'part':n,'overlap_mm3':round(overlap,4)})
for n,d in refs.items():
 if any(w in n for w in ['SG90','Nylon','Probe_','TCST','Stock_Horn','CoinMotor','Vibration_Driver','MicroFit']):continue
 overlap=keepout.common(d['shape']).Volume
 if overlap>.05:report['wire_route']['interference'].append({'reference':n,'overlap_mm3':round(overlap,4)})
keepout.exportStep(str(OUT/'reference/Handle_Harness_Keepout.step'))
(OUT/'source/wire_route.json').write_text(json.dumps(report['wire_route'],indent=2))
DOC.recompute();DOC.saveAs(str(OUT/'cad/SoleSense_R03.FCStd'))
for cfg in ['Filament_head','Vibration_head']:
 shapes=[d['shape'] for d in parts.values() if d['group'] in ['Handle',cfg]]
 Part.makeCompound(shapes).exportStep(str(OUT/'cad'/f'SoleSense_R03_{cfg}_Assembly.step'))
(OUT/'source/assembly_manifest.json').write_text(json.dumps(manifest,indent=2))
(OUT/'validation/cad_validation.json').write_text(json.dumps(report,indent=2))
print(json.dumps(report,indent=2))

assert all(v['valid'] and v['closed'] and v['solids']==1 for v in report['parts'].values()), 'Invalid CAD part'
assert not report['interference'] and not report['reference_interference'] and not report['reference_to_reference_interference'], 'Assembly interference'
assert not report['wire_route']['interference'], 'Harness route collision'
assert all(v['max_overlap_mm3']<.05 for v in report['assembly_paths']+report['mechanism_motion']), 'Motion collision'
print('ALL_CAD_CHECKS_PASSED')
