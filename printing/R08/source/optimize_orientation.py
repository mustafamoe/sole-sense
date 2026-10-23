"""Reorient the existing fine meshes without changing dimensions or part geometry.

Inputs are the validated packed project and a JSON map of part -> rotations,
XY center and optional per-object process overrides. Every part is grounded at
its actual lowest mesh vertex. Candidate files must be sliced before use.
"""
from pathlib import Path
import copy, json, sys, zipfile
import xml.etree.ElementTree as E
import numpy as np

C='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
P='http://schemas.microsoft.com/3dmanufacturing/production/2015/06'
N={'m':C}
E.register_namespace('',C); E.register_namespace('p',P)
BASE=Path(__file__).resolve().parents[1]
SOURCE=BASE/'fine_finish/SoleSense_R08_Complete_Head_14_Parts_A1mini_PLA_Fine.3mf'

def rotation(axis, degrees):
    a=np.deg2rad(degrees); c,s=np.cos(a),np.sin(a)
    if axis=='x': return np.array([[1,0,0],[0,c,-s],[0,s,c]])
    if axis=='y': return np.array([[c,0,s],[0,1,0],[-s,0,c]])
    return np.array([[c,-s,0],[s,c,0],[0,0,1]])

def build(spec, dest):
    with zipfile.ZipFile(SOURCE) as z: data={n:z.read(n) for n in z.namelist()}
    root=E.fromstring(data['3D/3dmodel.model'])
    settings=E.fromstring(data['Metadata/model_settings.config'])
    objects={o.get('id'):o for o in root.findall('m:resources/m:object',N)}
    configs={o.get('id'):o for o in settings.findall('object')}
    report=[]
    keep=[]
    for item in list(root.find('m:build',N)):
        oid=item.get('objectid'); conf=configs[oid]
        name=conf.find("metadata[@key='name']").get('value'); number=name[:2]
        if spec.get('only') and int(number) not in spec['only']:
            root.find('m:build',N).remove(item); settings.remove(conf); continue
        keep.append(oid)
        options=spec.get('parts',{}).get(number,{})
        comp=objects[oid].find('m:components/m:component',N)
        mesh=E.fromstring(data[comp.get('{'+P+'}path').lstrip('/')])
        points=np.array([[float(v.get(a)) for a in 'xyz'] for v in mesh.findall('.//m:vertex',N)])
        ct=np.array([float(x) for x in comp.get('transform','1 0 0 0 1 0 0 0 1 0 0 0').split()])
        points=points@ct[:9].reshape(3,3)+ct[9:]
        old=np.array([float(x) for x in item.get('transform').split()])
        R=old[:9].reshape(3,3).T
        if 'rotations' in options:
            R=np.eye(3)
            for axis,angle in options['rotations']: R=rotation(axis,angle)@R
        transformed=points@R.T
        lo,hi=transformed.min(axis=0),transformed.max(axis=0)
        center=options.get('center', [90,90] if spec.get('only') else old[9:11].tolist())
        translation=np.array([center[0]-(lo[0]+hi[0])/2,center[1]-(lo[1]+hi[1])/2,-lo[2]])
        item.set('transform',' '.join(f'{v:.10g}' for v in np.r_[R.T.ravel(),translation]))
        item.set('printable','1')
        for key,value in options.get('settings',{}).items():
            m=conf.find(f"metadata[@key='{key}']")
            if m is None:m=E.SubElement(conf,'metadata',key=key)
            m.set('value',str(value))
        report.append({'part':int(number),'name':name,'dimensions_mm':(hi-lo).round(5).tolist(),'min_z_mm':float((lo+translation)[2]),'center_mm':center,'rotation_matrix':R.round(9).tolist()})
    for o in list(root.find('m:resources',N)):
        if o.get('id') not in keep:root.find('m:resources',N).remove(o)
    for p in settings.findall('plate'):settings.remove(p)
    a=settings.find('assemble')
    if a is not None:settings.remove(a)
    plate=E.SubElement(settings,'plate')
    for k,v in [('plater_id','1'),('plater_name',spec['label']),('locked','false')]:E.SubElement(plate,'metadata',key=k,value=v)
    for oid in keep:
        inst=E.SubElement(plate,'model_instance')
        for k,v in [('object_id',oid),('instance_id','0'),('identify_id',oid)]:E.SubElement(inst,'metadata',key=k,value=v)
    data['3D/3dmodel.model']=E.tostring(root,encoding='utf-8',xml_declaration=True)
    data['Metadata/model_settings.config']=E.tostring(settings,encoding='utf-8',xml_declaration=True)
    for n in list(data):
        if n.endswith(('.png','.gcode')) or n in ['Metadata/slice_info.config','Metadata/cut_information.xml']:del data[n]
    dest=Path(dest);dest.parent.mkdir(parents=True,exist_ok=True)
    with zipfile.ZipFile(dest,'w',zipfile.ZIP_DEFLATED) as z:
        for n,b in data.items():z.writestr(n,b)
    dest.with_suffix('.layout.json').write_text(json.dumps(report,indent=2)+'\n')
    return report

if __name__=='__main__':
    spec=json.loads(Path(sys.argv[1]).read_text());print(json.dumps(build(spec,sys.argv[2]),indent=2))
