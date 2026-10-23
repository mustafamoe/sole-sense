from content import ROOT,GUIDE,CHAPTERS,PARTS,HARDWARE
from layout import annotated,parts_sheet,hardware_sheet,BG,INK,MUTED,TEAL,LINE
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor
from reportlab.lib.utils import ImageReader
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import Paragraph
from reportlab.lib.styles import ParagraphStyle
from pathlib import Path
import json,hashlib,html
FONT=Path('/System/Library/Fonts/Supplemental')
pdfmetrics.registerFont(TTFont('Arial',str(FONT/'Arial.ttf')));pdfmetrics.registerFont(TTFont('Arial-Bold',str(FONT/'Arial Bold.ttf')))
OUT=ROOT/'output/pdf/SoleSense_R08_Head_Assembly_Guide.pdf'
W,H=841.89,595.28;c=canvas.Canvas(str(OUT),pagesize=(W,H));c.setTitle('SoleSense R08 - Head assembly guide');c.setAuthor('SoleSense');c.setSubject('CAD-derived guide for the R08 printed-flexure head, 22 October 2026')
styles={}
for name,size,lead,col,bold in [('body',11.1,15,INK,False),('small',9,12,MUTED,False),('lead',13,17,INK,True),('check',11,14,INK,True)]:
 styles[name]=ParagraphStyle(name,fontName='Arial-Bold' if bold else 'Arial',fontSize=size,leading=lead,textColor=HexColor(col))
def txt(text,x,y,size=11,col=INK,bold=False):
 c.setFillColor(HexColor(col));c.setFont('Arial-Bold' if bold else 'Arial',size);c.drawString(x,H-y-size*.82,text)
def para(text,x,y,width,style='body'):
 p=Paragraph(text,styles[style]);ww,hh=p.wrap(width,1000);p.drawOn(c,x,H-y-hh);return y+hh

def imagefit(im,x,y,w,h):
 iw,ih=im.size;scale=min(w/iw,h/ih);dw,dh=iw*scale,ih*scale;c.drawImage(ImageReader(im),x+(w-dw)/2,H-y-(h+dh)/2,dw,dh,mask='auto')
def rule(y,x=30,x2=W-30,col=LINE,width=.7):c.setStrokeColor(HexColor(col));c.setLineWidth(width);c.line(x,H-y,x2,H-y)
def page_header(title,kicker,num,stamp=''):
 c.setFillColor(HexColor(BG));c.rect(0,0,W,H,fill=1,stroke=0)
 txt('SOLESENSE  /  R08',30,22,10,TEAL,True);txt(kicker,480,23,9,MUTED,True)
 size=25
 while pdfmetrics.stringWidth(title,'Arial-Bold',size)>W-60:size-=1
 txt(title,30,55,size,INK,True);rule(95)
 txt('R08 printed-flexure head  |  22 October 2026',30,568,8,MUTED)
 if stamp:txt(stamp,540,568,8,MUTED)
 txt(f'{num:02}',783,566,11,TEAL,True)
 c.bookmarkPage(f'page{num}');c.addOutlineEntry(title,f'page{num}',0)

def finish():c.showPage()
timeline=json.loads((GUIDE/'assets/timeline.json').read_text()) if (GUIDE/'assets/timeline.json').exists() else None
for i,ch in enumerate(CHAPTERS):
 time=''
 if timeline:
  sec=timeline[i]['start'];time=f'VIDEO  {sec//60:02}:{sec%60:02}'
 page_header(ch['title'],ch['kicker'],i+1,time)
 if ch['view']=='parts':
  imagefit(parts_sheet(),24,102,794,355)
  y=466
  for line in ['Clear support residue from pockets and cartridge tracks. Inspect both thin beams before assembly.', 'Fit-test cartridge 48 in coupon 53. Use only one cassette; 57 / 58 / 59 are not force grades.']:
   y=para(line,32,y,775,'body')+5
 elif ch['view']=='hardware':
  imagefit(hardware_sheet(),24,112,495,352)
  y=119
  for b in ch['body']:y=para(html.escape(b),540,y,272)+14
  y=para('<b>Tools:</b> M2/M3 hex drivers, tweezers, calipers, compatible adhesive, soldering tools and heat-shrink.',32,477,775,'body')
 else:
  phase='start' if ch['view'] in ['chassis','magnet','moving','bridge','fixed','cover'] else 'end'
  pic=annotated(ch['view'],phase)
  imagefit(pic,18,110,497,355)
  y=114
  for j,b in enumerate(ch['body']):
   txt(f'{j+1:02}',535,y+1,9,TEAL,True);y=para(html.escape(b),558,y,252)+14
  if y>467:raise RuntimeError(f"Body overflow {ch['id']}: {y}")
  if ch['view'] in ['magnet','bridge','cover']:txt('Hidden nut pockets: see page 15.',35,461,9,MUTED)
  if ch['view']=='sensor':txt('Sensor close-up and bench wiring: see page 16.',35,461,9,MUTED)
  rule(481,col=TEAL,width=1.4)
  txt('CHECK',32,493,9,TEAL,True);para(html.escape(ch['check']),96,489,714,'check')
  txt(ch['hardware'],32,533,9,MUTED,True)
 finish()
# Appendix A: underside details, kept on a single visual reference page.
page_header('Hidden nut pockets', 'REFERENCE  /  USE WITH STEPS 02, 06 AND 09',15)
from PIL import Image
panels=[('post_nuts','CARRIAGE 44','2 M2 post nuts + 2 M2 magnet-retainer nuts.'),('cover_nuts','COVER 43','4 M3 cover nuts + 1 M3 service-screw nut.'),('bridge_nuts','BRIDGE 55','2 M3 mounting nuts + 1 M3 service-screw nut.'),('cassette','CASSETTE 57','Wide rail: carriage. Narrow rail: chassis. Protect both thin beams.')]
for j,(view,title,note) in enumerate(panels):
 x=30+(j%2)*400;y=110+(j//2)*220
 txt(title,x,y,11,TEAL,True);im=Image.open(GUIDE/f'assets/{view}_end.png');imagefit(im,x,y+20,375,157);para(note,x,y+179,375,'small')
finish()
page_header('Sensor orientation and bench wiring','REFERENCE  /  EXTERNAL 3.3 V ELECTRONICS',16)
imagefit(Image.open(GUIDE/'assets/sensor_close_end.png'),22,110,393,256)
para('<b>The flat TO-92 package face points toward the magnet.</b> The figure uses a package envelope; confirm the real sensor and TI pin drawing before soldering.',35,370,365,'body')
para('Nominal package-face gap: 8.2 mm at the centre of the slots. Adjustment is about 7.2-9.2 mm. Changing the gap or magnet orientation requires calibration again.',35,444,365,'small')
y=118
wires=[('Hall pin 1 - VCC','Regulated 3.3 V'),('Hall pin 2 - GND','Common ground'),('Hall pin 3 - OUT','ADS1115 A0'),('100 nF capacitor','Between VCC and GND, near sensor'),('ADS1115 supply / GND','Same 3.3 V rail / common ground'),('ADS1115 SDA / SCL','Controller I2C; pull-ups to 3.3 V')]
for label,dest in wires:
 txt(label,445,y,10,TEAL,True);y=para(dest,445,y+18,358,'body')+14
para('Connect with power off. Insulate the leads, strain-relieve the cable and keep all wires clear of the moving stage. Initial electronics remain external.',445,414,358,'body')
para('Optional filter: Hall OUT through 4.7 kohm to A0; 2.2 uF from A0 to GND. Calibrate with the final filter fitted.',445,479,358,'small')
para('Pin numbers above are for TI LPG / TO-92. <link href="https://www.ti.com/lit/ds/symlink/drv5055.pdf" color="#007e70">TI DRV5055 datasheet, pin drawing (page 3)</link>.',35,528,770,'small')
finish()
page_header('Before the first force measurement','BENCH CHECKLIST  /  TROUBLESHOOTING',17)
checks=['Bridge 55 is out of the head.','The entire M3 x 30 service screw is removed.','Cartridge 49 is seated and its small lock is tightened.','Cassette is flat, with no cracks or permanent bowing.','No wire, adhesive or support residue touches moving parts.','Carriage moves gently and returns freely.','Cover is secure and no wires are trapped.']
y=118
for line in checks:
 c.setStrokeColor(HexColor(TEAL));c.setLineWidth(.8);c.rect(34,H-y-11,10,10,fill=0,stroke=1);y=para(line,56,y,345,'body')+15
para('Store unloaded with the service screw removed. Record the cassette number, filament, print settings and test temperature.',35,450,365,'small')
y=118
trouble=[('It sticks or fails to return','Check support residue, pin removal, wire contact, rail flatness and alignment. Loosen and reseat only while unloaded.'),('A nut spins or will not seat','Clear the pocket and check actual nut size. Do not force the screw or enlarge the whole part by scaling.'),('A cartridge will not turn','Unload, fit the service screw and back the small lock out at least 3 mm. Check the lugs and tracks in coupon 53.'),('The spring cracks or stays bent','Replace the cassette. Repeat return checks and recalibrate. Do not sand its beams to tune stiffness.')]
for title,body in trouble:
 txt(title,443,y,11,TEAL,True);y=para(body,443,y+20,362,'body')+17
finish()
page_header('Calibration handoff and source notes','REFERENCE  /  SCOPE OF THIS GUIDE',18)
y=117
for title,body in [('1. Establish a baseline','Use bench cartridge 49 and a checked reference balance. Zero in the test orientation. Confirm a smooth, unsaturated sensor response.'),('2. Measure before assigning a force','Record loading and unloading at 0, 1, 2, 5, 10, 20, 50 and 75 gf only while below the stops and within sensor range. Skip unreachable points; do not force them. Repeat at least five cycles.'),('3. Check drift and return','Follow the R08 calibration guide for hold, recovery and repeated-cycle tests. Recalibrate after changing or retightening the cassette, changing magnetic hardware, or adjusting the sensor.')]:
 txt(title,33,y,12,TEAL,True);y=para(body,33,y+23,373,'body')+20
para('This is an experimental bench prototype. Assembly does not establish force accuracy, spring fatigue life or patient-contact suitability. Use inanimate fixtures and reference loads for initial tests.',33,466,373,'small')
y=118
sources=[('R08 BUILD_GUIDE.md','Assembly order, screw directions and service sequence.'),('R08 SHOPPING_LIST.md','Fastener counts, real magnet and sensor specification.'),('R08 assembly_manifest.json + reference STLs','The actual part geometry and final assembly coordinates.'),('R08 WIRING_AND_CALIBRATION.md','Bench connections, reference loads, return and drift tests.'),('R08 printing notes, 21 October 2026','The 14-part plate and 42/47/49/53 reprint identification.')]
for name,note in sources:
 txt(name,445,y,10,TEAL,True);y=para(note,445,y+16,357,'small')+14
para('Illustrative colours and exploded offsets aid identification. Fasteners are simplified CAD envelopes. Animation is not a tool-access, collision or force simulation. Wire routing is schematic.',445,421,357,'small')
para('<link href="https://www.ti.com/lit/ds/symlink/drv5055.pdf" color="#007e70">Texas Instruments DRV5055 datasheet, Rev. C</link><br/>Pin functions checked 22 October 2026. The companion source folder records file hashes for the local design references.',445,484,357,'small')
finish();c.save()
print('PDF_CREATED',OUT)
# Record source identity without modifying any released revision.
sourcefiles=['revisions/R08/docs/BUILD_GUIDE.md','revisions/R08/docs/SHOPPING_LIST.md','revisions/R08/docs/WIRING_AND_CALIBRATION.md','revisions/R08/source/assembly_manifest.json','revisions/R08/source/build_model.py','printing/R08/orientation_optimized/README.md','printing/R08/reprint_skipped/README.md']
(GUIDE/'source/source_manifest.json').write_text(json.dumps({'revision':'R08','guide_date':'2026-10-22','sources':[{'path':p,'sha256':hashlib.sha256((ROOT/p).read_bytes()).hexdigest()} for p in sourcefiles],'geometry':'revisions/R08/reference/*.stl, assembly orientation','sensor_datasheet':'https://www.ti.com/lit/ds/symlink/drv5055.pdf','limitations':'CAD-derived assembly illustration; physical fit, force calibration and fatigue are not established by this guide.'},indent=2))
