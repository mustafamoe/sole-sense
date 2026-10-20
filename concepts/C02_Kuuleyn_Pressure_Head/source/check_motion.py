"""Verify prescribed concept motion, not engineering performance."""
import bpy, json
from pathlib import Path
s=bpy.context.scene
moving=[s.objects[n] for n in ['Moving bracket bolted to loaded end','Bracket upper bridge','Bracket vertical arm','Bracket to cartridge stem','Floating cartridge receiver','35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated']]
fixed=s.objects['Fixed wired-end mounting boss']
beam=s.objects['Kuuleyn 100 g - photo-based beam']
base=beam.data.shape_keys.key_blocks['Unloaded'];bend=beam.data.shape_keys.key_blocks['Enlarged elastic movement']
s.frame_set(1);origins={o.name:o.location.copy() for o in moving+[fixed]}
s.frame_set(133)
assert (fixed.location-origins[fixed.name]).length<1e-7
for o in moving:assert abs(o.location.x-origins[o.name].x+1.2)<1e-4
cartridge=s.objects['35_Replaceable_Filament_Cartridge']
flange=[cartridge.matrix_world @ v.co for v in cartridge.data.vertices if v.co.x>183.3 and (v.co.y*v.co.y+v.co.z*v.co.z)**.5>9]
assert flange
gap=min(p.x for p in flange)-196
assert gap>1.19, gap
assert abs(bend.value-1)<1e-7
fixed_vertices=loaded_vertices=0
for a,b in zip(base.data,bend.data):
 if a.co.z<=-17.5:
  assert (a.co-b.co).length<1e-6;fixed_vertices+=1
 if a.co.z>=17.5:
  assert abs(a.co.x-b.co.x-1.2)<1e-4;loaded_vertices+=1
assert fixed_vertices and loaded_vertices
s.frame_set(190)
for o in moving:assert (o.location-origins[o.name]).length<1e-5
assert abs(bend.value)<1e-6
result={'test_type':'prescribed-animation transforms and illustrated axial flange clearance','moving_parts':len(moving),'fixed_end_vertices':fixed_vertices,'loaded_end_vertices':loaded_vertices,'visual_displacement_mm':1.2,'pressed_flange_to_nose_axial_gap_mm':round(gap,4),'release_returns_to_origin':True,'physical_simulation':False,'manufacturer_dimensions_verified':False,'force_calibrated':False}
out=Path(bpy.data.filepath).parents[1]
(out/'video/motion_checks.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result))
