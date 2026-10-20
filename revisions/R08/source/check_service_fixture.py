"""Check the temporary open bridge in place of the normal cover."""
import sys,json
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as A,Part
o=Path(__file__).resolve().parents[1];d=A.openDocument(str(o/'cad/SoleSense_R08.FCStd'))
def shape(n):return d.getObject('P_'+n).Shape
bridge=shape('55_Spring_Assembly_Bridge')
checks=[]
for n in ['42_Magnetic_Chassis','44_Moving_Carriage','REF_Service_Pin_M3x30','REF_Lid_Screw_2_1','REF_Lid_Screw_2_2']:
 checks.append({'part':n,'overlap_mm3':bridge.common(shape(n)).Volume})
# 3 mm diameter straight driver envelope above each fixed M2 screw.
for i,(x,y) in enumerate([(185.5,-21.6),(222.5,-21.6)],1):
 tool=Part.makeCylinder(1.5,65,A.Vector(x,y,-6.6))
 for n in ['42_Magnetic_Chassis','44_Moving_Carriage','55_Spring_Assembly_Bridge']:
  checks.append({'part':n,'driver_access':i,'overlap_mm3':tool.common(shape(n)).Volume})
assert all(c['overlap_mm3']<.01 for c in checks)
(o/'validation/service_fixture.json').write_text(json.dumps(checks,indent=2))
print('ASSEMBLY_BRIDGE_FIT_PASSED')
