"""Package only current deliverables with per-file checksums."""
from pathlib import Path
import csv,json,re,shutil,tempfile,zipfile,hashlib
O=Path(__file__).resolve().parents[1]
manifest=json.loads((O/'source/assembly_manifest.json').read_text())
expected={d['name'] for d in manifest}
cache=Path(tempfile.mkdtemp(prefix='solesense-r08-backups-'))
for p in (O/'cad').iterdir():
 if p.suffix=='.blend1' or '.FCStd.' in p.name or p.suffix=='.FCStd1':shutil.move(str(p),str(cache/p.name))
for p in (O/'reference').glob('*.stl'):
 if p.stem not in expected:shutil.move(str(p),str(cache/p.name))
exports=json.loads((O/'validation/export_validation.json').read_text())
with (O/'docs/PRINT_INVENTORY.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['file','quantity','group','print_orientation','notes'])
 for d in manifest:
  if d['kind']=='print':w.writerow([d['name']+'.stl',d['quantity'],d['group'],d['print_orientation'],d['description']])
# Verify local Markdown links before shipping the package.
for p in O.rglob('*.md'):
 for target in re.findall(r'\]\(([^)]+)\)',p.read_text()):
  if '://' in target or target.startswith('#'):continue
  assert (p.parent/target.split('#')[0]).exists(),(p,target)
assert len(exports)==len(list((O/'stl').glob('*.stl')))
assembly=json.loads((O/'validation/assembly_checks.json').read_text())
assert not assembly['static_collisions'] and all(not r['overlaps'] for r in assembly['travel'])
assert all(r['max_overlap_mm3']<.01 for r in assembly['flexure_clearance'])
assert all(r['max_overlap_mm3']<.01 for r in assembly['sensor_adjustment'])
assert all(r['overlap_mm3']<.01 for r in assembly['cartridge_swap'])
assert [r['compression_mm'] for r in assembly['stops']]==[2,2.1,-.6,-.7]
assert all(assembly['stops'][i]['overlap_mm3']<.01 for i in [0,2])
assert all(assembly['stops'][i]['overlap_mm3']>.01 for i in [1,3])
assert all(r.get('overlap_head_mm3',r.get('overlap_collar_mm3',0))<.01 for r in assembly['head_exchange'])
assert all(r['overlap_mm3']<.01 for r in json.loads((O/'validation/service_fixture.json').read_text()))
comparison=json.loads((O/'validation/revision_comparison.json').read_text())
assert abs(comparison['dimensions']['housing_width_mm']-56)<.001
assert all(r['symmetric_difference_mm3']<.001 for r in comparison['unchanged_parts'])
assert all(r['mesh_closed'] and not r['non_manifold'] and not r['self_intersections'] and r['components']==1 and r['step_valid'] and r['step_solids']==1 and r['volume_relative_error']<.01 for r in exports)
files=[p for p in sorted(O.rglob('*')) if p.is_file() and '__pycache__' not in p.parts and p.suffix not in ['.pyc','.zip','.tmp'] and not p.name.startswith('.')]
records=[{'path':str(p.relative_to(O)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in files]
release={'revision':'R08','date':'2026-10-20','status':'first-build bench prototype','printable_stls':len(exports),'print_plates':len(list((O/'print_plates').glob('*.3mf'))),'files':records}
archive=O.parent/'SoleSense_R08_Print_and_Build.zip';prefix='SoleSense_R08/'
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED,compresslevel=6) as z:
 for p in files:z.write(p,prefix+str(p.relative_to(O)))
 z.writestr(prefix+'PACKAGE_CONTENTS.json',json.dumps(release,indent=2))
with zipfile.ZipFile(archive) as z:
 assert z.testzip() is None
 for row in records:assert hashlib.sha256(z.read(prefix+row['path'])).hexdigest()==row['sha256']
print(json.dumps({'archive':str(archive),'bytes':archive.stat().st_size,'files':len(files),'stls':len(exports),'plates':release['print_plates'],'crc_sha256':'passed','backup_cache':str(cache)},indent=2))
