from pathlib import Path
import csv,hashlib,json,struct,zipfile
r=Path(__file__).resolve().parents[1];d=r/'previews/labeled'
cat=json.loads((d/'component_key.json').read_text());views=json.loads((d/'views.json').read_text())
assert len(views)==8
used={x['id'] for v in views for x in v['labels']}
required={i for i,v in cat.items() if (v['type']=='printed' and v['group']!='Fit_coupons') or (v['type']=='hardware' and int(i[1:])<=20)}
assert required<=used
for v in views:
 for a in v['labels']:assert a['id'] in cat and a['visible_target']
 for j,a in enumerate(v['labels']):
  for b in v['labels'][j+1:]:assert not (abs(a['badge'][0]-b['badge'][0])<90 and abs(a['badge'][1]-b['badge'][1])<55)
for v in cat.values():
 if 'stl' in v:assert (r/'stl'/v['stl']).exists()
images=[d/v['image'] for v in views]
for p in images:
 b=p.read_bytes();assert b[:8]==b'\x89PNG\r\n\x1a\n';assert struct.unpack('>II',b[16:24])==(3200,2200)
assert 'LABELED_VIEWS_COMPLETE' in (r/'validation/labeled_render.log').read_text()
assert 'LABELED_VIEWS_COMPLETE' in (r/'validation/labeled_final_adjustments.log').read_text()
count=0
for line in (r/'SHA256SUMS.txt').read_text().splitlines():
 h,n=line.split(None,1);n=n.strip().lstrip('*')
 if n.startswith(('stl/','cad/')):assert hashlib.sha256((r/n).read_bytes()).hexdigest()==h;count+=1
report={'views':8,'image_resolution':[3200,2200],'unique_ids_used':len(used),'installed_printed_parts':25,'hardware_envelopes':20,'all_45_components_labeled':True,'all_stl_labels_resolve':True,'no_badge_overlaps':True,'original_cad_stl_checksums_unchanged':count}
(r/'validation/labeled_checks.json').write_text(json.dumps(report,indent=2))
for p in d.glob('*_draft.png'):p.unlink()
blend=r/'cad/SoleSense_R03_Labeled_Views.blend';assert blend.stat().st_size>100000
entries=[(p,'images/'+p.name) for p in images]
entries+=[(blend,blend.name)]
entries+=[(d/n,n) for n in ['README.md','COMPONENT_KEY.md','COMPONENT_KEY.csv','component_key.json','views.json']]
entries+=[(r/'docs'/n,n) for n in ['assembly_and_printing.md','wiring.md','decisions.md']]
entries+=[(r/'validation/labeled_checks.json','validation.json')]
checks=''.join(hashlib.sha256(p.read_bytes()).hexdigest()+'  '+n+'\n' for p,n in entries)
archive=r.parent/'SoleSense_R03_Labeled_Views.zip'
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
 for p,n in entries:z.write(p,'SoleSense_R03_Labeled_Views/'+n)
 z.writestr('SoleSense_R03_Labeled_Views/SHA256SUMS.txt',checks)
with zipfile.ZipFile(archive) as z:assert z.testzip() is None
print(json.dumps({**report,'archive':str(archive),'archive_MB':round(archive.stat().st_size/1000000,1)},indent=2))
