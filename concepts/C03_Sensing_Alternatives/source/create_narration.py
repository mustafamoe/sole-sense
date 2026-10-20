"""Generate short local system-voice narration and align it to the four chapters."""
from pathlib import Path
import subprocess,json,wave,array,math
OUT=Path(__file__).resolve().parents[1];AUDIO=OUT/'audio';AUDIO.mkdir(exist_ok=True)
SCRIPTS={
 '01_Inline_Load_Cell':[
  'An inline load cell sits behind the cartridge.',
  'Pressing the filament slightly bends the metal sensor.',
  'Strain gauges detect the bending. Motion is exaggerated.',
  'Calibration turns the signal into grams of force.'],
 '02_Magnetic_Flexure':[
  'Metal flexures support the replaceable cartridge holder.',
  'Pressing moves a magnet attached to the holder.',
  'A fixed magnetic sensor reads that movement without touching.',
  'Calibration converts the movement into grams of force.'],
 '03_Optical_Flexure':[
  'Metal flexures support the cartridge and a small flag.',
  'Pressing moves the flag across a light beam.',
  'A light detector measures how much light passes.',
  'Calibration converts this change into grams of force.'],
 '04_Capacitive_Sensor':[
  'The cartridge presses a thin sensor against rigid backing.',
  'The sensor compresses slightly, changing its electrical capacitance.',
  'This enlarged diagram shows the sensing layers moving closer.',
  'Calibration converts the signal into grams of force.']}
FF='/opt/homebrew/bin/ffmpeg';FP='/opt/homebrew/bin/ffprobe';timings=[]
for name,lines in SCRIPTS.items():
 samples=array.array('h',[0])*(48000*16)
 for i,line in enumerate(lines):
  clip=AUDIO/f'{name}_{i+1}.aiff'
  subprocess.run(['/usr/bin/say','-v','Samantha (English (US))','-r','185','-o',str(clip),line],check=True)
  duration=float(subprocess.check_output([FP,'-v','error','-show_entries','format=duration','-of','default=noprint_wrappers=1:nokey=1',str(clip)]))
  speed=max(1,duration/3.55);start=[250,4050,8050,12100][i]
  raw=subprocess.check_output([FF,'-hide_banner','-loglevel','error','-i',str(clip),'-af',f'atempo={speed:.6f}','-ar','48000','-ac','1','-f','s16le','-'],timeout=20)
  spoken=array.array('h');spoken.frombytes(raw)
  assert 1000<len(spoken)<int(3.7*48000)
  peak=max(abs(v) for v in spoken);assert peak>100
  gain=.78*32767/peak;offset=int(start*48)
  for j,v in enumerate(spoken):samples[offset+j]=round(v*gain)
  timings.append({'video':name,'chapter':i+1,'text':line,'start_ms':start,'spoken_duration_seconds':round(duration/speed,3)})
 with wave.open(str(AUDIO/f'{name}.wav'),'wb') as wav:
  wav.setnchannels(1);wav.setsampwidth(2);wav.setframerate(48000);wav.writeframes(samples.tobytes())
 for chapter in range(4):
  section=samples[chapter*4*48000:(chapter+1)*4*48000]
  assert math.sqrt(sum(v*v for v in section)/len(section))>100
 length=float(subprocess.check_output([FP,'-v','error','-show_entries','format=duration','-of','default=noprint_wrappers=1:nokey=1',str(AUDIO/f'{name}.wav')]))
 assert abs(length-16)<.001
 assert (AUDIO/f'{name}.wav').stat().st_size<2000000
 print('NARRATED',name,flush=True)
(OUT/'source/narration.json').write_text(json.dumps({'voice':'macOS Samantha (English US), synthetic narration','timing':timings},indent=2))
