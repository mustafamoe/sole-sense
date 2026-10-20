"""Check prescribed animation transforms, not physical design performance."""
import bpy, json
from pathlib import Path
s=bpy.context.scene
outer=[o for o in s.objects if o.name.startswith('Fixed outer ring')]
moving=[s.objects[n] for n in ['Moving axial force-transfer stem','Moving cartridge receiver','35_Replaceable_Filament_Cartridge','REF_Exposed_Nylon_Uncalibrated']]
leaves=[o for o in s.objects if o.name.startswith('Flexure ') and o.type=='MESH']
s.frame_set(1)
origins={o.name:o.location.copy() for o in outer+moving}
s.frame_set(169)
for o in outer:assert (o.location-origins[o.name]).length<1e-7
for o in moving:assert abs(o.location.x-origins[o.name].x+1.8)<1e-4
for o in leaves:
 basis=o.data.shape_keys.key_blocks['Relaxed'];bent=o.data.shape_keys.key_blocks['Exaggerated axial bend']
 assert abs(bent.value-1)<1e-6
 for i in range(4):assert (basis.data[i].co-bent.data[i].co).length<1e-7
 assert abs(basis.data[-1].co.x-bent.data[-1].co.x-1.8)<1e-4
s.frame_set(276)
for o in moving:assert (o.location-origins[o.name]).length<1e-5
for o in leaves:assert abs(o.data.shape_keys.key_blocks['Exaggerated axial bend'].value)<1e-6
result={'type':'animation-transform checks only','fixed_rings':len(outer),'moving_parts_checked':len(moving),'leaves_with_fixed_outer_anchors':len(leaves),'pressed_visual_displacement_mm':1.8,'release_returns_to_origin':True,'physical_simulation':False,'force_calibration':False}
out=Path(bpy.data.filepath).parents[1]
(out/'video/motion_checks.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result))
