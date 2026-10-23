"""Shared editorial layout for the video frames and PDF illustration plates."""
from content import ROOT,GUIDE,CHAPTERS,PARTS,HARDWARE
from PIL import Image,ImageDraw,ImageFont
import json,math
A=GUIDE/'assets';P=GUIDE/'previews';FONTS='/System/Library/Fonts/Supplemental/'
BG='#f5f3ed';INK='#172d32';MUTED='#5b6b6e';LINE='#ccd3ce';TEAL='#007e70';ORANGE='#b9562c';WHITE='#ffffff'
def font(size,bold=False):return ImageFont.truetype(FONTS+('Arial Bold.ttf' if bold else 'Arial.ttf'),round(size))
def wrap(text,width,f):
 words=text.split();lines=[];line=''
 for word in words:
  candidate=(line+' '+word).strip()
  if f.getlength(candidate)>width and line:lines.append(line);line=word
  else:line=candidate
 if line:lines.append(line)
 return lines
def textblock(d,text,x,y,width,size=30,color=INK,bold=False,leading=1.32):
 f=font(size,bold);lines=wrap(text,width,f)
 for line in lines:d.text((x,y),line,font=f,fill=color);y+=size*leading
 return y

def paste_fit(dst,src,box):
 src=src.copy();src.thumbnail((int(box[2]),int(box[3])),Image.Resampling.LANCZOS);xy=(round(box[0]+(box[2]-src.width)/2),round(box[1]+(box[3]-src.height)/2));dst.paste(src,xy,src if src.mode=='RGBA' else None);return xy,src.size

def arrow(d,a,b,width=5,color=TEAL):
 d.line([tuple(a),tuple(b)],fill=color,width=width);ang=math.atan2(b[1]-a[1],b[0]-a[0]);n=19
 d.polygon([tuple(b),(b[0]-n*math.cos(ang-.5),b[1]-n*math.sin(ang-.5)),(b[0]-n*math.cos(ang+.5),b[1]-n*math.sin(ang+.5))],fill=color)

def annotated(view,phase='detail',labels=True):
 im=Image.new('RGB',(1400,1000),BG);raw=Image.open(A/f'{view}_{phase}.png');im.paste(raw,(0,0),raw)
 d=ImageDraw.Draw(im);data=json.loads((A/f'{view}_{phase}.json').read_text());entries=[(k,v) for k,v in data.items() if not k.startswith('__')]
 positions=[(40,38),(800,38),(40,925)]
 if view=='moving':positions=[(40,925),(40,38),(850,925)]
 if view=='fixed':positions=[(40,38),(790,38),(850,925)]
 if labels:
  for (name,target),(x,y) in zip(entries,positions):
   f=font(26,True);tw=f.getlength(name);w=tw+26;h=47;x=min(x,1360-w)
   sx=max(x+8,min(target[0],x+w-8));sy=y+h if target[1]>y+h else y
   d.line([(sx,sy),tuple(target)],fill=TEAL,width=2);d.ellipse((target[0]-5,target[1]-5,target[0]+5,target[1]+5),fill=TEAL)
   d.rectangle((x,y,x+w,y+h),fill=BG);d.text((x+11,y+8),name,font=f,fill=INK)
  for aa,bb in data.get('__arrows__',[]):arrow(d,aa,bb)
  if view=='sensor':
   d.text((800,925),'Bridge omitted for visibility.',font=font(24),fill=MUTED)
   d.text((800,958),'Wire route illustrative.',font=font(24),fill=MUTED)
 return im

def parts_sheet():
 im=Image.new('RGB',(1800,970),BG);d=ImageDraw.Draw(im)
 for i,(pid,name) in enumerate(PARTS):
  col=i%7;row=i//7;x=col*253+12;y=row*475+10
  d.line((x,y+438,x+228,y+438),fill=LINE,width=2)
  d.text((x+8,y+6),pid,font=font(35,True),fill=TEAL)
  paste_fit(im,Image.open(A/f'part_{pid}.png'),(x+6,y+50,226,270))
  textblock(d,name,x+8,y+335,225,24,bold=True)
  if pid in ['53','55']:d.text((x+8,y+402),'OUTSIDE THE HEAD',font=font(16,True),fill=ORANGE)
 d.text((24,950),'Each part is scaled separately for identification. Colours are illustrative.',font=font(18),fill=MUTED)
 return im

def hardware_sheet():
 im=Image.new('RGB',(1160,730),BG);d=ImageDraw.Draw(im)
 d.text((22,12),'FASTENER',font=font(23,True),fill=TEAL);d.text((545,12),'QTY',font=font(23,True),fill=TEAL);d.text((650,12),'LOCATION',font=font(23,True),fill=TEAL)
 for i,(name,qty,use) in enumerate(HARDWARE):
  y=69+i*68;d.line((20,y-12,1140,y-12),fill=LINE,width=1)
  d.text((22,y),name,font=font(26,True),fill=INK);d.text((558,y),qty,font=font(28,True),fill=INK);textblock(d,use,650,y,470,24)
 d.text((24,696),'M3 x 8 button heads: diameter <= 6.4 mm; height <= 2 mm.',font=font(22),fill=ORANGE)
 return im

def frame(c,raw=None,phase='end',show_labels=True):
 im=Image.new('RGB',(1920,1080),BG);d=ImageDraw.Draw(im)
 d.text((62,34),'SOLESENSE  /  R08',font=font(25,True),fill=TEAL)
 d.text((1450,36),c['kicker'],font=font(20,True),fill=MUTED)
 title_size=58
 while font(title_size,True).getlength(c['title'])>1796:title_size-=1
 d.text((60,94),c['title'],font=font(title_size,True),fill=INK)
 d.line((62,177,1858,177),fill=LINE,width=2)
 if c['view']=='parts':
  paste_fit(im,parts_sheet(),(60,200,1800,730))
 elif c['view']=='hardware':
  paste_fit(im,hardware_sheet(),(45,225,1150,720))
 else:
  if raw is None:picture=annotated(c['view'],phase,show_labels)
  else:
   picture=Image.new('RGB',(1400,1000),BG);picture.paste(raw,(0,0),raw)
  paste_fit(im,picture,(36,206,1168,760))
 if c['view']!='parts':
  d.line((1230,223,1230,926),fill=LINE,width=2)
  y=231
  for i,pt in enumerate(c['points']):
   d.text((1270,y+3),f'{i+1:02}',font=font(23,True),fill=TEAL)
   y=textblock(d,pt,1330,y,510,34,bold=True,leading=1.25)+45
  y=max(y+8,690);d.line((1270,y,1840,y),fill=TEAL,width=4)
  d.text((1270,y+22),'CHECK BEFORE CONTINUING',font=font(21,True),fill=TEAL)
  textblock(d,c['check'],1270,y+60,566,28,leading=1.3)
 d.rectangle((0,981,1920,1080),fill=INK)
 d.text((62,999),c['hardware'],font=font(24,True),fill='#ffffff')
 d.text((62,1045),'CAD-based assembly illustration  /  Pause to work  /  PDF: one step per page',font=font(18),fill='#c0d0cc')
 d.text((1710,1041),f"PDF  {CHAPTERS.index(next(x for x in CHAPTERS if x['id']==c['id']))+1:02}",font=font(20,True),fill='#c0d0cc')
 return im
if __name__=='__main__':
 for c in CHAPTERS:
  phase='start' if c['view'] in ['magnet','cover','moving','bridge','fixed'] else 'end'
  frame(c,phase=phase).save(P/f"layout_{c['id']}.jpg",quality=95)
 parts_sheet().save(A/'parts_sheet.png');hardware_sheet().save(A/'hardware_sheet.png')
