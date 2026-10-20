"""Read-only checks of the saved, baked Blender animation."""
import bpy,json,math
from pathlib import Path
OUT=Path(__file__).resolve().parents[1];s=bpy.context.scene;objs=bpy.data.objects;rows=[]
for f in range(421,649):
 s.frame_set(f);t=(f-1)/12
 if t<44:d=1-math.cos(2*math.pi*(t-35)/4.5)
 else:d=1-math.cos(2*math.pi*(t-44)/5)
 dy=-.6*d*d/18
 for n in ['44_Moving_Carriage','48_Locking_Filament_Cartridge','REF_Nylon_Unrated','REF_Magnet_6x3_Axial']:
  assert abs(objs[n].location.x+d)<1e-5 and abs(objs[n].location.y-dy)<1e-5,(f,n)
 for n in ['47_Adjustable_Hall_Mount','REF_DRV5055A3QLPG_Envelope']:
  assert objs[n].location.length<1e-7
 assert objs['REF_Service_Pin_M3x30'].hide_render and objs['55_Spring_Assembly_Bridge'].hide_render
 for i,x in enumerate([190,217],1):
  o=objs[f'REF_Phosphor_Bronze_Leaf_{i}'];ev=o.evaluated_get(bpy.context.evaluated_depsgraph_get());mesh=ev.to_mesh()
  fixed=[v.co for v in mesh.vertices if abs(v.co.y+25)<1e-5]
  ymax=max(v.co.y for v in mesh.vertices);moving=[v.co for v in mesh.vertices if abs(v.co.y-ymax)<1e-5]
  assert fixed and abs(min(v.x for v in fixed)-x)<2e-5
  assert abs(min(v.x for v in moving)-(x-d))<3e-5 and abs(ymax-(3+dy))<3e-5,(f,i,d,min(v.x for v in moving),ymax)
  ev.to_mesh_clear()
 rows.append({'frame':f,'stroke_mm':round(d,5),'magnet_face_gap_mm':round(8.2-d,5)})
for f in [1,720]:
 s.frame_set(f)
 assert not objs['43_Removable_Lid'].hide_render
 assert objs['REF_Service_Pin_M3x30'].hide_render
 assert objs['55_Spring_Assembly_Bridge'].hide_render
 assert objs['REF_Magnet_6x3_Axial'].location.length<1e-7
report={'saved_blend_checked':True,'press_frames_checked':len(rows),'moving_parts_synchronized':True,'sensor_stationary':True,'leaf_fixed_anchors_unchanged':True,'leaf_moving_ends_match_carriage':True,'service_pin_and_bridge_absent_during_press':True,'stroke_range_mm':[min(r['stroke_mm'] for r in rows),max(r['stroke_mm'] for r in rows)],'illustrative_face_gap_range_mm':[min(r['magnet_face_gap_mm'] for r in rows),max(r['magnet_face_gap_mm'] for r in rows)],'physical_model_validated':False}
(OUT/'baked_scene_checks.json').write_text(json.dumps(report,indent=2));print(json.dumps(report,indent=2))
