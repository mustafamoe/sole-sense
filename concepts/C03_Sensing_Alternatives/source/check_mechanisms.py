"""Animation and selected geometric checks only; not performance qualification."""
import bpy,json
from pathlib import Path
from mathutils import Vector
OUT=Path(__file__).resolve().parents[1]
reports=[]
def bounds(o):
 points=[o.matrix_world@Vector(v) for v in o.bound_box]
 return [min(v.x for v in points),max(v.x for v in points)]
for path in sorted((OUT/'cad').glob('*.blend')):
 bpy.ops.wm.open_mainfile(filepath=str(path));s=bpy.context.scene
 moving=[s.objects[n] for n in json.loads(s['moving_parts'])]
 fixed=[s.objects[n] for n in json.loads(s['fixed_parts'])]
 s.frame_set(1);origins={o.name:o.location.copy() for o in moving+fixed}
 s.frame_set(145);stroke=s['illustrative_stroke_mm']
 for o in fixed:assert (o.location-origins[o.name]).length<1e-6,o.name
 for o in moving:assert abs(o.location.x-origins[o.name].x+stroke*o.get('fractional_motion',1))<1e-4,o.name
 cartridge=s.objects['35_Replaceable_Filament_Cartridge']
 flange=[cartridge.matrix_world@v.co for v in cartridge.data.vertices if v.co.x>183.3 and (v.co.y*v.co.y+v.co.z*v.co.z)**.5>9]
 gap=min(v.x for v in flange)-196;assert gap>1.19,gap
 leaves=[o for o in s.objects if o.name.startswith('Bending leaf')]
 for o in leaves:
  base=o.data.shape_keys.key_blocks['Rest'];k=o.data.shape_keys.key_blocks['Illustrated deformation']
  assert abs(k.value-1)<1e-5
  for i in range(4):assert (base.data[i].co-k.data[i].co).length<1e-6
  for i in range(-4,0):assert abs(base.data[i].co.x-k.data[i].co.x-stroke)<1e-4
 extra={}
 if s['concept_mode']=='capacitive':
  for a,b in [('Thin sensor rear layer','Thin sensor dielectric'),('Thin sensor dielectric','Thin sensor front layer'),('Diagram rear conductive layer','Diagram soft dielectric'),('Diagram soft dielectric','Diagram front conductive layer'),('Diagram front conductive layer','Diagram pressure pad')]:
   delta=bounds(s.objects[b])[0]-bounds(s.objects[a])[1]
   extra[a+' to '+b]=round(delta,6)
   assert abs(delta)<.001,(a,b,delta)
 s.frame_set(361)
 for o in moving:assert (o.location-origins[o.name]).length<1e-5,o.name
 reports.append({'mode':s['concept_mode'],'moving_parts':len(moving),'fixed_parts':len(fixed),'flexure_leaves_with_fixed_outer_anchors':len(leaves),'pressed_cartridge_flange_clearance_mm':round(gap,3),'release_returns_to_origin':True,'layer_interface_gaps_mm':extra,'physical_simulation':False,'force_accuracy_validated':False})
(OUT/'video/motion_checks.json').write_text(json.dumps(reports,indent=2))
print(json.dumps(reports,indent=2))
