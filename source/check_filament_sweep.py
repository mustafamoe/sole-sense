import sys,json
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as A, Part
O=Path(__file__).resolve().parents[1];d=A.openDocument(str(O/'cad/SoleSense_R03.FCStd'));V=A.Vector
# Conservative continuous envelope: R10 centre path +/-0.45 filament radius,
# across the full -30..210 degree sector reached by the three 60-degree-spaced
# pockets during +/-60-degree indexing. The z clipping slightly overbounds it.
s=Part.makeCylinder(10.45,38,V(207.9,0,0),V(1,0,0)).cut(Part.makeCylinder(9.55,40,V(206.9,0,0),V(1,0,0)))
s=s.common(Part.makeBox(40,30,20,V(207,-15,-5.45)))
rotating=['21_','22_','23_','24_','25_']
manifest=json.loads((O/'source/assembly_manifest.json').read_text());hits=[];tested=[]
for row in manifest:
 n=row['name']
 if row['group']=='Filament_head' and not any(n.startswith(p) for p in rotating) or n in ['REF_TCST2103','REF_SG90_Body_and_Flanges','REF_Probe_PTFE_Bushing','REF_Probe_Rod_3x20']:
  obj=next(o for o in d.Objects if o.Label==n.replace('_',' '))
  vol=s.common(obj.Shape).Volume;tested.append(n)
  if vol>.05:hits.append({'part':n,'overlap_mm3':vol})
report={'method':'Conservative continuous straight-filament sweep at unloaded probe position','sector_degrees':[-30,210],'radius_bounds_mm':[9.55,10.45],'minimum_z_mm':-5.45,'tested':tested,'interference':hits,'excludes':'Flexible buckling under load and flexible service-loop movement'}
(O/'validation/continuous_filament_sweep.json').write_text(json.dumps(report,indent=2));s.exportStep(str(O/'reference/Filament_Index_Sweep.step'))
assert not hits,hits
print('CONTINUOUS_FILAMENT_SWEEP_PASSED')
