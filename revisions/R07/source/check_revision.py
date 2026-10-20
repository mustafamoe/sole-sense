"""Compare R07 with the preserved R06 release; local part geometry and packaging."""
import sys,json
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as A
O=Path(__file__).resolve().parents[1];old=O/'source/dependencies/R06_review'
previous=A.openDocument(str(old/'cad/SoleSense_R06.FCStd'))
current=A.openDocument(str(O/'cad/SoleSense_R07.FCStd'))
md=json.loads((O/'source/assembly_manifest.json').read_text())
changed={'41_R04_Joint_Adaptor','42_Magnetic_Chassis','43_Removable_Lid','55_Spring_Assembly_Bridge','56_Teal_Spine_Inlay'}
def shape(doc,n):return doc.getObject('P_'+n).Shape.copy()
def local(s):
    b=s.BoundBox;s.translate(A.Vector(-b.XMin,-b.YMin,-b.ZMin));return s
report={'reused_print_parts':[],'retained_assembly_parts':[],'stage_translation':[],'dimensions':{}}
for d in md:
    n=d['name']
    if previous.getObject('P_'+n) is None:continue
    a=shape(previous,n);b=shape(current,n)
    if d['group'] in ['Handle','Interface','Vibration_head']:
        diff=a.cut(b).Volume+b.cut(a).Volume
        assert diff<.001,(n,diff)
        report['retained_assembly_parts'].append({'part':n,'symmetric_difference_mm3':diff})
    if d['kind']=='print' and n not in changed:
        a=local(a);b=local(b);diff=a.cut(b).Volume+b.cut(a).Volume
        assert diff<.001,(n,diff)
        report['reused_print_parts'].append({'part':n,'symmetric_difference_mm3':diff})
for n in ['REF_Phosphor_Bronze_Leaf_1','REF_Phosphor_Bronze_Leaf_2','REF_Magnet_6x3_Axial','REF_DRV5055A3QLPG_Envelope','47_Adjustable_Hall_Mount','46_Magnet_Retainer']:
    a=shape(previous,n);b=shape(current,n)
    diff=a.cut(b).Volume+b.cut(a).Volume
    assert diff<.001,(n,diff)
    report['stage_translation'].append({'part':n,'shift_y_mm':0,'symmetric_difference_mm3':diff})
base=shape(current,'42_Magnetic_Chassis').BoundBox
lid=shape(current,'43_Removable_Lid').BoundBox
tip=shape(current,'REF_Nylon_Unrated').BoundBox
gap=shape(current,'REF_Magnet_6x3_Axial').BoundBox.XMin-shape(current,'REF_DRV5055A3QLPG_Envelope').BoundBox.XMax
report['dimensions']={'housing_width_mm':base.YLength,'lid_width_mm':lid.YLength,'housing_length_mm':base.XLength,'housing_height_with_cover_mm':lid.ZMax-base.ZMin,'overall_tip_x_mm':tip.XMax,'filament_center_y_mm':(tip.YMin+tip.YMax)/2,'hall_package_gap_mm':gap,'front_face_width_mm':28}
assert abs(base.YLength-56)<.001 and abs(lid.YLength-56)<.001
assert abs(base.XLength-76)<.001 and abs(tip.XMax-283.4)<.001
assert abs((tip.YMin+tip.YMax)/2)<.001 and abs(gap-8.2)<.001
(O/'validation/revision_comparison.json').write_text(json.dumps(report,indent=2))
print('R07_REVISION_COMPARISON_PASSED',json.dumps(report['dimensions']))
