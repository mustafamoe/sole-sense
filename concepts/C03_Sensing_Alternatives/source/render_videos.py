"""Render sampled motion, reusing identical poses. Final playback is 24 fps."""
import bpy,json,shutil,sys
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
selected=args[args.index('--only')+1] if '--only' in args else None
for blend in sorted((OUT/'cad').glob('*.blend')):
 if selected and not blend.stem.startswith(selected):continue
 bpy.ops.wm.open_mainfile(filepath=str(blend));s=bpy.context.scene;name=s['output_name']
 frames=OUT/'video/frames'/name;frames.mkdir(parents=True,exist_ok=True)
 manifest=json.loads((OUT/'source'/f'{name}_frames.json').read_text())
 last=None;last_pose=None;count=0
 for d in manifest:
  f=d['frame'];target=frames/f'frame_{f:04d}.png'
  pose={k:v for k,v in d.items() if k!='frame'}
  hold=last is not None and (f%2==0 or pose==last_pose)
  if hold:shutil.copyfile(last,target)
  else:
   s.frame_set(f);s.render.filepath=str(target);bpy.ops.render.render(write_still=True)
   last=target;last_pose=pose;count+=1
  if f%24==0:print('PROGRESS',name,f,'/ 384',flush=True)
 print('RENDERED',name,count,'distinct frames',flush=True)
