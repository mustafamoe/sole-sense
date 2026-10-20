"""Make neutral, mm-based 3MF geometry plates; no machine preset or G-code."""
import sys,json,zipfile,xml.etree.ElementTree as E
from pathlib import Path
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD, Mesh
O=Path(__file__).resolve().parents[1];(O/'print_plates').mkdir(exist_ok=True)
manifest=json.loads((O/'source/assembly_manifest.json').read_text())
items=[]
for d in manifest:
 if d['kind']!='print':continue
 m=Mesh.Mesh(str(O/'stl'/f'{d["name"]}.stl'));b=m.BoundBox
 items.append(dict(name=d['name'],group=d['group'],mesh=m,w=b.XLength,h=b.YLength,height=b.ZLength))
plates=[]
main_head={'41_R04_Joint_Adaptor','42_Magnetic_Chassis','43_Removable_Lid','44_Moving_Carriage','47_Adjustable_Hall_Mount','49_Bench_Calibration_Cartridge'}
for family,pool in [('Print_First',[d for d in items if d['group']=='Fit_coupons' or d['name']=='48_Locking_Filament_Cartridge']),('Magnetic_Head',[d for d in items if d['name'] in main_head]),('Magnetic_Head',[d for d in items if d['group'] in ['Magnetic_head','Service_lock','Accessories'] and d['name']!='48_Locking_Filament_Cartridge' and d['name'] not in main_head]),('Retained_Handle',[d for d in items if d['group'] in ['Handle','Interface','Vibration_head']])]:
 pool.sort(key=lambda d:-d['h']);plate=[];x=10;y=10;row=0
 for d in pool:
  if x+d['w']>170:x=10;y+=row+8;row=0
  if y+d['h']>170:
   plates.append((family,plate));plate=[];x=10;y=10;row=0
  assert max(d['w'],d['h'],d['height'])<=160.01
  plate.append((d,x,y));x+=d['w']+8;row=max(row,d['h'])
 if plate:plates.append((family,plate))
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(n):return '{'+ns+'}'+n
report=[]
for pi,(family,parts) in enumerate(plates,1):
 root=E.Element(tag('model'),{'unit':'millimeter','{http://www.w3.org/XML/1998/namespace}lang':'en-US'})
 E.SubElement(root,tag('metadata'),{'name':'Title'}).text=f'SoleSense R07 Plate {pi:02d} — {family}'
 E.SubElement(root,tag('metadata'),{'name':'Description'}).text='Geometry only. Select your actual FDM printer, 0.4 mm nozzle and PLA profile. Supports needed on selected parts; see BUILD_GUIDE.md. Not pre-sliced.'
 resources=E.SubElement(root,tag('resources'));build=E.SubElement(root,tag('build'));records=[]
 for i,(d,x,y) in enumerate(parts,1):
  vertices,faces=d['mesh'].Topology
  ob=E.SubElement(resources,tag('object'),{'id':str(i),'type':'model','name':d['name']});mesh=E.SubElement(ob,tag('mesh'));vs=E.SubElement(mesh,tag('vertices'));fs=E.SubElement(mesh,tag('triangles'))
  for v in vertices:E.SubElement(vs,tag('vertex'),dict(x=f'{v.x:.6f}',y=f'{v.y:.6f}',z=f'{v.z:.6f}'))
  for a,b,c in faces:E.SubElement(fs,tag('triangle'),dict(v1=str(a),v2=str(b),v3=str(c)))
  E.SubElement(build,tag('item'),{'objectid':str(i),'transform':f'1 0 0 0 1 0 0 0 1 {x:.6f} {y:.6f} 0'})
  records.append({'name':d['name'],'xy':[x,y],'size':[d['w'],d['h'],d['height']],'triangles':len(faces)})
 path=O/'print_plates'/f'{pi:02d}_{family}.3mf'
 with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
  z.writestr('[Content_Types].xml','<?xml version="1.0"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
  z.writestr('_rels/.rels','<?xml version="1.0"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
  z.writestr('3D/3dmodel.model',E.tostring(root,encoding='utf-8',xml_declaration=True))
 # Independent archive / XML read and footprint checks.
 with zipfile.ZipFile(path) as z:assert z.testzip() is None; rr=E.fromstring(z.read('3D/3dmodel.model'));assert rr.get('unit')=='millimeter'
 for i,a in enumerate(records):
  assert a['xy'][0]+a['size'][0]<=170.001 and a['xy'][1]+a['size'][1]<=170.001
  for b in records[i+1:]:
   ax,ay=a['xy'];bx,by=b['xy'];aw,ah,_=a['size'];bw,bh,_=b['size']
   assert ax+aw<=bx or bx+bw<=ax or ay+ah<=by or by+bh<=ay
 report.append({'file':path.name,'objects':records,'virtual_bed_mm':[180,180],'geometry_only':True})
(O/'validation/plate_validation.json').write_text(json.dumps(report,indent=2))
print('PLATES_VERIFIED',len(plates),'OBJECTS',sum(len(p[1]) for p in plates))
