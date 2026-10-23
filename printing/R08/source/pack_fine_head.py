"""Combine validated fine meshes and object settings; change XY layout only."""
from pathlib import Path
import json, math, copy, zipfile
import xml.etree.ElementTree as E

BASE=Path(__file__).resolve().parents[1]/'fine_finish'
C='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
P='http://schemas.microsoft.com/3dmanufacturing/production/2015/06'
R='http://schemas.openxmlformats.org/package/2006/relationships'
E.register_namespace('',C); E.register_namespace('p',P)
E.register_namespace('BambuStudio','http://schemas.bambulab.com/package/2021')
ns={'m':C}
layout=json.loads((BASE/'compact_layout.json').read_text())
parts={};template=None
for filename in ['SoleSense_R08_01_Head_Large_A1mini_PLA_Fine.3mf','SoleSense_R08_02_Head_Small_and_Fit_Checks_A1mini_PLA_Fine.3mf']:
    with zipfile.ZipFile(BASE/filename) as z:data={n:z.read(n) for n in z.namelist()}
    if template is None:template=data
    root=E.fromstring(data['3D/3dmodel.model'])
    settings=E.fromstring(data['Metadata/model_settings.config'])
    objects={o.get('id'):o for o in root.findall('m:resources/m:object',ns)}
    configs={o.get('id'):o for o in settings.findall('object')}
    for item in root.findall('m:build/m:item',ns):
        oid=item.get('objectid');obj=objects[oid];conf=configs[oid]
        name=conf.find("metadata[@key='name']").get('value');number=int(name[:2])
        component=obj.find('m:components/m:component',ns)
        mesh=data[component.get('{'+P+'}path').lstrip('/')]
        parts[number]=(copy.deepcopy(obj),copy.deepcopy(conf),copy.deepcopy(item),mesh)

for coupon_only in [False,True]:
    selected=[52] if coupon_only else sorted(int(k) for k in layout['rectangles'])
    label='Hardware_Coupon' if coupon_only else 'Complete_Head_14_Parts'
    data={n:b for n,b in template.items() if not n.startswith('3D/Objects/')}
    root=E.fromstring(data['3D/3dmodel.model'])
    root.find('m:resources',ns).clear();root.find('m:build',ns).clear()
    for m in root.findall('m:metadata',ns):
        if m.get('name') in ['Title','Description']:m.text=f'SoleSense R08 {label}; fine finish, 0.12 mm layers'
    rels=E.Element('Relationships',xmlns=R)
    settings=E.Element('config');plate=E.SubElement(settings,'plate')
    for k,v in [('plater_id','1'),('plater_name',label),('locked','false'),('filament_map_mode','Auto For Flush')]:
        E.SubElement(plate,'metadata',key=k,value=v)
    report=[]
    for number in selected:
        obj,conf,item,mesh=copy.deepcopy(parts[number]);oid=obj.get('id')
        comp=obj.find('m:components/m:component',ns);path=f'3D/Objects/part_{number}.model'
        comp.set('{'+P+'}path','/'+path);data[path]=mesh
        E.SubElement(rels,'Relationship',Target='/'+path,Id=f'rel-{number}',Type='http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel')
        transform=[float(x) for x in item.get('transform').split()]
        if coupon_only:cx,cy,rot=90,90,0
        else:
            x,y,w,h,rot=layout['rectangles'][str(number)];cx,cy=x+w/2,y+h/2
        # Retain the carriage's 180-degree yaw, adding only an in-plane packing rotation.
        original_angle=math.atan2(transform[1],transform[0]);angle=original_angle+rot*math.pi/2
        c,s=math.cos(angle),math.sin(angle)
        values=[c,s,0,-s,c,0,0,0,1,cx,cy,transform[11]]
        item.set('transform',' '.join(f'{v:.10g}' for v in values));item.set('printable','1')
        root.find('m:resources',ns).append(obj);root.find('m:build',ns).append(item)
        settings.insert(len(settings)-1,conf)
        instance=E.SubElement(plate,'model_instance')
        for k,v in [('object_id',oid),('instance_id','0'),('identify_id',str(number))]:
            E.SubElement(instance,'metadata',key=k,value=v)
        report.append({'part':number,'center_mm':[cx,cy],'yaw_degrees':round(math.degrees(angle))})
    data['3D/3dmodel.model']=E.tostring(root,encoding='utf-8',xml_declaration=True)
    data['3D/_rels/3dmodel.model.rels']=E.tostring(rels,encoding='utf-8',xml_declaration=True)
    data['Metadata/model_settings.config']=E.tostring(settings,encoding='utf-8',xml_declaration=True)
    # Old previews/slice records belong to the separate plates. Bambu rebuilds them.
    for n in list(data):
        if n.endswith('.png') or n.endswith('.gcode') or n in ['Metadata/slice_info.config','Metadata/cut_information.xml']:
            del data[n]
    dest=BASE/f'SoleSense_R08_{label}_A1mini_PLA_Fine.3mf'
    with zipfile.ZipFile(dest,'w',zipfile.ZIP_DEFLATED) as z:
        for n,b in data.items():z.writestr(n,b)
    (BASE/f'{label}_layout.json').write_text(json.dumps(report,indent=2)+'\n')
    print(dest.name,len(selected),'parts')
