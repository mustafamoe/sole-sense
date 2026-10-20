import sys,json
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App,Part,Mesh
out=Path(__file__).resolve().parents[1]
report=[]
for p in sorted((out/'stl').glob('*.stl')):
 m=Mesh.Mesh(str(p));s=Part.read(str(out/'cad'/f'{p.stem}.step'))
 d={'name':p.name,'facets':m.CountFacets,'mesh_closed':m.isSolid(),'non_manifold':m.hasNonManifolds(),'components':m.countComponents(),'self_intersections':m.hasSelfIntersections(),'minimum_z_mm':m.BoundBox.ZMin,'mesh_volume_mm3':m.Volume,'step_valid':s.isValid(),'step_solids':len(s.Solids),'volume_relative_error':abs(m.Volume-s.Volume)/s.Volume}
 report.append(d);print(json.dumps(d),flush=True)
(out/'validation/export_validation.json').write_text(json.dumps(report,indent=2))
assert all(d['mesh_closed'] and not d['non_manifold'] and not d['self_intersections'] and d['components']==1 and d['step_valid'] and d['step_solids']==1 and d['minimum_z_mm']>-.01 and d['volume_relative_error']<.01 for d in report)
print('ALL_EXPORTS_PASSED')
