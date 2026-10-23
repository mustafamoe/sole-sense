"""Create finer R08 Bambu projects from exact STEP geometry; retain placements.
Run with FreeCAD.app/Contents/Resources/bin/python. No physical qualification.
"""
import sys, json, re, zipfile
from pathlib import Path
import xml.etree.ElementTree as ET
sys.path.append('/Applications/FreeCAD.app/Contents/Resources/lib')
import FreeCAD as App, Part, MeshPart

BASE = Path(__file__).resolve().parents[1]
CAD = BASE.parents[1] / 'revisions/R08'
OUT = BASE / 'fine_finish'
OUT.mkdir(exist_ok=True)
manifest = {x['name']: x for x in json.loads((CAD/'source/assembly_manifest.json').read_text())}
NS = {'c': 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
P = '{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}'
report = {}

def md(el):
    return {m.get('key'): m.get('value') for m in el.findall('metadata')}

def setmd(el, key, value):
    m = el.find(f"metadata[@key='{key}']")
    if m is None: m = ET.SubElement(el, 'metadata', {'key': key})
    m.set('value', value)

for src in sorted(BASE.glob('SoleSense_R08_0*.3mf')):
    with zipfile.ZipFile(src) as z: data = {n:z.read(n) for n in z.namelist()}
    cfg = json.loads(data['Metadata/project_settings.config'])
    changes = {
        'layer_height':'0.12', 'initial_layer_print_height':'0.24',
        'top_shell_layers':'9', 'bottom_shell_layers':'8',
        'top_shell_thickness':'1.08', 'wall_loops':'4',
        'outer_wall_speed':['40'], 'inner_wall_speed':['80'],
        'top_surface_speed':['35'], 'outer_wall_acceleration':['1000'],
        'top_surface_acceleration':['800'],
        'outer_wall_line_width':'0.4', 'top_surface_line_width':'0.4',
        'top_surface_pattern':'monotonic', 'resolution':'0.005',
        'seam_position':'back', 'ironing_type':'no ironing',
        'ironing_speed':'30', 'ironing_flow':'10%', 'ironing_spacing':'0.15',
    }
    cfg.update(changes)
    # Bambu restores matching system presets unless each changed process key is
    # also declared in this import-difference list.
    differences = cfg['different_settings_to_system']
    differences[0] = ';'.join(sorted(set(differences[0].split(';')) | set(changes)))
    data['Metadata/project_settings.config'] = json.dumps(cfg, indent=2).encode()
    settings = ET.fromstring(data['Metadata/model_settings.config'])
    root = ET.fromstring(data['3D/3dmodel.model'])
    refs = {o.get('id'): o.find('c:components/c:component',NS) for o in root.findall('c:resources/c:object',NS)}
    checks=[]
    for obj in settings.findall('object'):
        name = md(obj)['name'].removesuffix('.stl')
        component = refs[obj.get('id')]
        path = component.get(P+'path').lstrip('/')
        part = obj.find('part')
        offsets = md(part)
        shape = Part.read(str(CAD/'cad'/f'{name}.step'))
        assert shape.isValid() and len(shape.Solids)==1, name
        orient = manifest[name]['print_orientation']
        if orient == 'axial': shape.rotate(App.Vector(),App.Vector(0,1,0),90)
        elif orient == 'carriage': shape.rotate(App.Vector(),App.Vector(1,0,0),90)
        b=shape.BoundBox
        shape.translate(App.Vector(-b.XMin,-b.YMin,-b.ZMin))
        mesh = MeshPart.meshFromShape(Shape=shape,LinearDeflection=.01,AngularDeflection=.04,Relative=False)
        assert mesh.isSolid(), name
        pts,tris=mesh.Topology
        shift=[float(offsets['source_offset_'+a]) for a in 'xyz']
        vertices=[tuple(float(p[i])-shift[i] for i in range(3)) for p in pts]
        oldroot=ET.fromstring(data[path])
        oldverts=[[float(v.get(a)) for a in 'xyz'] for v in oldroot.findall('.//c:vertex',NS)]
        bbox=lambda vv: [(min(p[i] for p in vv), max(p[i] for p in vv)) for i in range(3)]
        oldbox,newbox=bbox(oldverts),bbox(vertices)
        error=max(abs(oldbox[i][j]-newbox[i][j]) for i in range(3) for j in range(2))
        assert error<.05,(name,error)
        volume_error=abs(mesh.Volume-shape.Volume)/shape.Volume
        assert volume_error<.002,(name,volume_error)
        text='<mesh><vertices>'+''.join('<vertex x="%.8f" y="%.8f" z="%.8f"/>'%v for v in vertices)+'</vertices><triangles>'
        text+=''.join('<triangle v1="%d" v2="%d" v3="%d"/>'%tuple(t) for t in tris)+'</triangles></mesh>'
        data[path]=re.sub(r'<mesh>.*?</mesh>',text,data[path].decode(),flags=re.S).encode()
        for m in obj.findall('metadata'):
            if 'face_count' in m.attrib:m.set('face_count',str(len(tris)))
        stat=part.find('mesh_stat')
        if stat is not None:stat.set('face_count',str(len(tris)))
        # Cosmetic flat top surfaces only. The flexure and fit coupons are not ironed.
        if name[:2] in {'43','48','49','55','56'}:setmd(obj,'ironing_type','top')
        if name.startswith('57_'):
            setmd(obj,'ironing_type','no ironing')
            setmd(obj,'seam_position','back')
        checks.append({'name':name,'solid':True,'faces':len(tris),'bbox_change_mm':error,'mesh_volume_relative_error':volume_error})
    data['Metadata/model_settings.config']=ET.tostring(settings,encoding='utf-8',xml_declaration=True)
    dest=OUT/(src.stem+'_Fine.3mf')
    with zipfile.ZipFile(dest,'w',zipfile.ZIP_DEFLATED) as z:
        for n,b in data.items():
            if not n.endswith('.gcode'):z.writestr(n,b)
    report[dest.name]=checks
    print(dest.name, len(checks),'valid solid meshes',flush=True)
(OUT/'mesh_validation.json').write_text(json.dumps(report,indent=2)+'\n')
