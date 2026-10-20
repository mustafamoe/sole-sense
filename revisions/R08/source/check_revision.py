"""R08 changes only the chassis, carriage, fixture, spring and spring hardware."""
import sys,json
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as A
O=Path(__file__).resolve().parents[1]
previous=A.openDocument(str(O/'source/dependencies/R07_baseline/cad/SoleSense_R07.FCStd'))
current=A.openDocument(str(O/'cad/SoleSense_R08.FCStd'))
md=json.loads((O/'source/assembly_manifest.json').read_text())
changed={'42_Magnetic_Chassis','44_Moving_Carriage','55_Spring_Assembly_Bridge'}
report={'unchanged_parts':[],'changed_parts':[],'new_parts':[],'removed_parts':[],'dimensions':{}}
for d in md:
    n=d['name'];b=current.getObject('P_'+n).Shape
    old=previous.getObject('P_'+n)
    if old is None:report['new_parts'].append(n);continue
    a=old.Shape
    diff=a.cut(b).Volume+b.cut(a).Volume
    if n in changed:
        assert diff>.01
        report['changed_parts'].append({'name':n,'symmetric_difference_mm3':diff})
    else:
        assert diff<.001,(n,diff)
        report['unchanged_parts'].append({'name':n,'symmetric_difference_mm3':diff})
oldmd=json.loads((O/'source/dependencies/R07_baseline/source/assembly_manifest.json').read_text())
names={d['name'] for d in md}
report['removed_parts']=[d['name'] for d in oldmd if d['name'] not in names]
def shape(n):return current.getObject('P_'+n).Shape
b=shape('42_Magnetic_Chassis').BoundBox;l=shape('43_Removable_Lid').BoundBox
gap=shape('REF_Magnet_6x3_Axial').BoundBox.XMin-shape('REF_DRV5055A3QLPG_Envelope').BoundBox.XMax
report['dimensions']={'housing_width_mm':b.YLength,'housing_length_mm':b.XLength,'housing_height_mm':l.ZMax-b.ZMin,'hall_package_gap_mm':gap,'overall_tip_x_mm':shape('REF_Nylon_Unrated').BoundBox.XMax}
assert abs(b.YLength-56)<.001 and abs(b.XLength-76)<.001 and abs(gap-8.2)<.001
(O/'validation/revision_comparison.json').write_text(json.dumps(report,indent=2))
print('R08_REVISION_COMPARISON_PASSED',len(report['unchanged_parts']))
