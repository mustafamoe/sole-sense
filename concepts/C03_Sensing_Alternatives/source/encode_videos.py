"""Encode four videos, concatenate a comparison reel, and fully decode all outputs."""
from pathlib import Path
import subprocess,json
OUT=Path(__file__).resolve().parents[1];FF='/opt/homebrew/bin/ffmpeg';FP='/opt/homebrew/bin/ffprobe'
videos=[];reports=[]
def validate(video,frames,duration):
 info=json.loads(subprocess.check_output([FP,'-v','error','-show_streams','-show_format','-of','json',str(video)]))
 stream=info['streams'][0]
 assert stream['width']==1440 and stream['height']==900
 assert stream['pix_fmt']=='yuv420p' and int(stream['nb_frames'])==frames
 assert abs(float(info['format']['duration'])-duration)<.001
 assert any(st['codec_type']=='audio' and st['codec_name']=='aac' for st in info['streams'])
 subprocess.run([FF,'-hide_banner','-v','error','-i',str(video),'-f','null','-'],check=True)
 reports.append({'file':video.name,'width':stream['width'],'height':stream['height'],'frames':frames,'duration_seconds':duration,'pixel_format':stream['pix_fmt'],'narration':'AAC mono','full_decode_passed':True})
for blend in sorted((OUT/'cad').glob('*.blend')):
 frames=OUT/'video/frames'/blend.stem
 assert all((frames/f'frame_{i:04d}.png').exists() for i in range(1,385))
 video=OUT/'video'/f'{blend.stem}.mp4'
 if not video.exists():
  subprocess.run([FF,'-y','-hide_banner','-loglevel','warning','-framerate','24','-i',str(frames/'frame_%04d.png'),'-i',str(OUT/'audio'/f'{blend.stem}.wav'),'-map','0:v:0','-map','1:a:0','-c:v','libx264','-preset','medium','-crf','18','-pix_fmt','yuv420p','-c:a','aac','-b:a','128k','-ar','48000','-t','16','-movflags','+faststart',str(video)],check=True)
 validate(video,384,16);videos.append(video);print('ENCODED',video.name,flush=True)
listing=OUT/'source/concat.txt';listing.write_text('\n'.join("file '"+str(p.resolve()).replace("'","'\\''")+"'" for p in videos)+'\n')
combined=OUT/'video/SoleSense_Four_Sensing_Designs.mp4'
audio_listing=OUT/'source/concat_audio.txt';audio_listing.write_text('\n'.join("file '"+str((OUT/'audio'/f'{v.stem}.wav').resolve())+"'" for v in videos)+'\n')
metadata=OUT/'source/chapters.ffmetadata'
titles=['Inline miniature load cell','Metal flexure with magnetic sensing','Metal flexure with optical sensing','Thin capacitive force sensor']
metadata.write_text(';FFMETADATA1\ntitle=SoleSense - Four ways to sense force\n'+''.join(f'[CHAPTER]\nTIMEBASE=1/1000\nSTART={i*16000}\nEND={(i+1)*16000}\ntitle={title}\n' for i,title in enumerate(titles)))
subprocess.run([FF,'-y','-hide_banner','-loglevel','warning','-f','concat','-safe','0','-i',str(listing),'-f','concat','-safe','0','-i',str(audio_listing),'-i',str(metadata),'-map','0:v:0','-map','1:a:0','-map_metadata','2','-map_chapters','2','-vf','setpts=PTS-STARTPTS','-c:v','libx264','-preset','medium','-crf','18','-pix_fmt','yuv420p','-c:a','aac','-b:a','128k','-ar','48000','-t','64','-movflags','+faststart',str(combined)],check=True)
validate(combined,1536,64)
(OUT/'video/validation.json').write_text(json.dumps(reports,indent=2));print('ALL_VIDEOS_VERIFIED',flush=True)
