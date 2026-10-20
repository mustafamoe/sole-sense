"""Create local synthetic narration, then encode and validate the R07 walkthrough."""
from pathlib import Path
import array,json,subprocess,wave,argparse
OUT=Path(__file__).resolve().parents[1];FF='/opt/homebrew/bin/ffmpeg';FP='/opt/homebrew/bin/ffprobe'
p=argparse.ArgumentParser();p.add_argument('--audio-only',action='store_true');p.add_argument('--frames-dir',default='/tmp/solesense-r07-animation-frames');a=p.parse_args()
clips=[
(0,4,'This is the final R seven magnetic pressure head.'),
(4,10,'The exploded view separates the enclosure, moving carriage, metal springs, magnet, and fixed Hall sensor.'),
(10,17,'Join the adaptor and chassis. Secure the magnet and retainer to the carriage, then lower the carriage into place.'),
(17,24,'The temporary bridge and service pin hold the carriage while both metal leaves are clamped. Then install the sensor.'),
(24,35,'Remove the bridge and fit the cover. Insert the cartridge, turn it thirty degrees, and tighten its small lock. Remove the entire red service pin before measuring.'),
(35,44,'Pressing the filament moves the blue carriage and bends both metal leaves. The magnet moves with the carriage. Releasing lets the springs return.'),
(44,54,'Here, the surrounding parts are hidden. Watch the coral magnet approach the stationary purple Hall sensor. The changing magnetic signal must be calibrated against known forces.'),
(54,60,'Print and calibrate next. Accuracy at one, ten, and seventy five grams force remains unverified.')]
(OUT/'source/narration.json').write_text(json.dumps({'voice':'macOS Samantha (English US), synthetic narration','chapters':[{'start_seconds':s,'end_seconds':e,'text':t} for s,e,t in clips]},indent=2))
audio=OUT/'SoleSense_R07_Narration.wav';scratch=Path('/tmp/solesense-r07-narration');scratch.mkdir(exist_ok=True)
if not audio.exists():
 samples=array.array('h',[0])*(48000*60);timings=[]
 for i,(start,end,line) in enumerate(clips):
  f=scratch/f'{i}.aiff'
  subprocess.run(['/usr/bin/say','-v','Samantha (English (US))','-r','170','-o',str(f),line],check=True)
  dur=float(subprocess.check_output([FP,'-v','error','-show_entries','format=duration','-of','default=noprint_wrappers=1:nokey=1',str(f)]))
  speed=max(1,dur/(end-start-.45))
  raw=subprocess.check_output([FF,'-v','error','-i',str(f),'-af',f'atempo={speed:.7f}','-ar','48000','-ac','1','-f','s16le','-'])
  spoken=array.array('h');spoken.frombytes(raw);assert len(spoken)<(end-start-.2)*48000
  gain=.80*32767/max(abs(v) for v in spoken);offset=int((start+.2)*48000)
  for j,v in enumerate(spoken):samples[offset+j]=round(v*gain)
  timings.append({'start':start+.2,'duration':len(spoken)/48000,'speed':speed})
 with wave.open(str(audio),'wb') as w:w.setnchannels(1);w.setsampwidth(2);w.setframerate(48000);w.writeframes(samples.tobytes())
 (OUT/'narration_timing.json').write_text(json.dumps(timings,indent=2))
print('NARRATION_READY',flush=True)
if a.audio_only:raise SystemExit
frames=Path(a.frames_dir);assert all((frames/f'frame_{i:04d}.png').exists() for i in range(1,721))
chapters=json.loads((OUT/'source/storyboard.json').read_text());metadata=OUT/'source/chapters.ffmetadata'
metadata.write_text(';FFMETADATA1\ntitle=SoleSense R07 - Assembly and magnetic sensing\n'+''.join(f"[CHAPTER]\nTIMEBASE=1/1000\nSTART={int(c['start']*1000)}\nEND={int(c['end']*1000)}\ntitle={c['title']}\n" for c in chapters))
video=OUT/'SoleSense_R07_Assembly_and_Motion.mp4'
subprocess.run([FF,'-y','-hide_banner','-loglevel','warning','-framerate','12','-i',str(frames/'frame_%04d.png'),'-i',str(audio),'-i',str(metadata),'-map','0:v:0','-map','1:a:0','-map_metadata','2','-map_chapters','2','-vf','fps=24','-c:v','libx264','-preset','medium','-crf','18','-pix_fmt','yuv420p','-c:a','aac','-b:a','128k','-t','60','-movflags','+faststart',str(video)],check=True)
info=json.loads(subprocess.check_output([FP,'-v','error','-show_streams','-show_format','-show_chapters','-of','json',str(video)]));vs=next(s for s in info['streams'] if s['codec_type']=='video')
assert vs['width']==1280 and vs['height']==800 and int(vs['nb_frames'])==1440
assert abs(float(info['format']['duration'])-60)<.01
assert any(s['codec_type']=='audio' and s['codec_name']=='aac' for s in info['streams'])
assert len(info['chapters'])==8
subprocess.run([FF,'-v','error','-i',str(video),'-f','null','-'],check=True)
(OUT/'validation.json').write_text(json.dumps({'file':video.name,'resolution':[1280,800],'seconds':60,'fps':24,'render_samples_per_second':12,'frames':1440,'audio':'AAC, synthetic narration','chapters':8,'full_decode_passed':True,'file_bytes':video.stat().st_size},indent=2))
print('R07_VIDEO_VERIFIED',flush=True)
