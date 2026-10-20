import sys,json,math
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App,Part
V=App.Vector;OUT=Path(__file__).resolve().parents[1]
doc=App.openDocument(str(OUT/'cad/SoleSense_R05.FCStd'))
md=json.loads((OUT/'source/assembly_manifest.json').read_text())
items={d['name']:{**d,'shape':doc.getObject('P_'+d['name']).Shape.copy()} for d in md}
active={n:d for n,d in items.items() if d['group'] in ['Magnetic_head','Handle','Interface','Hardware','Fasteners','Springs']}
report={'static_collisions':[],'intentional_thread_envelopes':[],'travel':[],'stops':[],'service_lock':[]}
def threaded(a,b):
    if 'REF_' not in a or 'REF_' not in b:return False
    return a.replace('_Screw_','_Nut_')==b or b.replace('_Screw_','_Nut_')==a
names=list(active)
for i,n in enumerate(names):
    a=active[n]['shape']
    for m in names[i+1:]:
        b=active[m]['shape']
        if not a.BoundBox.intersect(b.BoundBox):continue
        vol=a.common(b).Volume
        if vol>.01:
            row={'a':n,'b':m,'volume_mm3':round(vol,5)}
            report['intentional_thread_envelopes' if threaded(n,m) else 'static_collisions'].append(row)
moving={n:d['shape'] for n,d in active.items() if d['moving']}
fixed={n:d['shape'] for n,d in active.items() if not d['moving'] and d['group']!='Springs'}
for travel in [-1,-.5,0,.25,.5,1,1.5,2,2.4]:
    overlaps=[];dy=-.6*travel*travel/18
    for n,orig in moving.items():
        a=orig.copy();a.translate(V(-travel,dy,0))
        for m,b in fixed.items():
            if not a.BoundBox.intersect(b.BoundBox):continue
            vol=a.common(b).Volume
            if vol>.01:overlaps.append({'moving':n,'fixed':m,'mm3':round(vol,5)})
    report['travel'].append({'compression_mm':travel,'side_shift_mm':dy,'overlaps':overlaps})
for d in [2.4,2.5,-1,-1.1]:
    s=moving['44_Moving_Carriage'].copy();s.translate(V(-d,-.6*d*d/18,0))
    report['stops'].append({'compression_mm':d,'overlap_mm3':s.common(fixed['42_Magnetic_Chassis']).Volume})
pin=items['REF_Service_Pin_M3x25']['shape']
for d in [0,.5,-.5]:
    s=moving['44_Moving_Carriage'].copy();s.translate(V(-d,0,0))
    report['service_lock'].append({'travel_mm':d,'overlap_mm3':s.common(pin).Volume})
# Cartridge motion with radial lock screw removed; carriage is service-pinned.
cart=moving['48_Locking_Filament_Cartridge'];carrier=moving['44_Moving_Carriage']
report['cartridge_swap']=[]
for angle in range(0,31,5):
    s=cart.copy();s.rotate(V(),V(1,0,0),angle)
    report['cartridge_swap'].append({'angle_deg':angle,'overlap_mm3':s.common(carrier).Volume})
s=cart.copy();s.rotate(V(),V(1,0,0),30)
for dx in [0,1,3,7,12]:
    t=s.copy();t.translate(V(dx,0,0));report['cartridge_swap'].append({'withdraw_mm':dx,'overlap_mm3':t.common(carrier).Volume})
def spring_shape(x,d):
    dy=-.6*d*d/18;pts=[(x,-32),(x,-27)]
    for i in range(1,41):
        t=i/40;pts.append((x-d*(3*t*t-2*t*t*t),-27+(18+dy)*t))
    pts.append((x-d,-4+dy))
    v=[V(px,py,-6) for px,py in pts]+[V(px+.1,py,-6) for px,py in reversed(pts)]
    return Part.Face(Part.makePolygon(v+[v[0]])).extrude(V(0,0,12))
report['leaf_clearance']=[]
for d in [-1,0,.5,1,1.5,2,2.4]:
    worst=0;hit=None
    for x in [190,217]:
        leaf=spring_shape(x,d)
        for n,entry in active.items():
            if entry['group']=='Springs':continue
            shape=entry['shape'].copy()
            if entry['moving']:shape.translate(V(-d,-.6*d*d/18,0))
            if not leaf.BoundBox.intersect(shape.BoundBox):continue
            vol=leaf.common(shape).Volume
            if vol>worst:worst=vol;hit=n
    report['leaf_clearance'].append({'compression_mm':d,'max_overlap_mm3':worst,'part':hit,'note':'Prescribed beam shape, not FEA'})
report['sensor_adjustment']=[]
sensor_names=['47_Adjustable_Hall_Mount','REF_DRV5055A3QLPG_Envelope','REF_Hall_Lead_1','REF_Hall_Lead_2','REF_Hall_Lead_3']
for offset in [-1,0,1]:
    worst=0;hit=None
    for n in sensor_names:
        a=active[n]['shape'].copy();a.translate(V(offset,0,0))
        for m,b in fixed.items():
            if m in sensor_names:continue
            if not a.BoundBox.intersect(b.BoundBox):continue
            vol=a.common(b).Volume
            if vol>worst:worst=vol;hit=m
    report['sensor_adjustment'].append({'offset_mm':offset,'max_overlap_mm3':worst,'part':hit})
report['head_exchange']=[]
collar=Part.makeCompound([items[n]['shape'] for n in ['33_Captive_Collar_Right','40_Captive_Collar_Left']])
head=Part.makeCompound([d['shape'] for n,d in active.items() if d['group'] not in ['Handle','Interface']])
for angle in range(-30,1,5):
    c=collar.copy();c.rotate(V(),V(1,0,0),angle)
    report['head_exchange'].append({'collar_deg':angle,'overlap_head_mm3':c.common(head).Volume})
c=collar.copy();c.rotate(V(),V(1,0,0),-30)
for dx in [0,.5,1,2,4,6,10,20]:
    h=head.copy();h.translate(V(dx,0,0));report['head_exchange'].append({'withdraw_mm':dx,'overlap_collar_mm3':h.common(c).Volume})
(OUT/'validation/assembly_checks.json').write_text(json.dumps(report,indent=2))
print(json.dumps(report,indent=2),flush=True)
assert not report['static_collisions'],'Static collision'
assert all(not r['overlaps'] for r in report['travel']),'Travel collision'
assert report['stops'][0]['overlap_mm3']<.01 and report['stops'][1]['overlap_mm3']>.01
assert report['stops'][2]['overlap_mm3']<.01 and report['stops'][3]['overlap_mm3']>.01
assert report['service_lock'][0]['overlap_mm3']<.01 and all(r['overlap_mm3']>.01 for r in report['service_lock'][1:])
assert all(r['overlap_mm3']<.01 for r in report['cartridge_swap'])
assert all(r['max_overlap_mm3']<.01 for r in report['leaf_clearance'])
assert all(r['max_overlap_mm3']<.01 for r in report['sensor_adjustment'])
assert all(r.get('overlap_head_mm3',r.get('overlap_collar_mm3',0))<.01 for r in report['head_exchange'])
print('R05_ASSEMBLY_AND_TRAVEL_PASSED')
