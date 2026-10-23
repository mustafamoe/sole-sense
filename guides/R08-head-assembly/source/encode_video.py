from content import ROOT,GUIDE,CHAPTERS
from layout import frame,paste_fit,BG,TEAL,INK,font
from PIL import Image
import json,subprocess
A=GUIDE/'assets';OUT=ROOT/'output/video/SoleSense_R08_Assembly_Guide.mp4';timeline=json.loads((A/'timeline.json').read_text());timeline=[dict(c,start=t['start'],end=t['end'],duration=t['duration']) for c,t in zip(CHAPTERS,timeline)];fps=24;total=timeline[-1]['end'];FF='/opt/homebrew/bin/ffmpeg'
for c in timeline:
 if c['view'] not in ['parts','hardware','hero']:
  assert len(list((A/'motion24'/c['view']).glob('*.png')))==97,c['view']
cmd=[FF,'-y','-hide_banner','-loglevel','warning','-f','rawvideo','-pixel_format','rgb24','-video_size','1920x1080','-framerate','24','-i','pipe:0','-i',str(A/'narration.wav'),'-i',str(GUIDE/'source/chapters.ffmetadata'),'-i',str(ROOT/'output/video/SoleSense_R08_Assembly_Guide.srt'),'-map','0:v:0','-map','1:a:0','-map','3:s:0','-map_metadata','2','-map_chapters','2','-c:v','libx264','-preset','medium','-crf','18','-threads','6','-pix_fmt','yuv420p','-af','loudnorm=I=-16:TP=-1.5:LRA=11','-c:a','aac','-b:a','160k','-c:s','mov_text','-metadata:s:s:0','language=eng','-metadata:s:s:0','title=English narration','-disposition:s:0','0','-t',str(total),'-movflags','+faststart',str(OUT)]
p=subprocess.Popen(cmd,stdin=subprocess.PIPE)
for c in timeline:
 n=c['duration']*fps;static=c['view'] in ['parts','hardware','hero']
 if static:
  data=frame(c).tobytes()
  for _ in range(n):p.stdin.write(data)
 else:
  # A labelled exploded view, a single smooth insertion sequence, then a labelled result.
  hold=4*fps;motion=97;end=n-hold-motion
  assert end>0
  start=frame(c,phase='start').tobytes()
  for _ in range(hold):p.stdin.write(start)
  blank=Image.new('RGBA',(1400,1000),(0,0,0,0));base=frame(c,raw=blank)
  for f in range(motion):
   im=base.copy();raw=Image.open(A/'motion24'/c['view']/f'{f:04}.png');picture=Image.new('RGB',(1400,1000),BG);picture.paste(raw,(0,0),raw);paste_fit(im,picture,(36,206,1168,760));p.stdin.write(im.tobytes())
  final=frame(c,phase='end').tobytes()
  if c['view']=='sensor':
   from PIL import ImageDraw
   close=base.copy();pic=Image.new('RGB',(1400,1000),BG);raw=Image.open(A/'sensor_close_end.png');pic.paste(raw,(0,0),raw);dd=ImageDraw.Draw(pic);dd.text((45,35),'ORIENTATION DETAIL / HOUSING OMITTED',font=font(27,True),fill=TEAL);dd.text((45,936),'Flat Hall face faces a flat pole face of the magnet.',font=font(28,True),fill=INK);paste_fit(close,pic,(36,206,1168,760));cb=close.tobytes()
   for _ in range(7*fps):p.stdin.write(cb)
   end-=7*fps
  for _ in range(end):p.stdin.write(final)
 print('ENCODED_CHAPTER',c['id'],c['start'],c['end'],flush=True)
p.stdin.close();assert p.wait()==0
info=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-show_streams','-show_format','-show_chapters','-of','json',str(OUT)]));video=next(s for s in info['streams'] if s['codec_type']=='video')
assert (video['width'],video['height'])==(1920,1080);assert int(video['nb_frames'])==total*fps;assert abs(float(info['format']['duration'])-total)<.1;assert len(info['chapters'])==len(timeline)
assert any(s['codec_type']=='audio' for s in info['streams']);assert any(s['codec_type']=='subtitle' for s in info['streams'])
subprocess.run([FF,'-v','error','-i',str(OUT),'-map','0:v:0','-map','0:a:0','-f','null','-'],check=True)
(GUIDE/'validation_video.json').write_text(json.dumps({'file':str(OUT.relative_to(ROOT)),'resolution':[1920,1080],'fps':fps,'seconds':total,'frame_count':total*fps,'chapters':len(timeline),'narration':'macOS Samantha, synthetic, 163 words/minute; no music','subtitles':'English mov_text + separate SRT, aligned by narrated sentence','decoded_without_errors':True,'bytes':OUT.stat().st_size},indent=2))
print('VIDEO_VALIDATED',OUT,flush=True)
