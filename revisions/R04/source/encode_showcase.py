"""Encode the completed 1,056-frame CAD animation as a chaptered MP4."""
from pathlib import Path
import subprocess, json, shutil
OUT=Path(__file__).resolve().parents[1];v=OUT/'video';fps=24;count=1056
for i in range(1,count+1):
    p=v/'frames'/f'frame_{i:04}.png'
    if not p.exists():raise SystemExit(f'Missing frame {i}; finish rendering before encoding.')
cmd=['/opt/homebrew/bin/ffmpeg','-y','-hide_banner','-loglevel','warning','-framerate',str(fps),'-start_number','1','-i',str(v/'frames/frame_%04d.png'),'-i',str(v/'chapters.ffmetadata'),'-map','0:v:0','-map_metadata','1','-map_chapters','1','-c:v','libx264','-preset','medium','-crf','18','-pix_fmt','yuv420p','-movflags','+faststart',str(v/'SoleSense_R04_Showcase.mp4')]
subprocess.run(cmd,check=True)
probe=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-select_streams','v:0','-show_streams','-show_format','-show_chapters','-of','json',str(v/'SoleSense_R04_Showcase.mp4')]))
stream=probe['streams'][0]
assert int(stream['nb_frames'])==count
assert float(probe['format']['duration'])==44
assert stream['width']==1280 and stream['height']==720
assert stream['pix_fmt']=='yuv420p'
(v/'video_validation.json').write_text(json.dumps(probe,indent=2))
shutil.copyfile(v/'frames/frame_0025.png',v/'SoleSense_R04_Poster.png')
print('VIDEO_ENCODED_AND_VERIFIED',v/'SoleSense_R04_Showcase.mp4')
