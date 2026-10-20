"""Bundle the current R03 deliverables into one verified archive."""
from pathlib import Path
from collections import Counter
import hashlib,json,zipfile
root=Path(__file__).resolve().parents[1]
prefix='SoleSense_R03_Complete/'
archive=root.parent/'SoleSense_R03_Complete.zip'
staging=archive.with_suffix('.zip.tmp')
files=[]
for p in sorted(root.rglob('*')):
 rel=p.relative_to(root)
 if not p.is_file():continue
 if p.is_symlink():raise RuntimeError('Unexpected symlink: '+str(rel))
 if any(x.startswith('.') or x=='__pycache__' for x in rel.parts):continue
 if p.suffix in {'.blend1','.pyc','.zip','.tmp'}:continue
 if p.name.endswith('_draft.png'):continue
 files.append((p,rel.as_posix()))
counts=Counter(n.split('/')[0] for p,n in files)
assert len([n for p,n in files if n.startswith('stl/') and n.endswith('.stl')])==31
assert len([n for p,n in files if n.startswith('print_plates/') and n.endswith('.3mf')])==4
assert len([n for p,n in files if n.startswith('previews/') and n.endswith('.png')])==20
assert len([n for p,n in files if n.startswith('cad/') and n.endswith('.blend')])==3
records=[{'path':n,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p,n in files]
manifest=json.dumps({'revision':'R03','project_files':len(files),'folder_file_counts':dict(counts),'files':records},indent=2).encode()
checks=''.join(x['sha256']+'  '+x['path']+'\n' for x in records)
checks+=hashlib.sha256(manifest).hexdigest()+'  PACKAGE_CONTENTS.json\n'
with zipfile.ZipFile(staging,'w',zipfile.ZIP_DEFLATED,compresslevel=6) as z:
 for p,n in files:z.write(p,prefix+n)
 z.writestr(prefix+'PACKAGE_CONTENTS.json',manifest)
 z.writestr(prefix+'PACKAGE_SHA256SUMS.txt',checks)
with zipfile.ZipFile(staging) as z:
 assert z.testzip() is None
 assert len(z.namelist())==len(files)+2
 for row in checks.splitlines():
  h,n=row.split('  ',1)
  assert hashlib.sha256(z.read(prefix+n)).hexdigest()==h,n
staging.replace(archive)
print(json.dumps({'archive':str(archive),'size_MB':round(archive.stat().st_size/1000000,1),'project_files':len(files),'total_archive_entries':len(files)+2,'printable_STLs':31,'print_plates':4,'review_images':20,'blender_files':3,'crc_and_sha256_verified':True},indent=2))
