"""Encode and verify the concept motion study after Blender finishes rendering."""
from pathlib import Path
import subprocess, json
out=Path(__file__).resolve().parents[1]
frames=out/'video/frames'
assert all((frames/f'frame_{i:04d}.png').exists() for i in range(1,385))
video=out/'video/SoleSense_C01_Flexure_Cutaway.mp4'
subprocess.run(['/opt/homebrew/bin/ffmpeg','-y','-hide_banner','-loglevel','warning','-framerate','24','-i',str(frames/'frame_%04d.png'),'-c:v','libx264','-preset','medium','-crf','18','-pix_fmt','yuv420p','-movflags','+faststart',str(video)],check=True)
probe=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-show_streams','-show_format','-of','json',str(video)]))
stream=probe['streams'][0]
assert stream['width']==1440 and stream['height']==900
assert stream['pix_fmt']=='yuv420p' and int(stream['nb_frames'])==384
assert float(probe['format']['duration'])==16
subprocess.run(['/opt/homebrew/bin/ffmpeg','-hide_banner','-v','error','-i',str(video),'-f','null','-'],check=True)
(out/'video/validation.json').write_text(json.dumps(probe,indent=2))
print(video)
