from content import ROOT,GUIDE,CHAPTERS
import subprocess,re,json,math,array,wave
TMP=GUIDE/'assets/audio';TMP.mkdir(parents=True,exist_ok=True)
FF='/opt/homebrew/bin/ffmpeg';SR=48000
timeline=[];srt=[];cursor=0;full=array.array('h')
def stamp(t):
 ms=round(t*1000);return f'{ms//3600000:02}:{ms//60000%60:02}:{ms//1000%60:02},{ms%1000:03}'
for i,c in enumerate(CHAPTERS):
 spoken=array.array('h',[0])*int(.7*SR);sentences=re.split(r'(?<=[.!?]) +',c['voice'])
 for j,line in enumerate(sentences):
  aiff=TMP/f'{i:02}_{j:02}.aiff';raw=TMP/f'{i:02}_{j:02}.pcm'
  if not aiff.exists():subprocess.run(['/usr/bin/say','-v','Samantha (English (US))','-r','163','-o',str(aiff),line],check=True)
  if not raw.exists():subprocess.run([FF,'-v','error','-i',str(aiff),'-ar',str(SR),'-ac','1','-f','s16le',str(raw)],check=True)
  audio=array.array('h');audio.frombytes(raw.read_bytes());peak=max(abs(v) for v in audio) or 1;gain=min(2.5,.72*32767/peak);audio=array.array('h',(int(v*gain) for v in audio))
  start=cursor+len(spoken)/SR;end=start+len(audio)/SR;srt.append(f'{len(srt)+1}\n{stamp(start)} --> {stamp(end)}\n{line}\n')
  spoken.extend(audio);spoken.extend(array.array('h',[0])*int(.22*SR))
 duration=max(c['duration'],math.ceil(len(spoken)/SR+2));spoken.extend(array.array('h',[0])*(duration*SR-len(spoken)))
 full.extend(spoken);timeline.append(dict(c,start=cursor,end=cursor+duration,duration=duration,spoken_seconds=round((end-cursor),2)))
 cursor+=duration
 print('AUDIO',c['id'],duration,flush=True)
with wave.open(str(GUIDE/'assets/narration.wav'),'wb') as w:w.setnchannels(1);w.setsampwidth(2);w.setframerate(SR);w.writeframes(full.tobytes())
(GUIDE/'assets/timeline.json').write_text(json.dumps(timeline,indent=2))
(ROOT/'output/video/SoleSense_R08_Assembly_Guide.srt').write_text('\n'.join(srt))
(GUIDE/'source/chapters.ffmetadata').write_text(';FFMETADATA1\ntitle=SoleSense R08 - Head assembly guide\n'+''.join(f"[CHAPTER]\nTIMEBASE=1/1000\nSTART={c['start']*1000}\nEND={c['end']*1000}\ntitle={c['title']}\n" for c in timeline))
(GUIDE/'TRANSCRIPT.md').write_text('# SoleSense R08 head assembly\n\nNarration: synthetic macOS Samantha voice. No music.\n\n'+''.join(f"## {c['start']//60:02}:{c['start']%60:02} - {c['title']}\n\n{c['voice']}\n\n" for c in timeline))
print('AUDIO_COMPLETE',cursor,flush=True)
