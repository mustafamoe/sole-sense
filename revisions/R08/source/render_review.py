"""Render verified CAD exports in background Blender; all dimensions are mm."""
import bpy,json,math
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view
OUT=Path(__file__).resolve().parents[1];W,H=1800,1200
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='R08 magnetic prototype';s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=48
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.image_settings.file_format='PNG';s.view_settings.view_transform='Standard';s.view_settings.look='None';s.world.color=(.6,.6,.6)
M={};objects={};md=json.loads((OUT/'source/assembly_manifest.json').read_text())
def smooth(o):
 for face in o.data.polygons:face.use_smooth=True
 mod=o.modifiers.new('Display normals at sharp edges','EDGE_SPLIT');mod.split_angle=math.radians(30);mod.use_edge_angle=True
def mat(key,c,metal=0,emit=False):
 if key in M:return M[key]
 m=bpy.data.materials.new(key);m.use_nodes=True;b=m.node_tree.nodes.get('Principled BSDF');b.inputs['Base Color'].default_value=(*c,1);b.inputs['Metallic'].default_value=metal;b.inputs['Roughness'].default_value=.4
 if emit:b.inputs['Base Color'].default_value=(0,0,0,1);b.inputs['Emission Color'].default_value=(*c,1);b.inputs['Emission Strength'].default_value=1
 M[key]=m;return m
for d in md:
 if d['group'] in ['Fit_coupons','Legacy_contact_concept']:continue
 bpy.ops.wm.stl_import(filepath=str(OUT/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];o['group']=d['group'];o['moving']=d['moving'];o['description']=d['description'];objects[o.name]=o
 smooth(o)
 o.data.materials.append(mat(str(d['color']),d['color'],.5 if d['group'] in ['Fasteners','Springs'] else .05))
 o.hide_render=d['group'] in ['Vibration_head','Service_lock','Accessories']
def cube(name,loc,size,ma):
 bpy.ops.mesh.primitive_cube_add(size=1,location=loc);o=bpy.context.object;o.name=name;o.dimensions=size;bpy.ops.object.transform_apply(location=False,rotation=False,scale=True);o.data.materials.append(ma);return o
floor=cube('Studio floor',(140,0,-36),(2000,2000,1),mat('Floor',(.83,.87,.86)))
for loc,power,size in [((80,-150,230),550000,230),((230,150,160),220000,180),((290,-60,110),180000,120)]:
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.data.energy=power;o.data.size=size;o.rotation_euler=(Vector((185,0,0))-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.object.camera_add();cam=bpy.context.object;s.camera=cam;cam.data.type='ORTHO';cam.data.clip_end=5000
fontpath='/System/Library/Fonts/Supplemental/Arial.ttf'
font=bpy.data.fonts.load(fontpath) if Path(fontpath).exists() else None
INK=mat('Ink',(.02,.055,.065),emit=True);MUTED=mat('Muted',(.16,.23,.25),emit=True);PAPER=mat('Paper',(.98,.99,.98),emit=True);ACCENT=mat('Accent',(.015,.36,.31),emit=True)
annotations=[]
def pworld(x,y,d=4):return cam.matrix_world@Vector(((x/W-.5)*cam.data.ortho_scale,(.5-y/H)*cam.data.ortho_scale*H/W,-d))
def text(body,x,y,size=28,ma=INK):
 cu=bpy.data.curves.new(body[:30],'FONT');cu.body=body;cu.size=size*cam.data.ortho_scale/W;cu.align_y='TOP'
 if font:cu.font=font
 ob=bpy.data.objects.new(body[:30],cu);s.collection.objects.link(ob);ob.location=pworld(x,y);ob.rotation_euler=cam.rotation_euler;cu.materials.append(ma);annotations.append(ob)
def panel(x,y,w,h):
 me=bpy.data.meshes.new('Panel');me.from_pydata([pworld(x,y,4.5),pworld(x+w,y,4.5),pworld(x+w,y+h,4.5),pworld(x,y+h,4.5)],[],[(0,1,2,3)]);o=bpy.data.objects.new('Panel',me);s.collection.objects.link(o);me.materials.append(PAPER);annotations.append(o)
def leader(x,y,target):
 pt=world_to_camera_view(s,cam,Vector(target));end=(pt.x*W,(1-pt.y)*H)
 cu=bpy.data.curves.new('Leader','CURVE');cu.dimensions='3D';cu.bevel_depth=cam.data.ortho_scale/W*.9;cu.bevel_resolution=2;sp=cu.splines.new('POLY');sp.points.add(1)
 for v,p in zip(sp.points,[(x,y),end]):v.co=(*pworld(*p,d=4.2),1)
 ob=bpy.data.objects.new('Leader',cu);s.collection.objects.link(ob);cu.materials.append(ACCENT);annotations.append(ob)
def label(title,detail,x,y,target,width=440):
 panel(x-10,y-8,width,82);text(title,x,y,27,ACCENT);text(detail,x,y+36,21,MUTED)
 pt=world_to_camera_view(s,cam,Vector(target));ex,ey=pt.x*W,(1-pt.y)*H
 # Connect from the nearest panel edge so leaders never cross their own text.
 sx=max(x-10,min(x+width-10,ex));sy=max(y-8,min(y+74,ey))
 leader(sx,sy,target)
def setup(loc,target,scale,title,subtitle):
 for o in annotations:bpy.data.objects.remove(o,do_unlink=True)
 annotations.clear()
 for o in objects.values():o.location=(0,0,0);o.hide_render=o['group'] in ['Vibration_head','Service_lock','Accessories']
 cam.location=loc;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale;bpy.context.view_layer.update()
 panel(0,0,W,150);text('SOLESENSE  /  R08  /  PRINTED FLEXURE PROTOTYPE',48,23,22,ACCENT);text(title,48,62,42);text(subtitle,49,114,23,MUTED)
 panel(0,1084,W,116);text('Replaceable printed flexure + real magnet + Hall sensor',48,1107,27,INK)
 text('Bench prototype. Fit and 1 / 10 / 75 gf performance require physical calibration. Dimensions are millimetres.',48,1153,21,MUTED)
def render(name):
 s.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True)
setup((350,-390,310),(140,0,1),350,'SoleSense — printed-flexure head','The curved R07 shell now contains a replaceable, flat-printed spring cassette.')
label('Same curved enclosure','56 mm wide; existing handle and screen',75,880,(202,-22,22),600)
label('Replaceable filament cartridge','Retained twist-lock and locking screw',1190,230,(244,0,4),550)
render('00_Design_Hero')

setup((290,-165,230),(203,-2,0),175,'Inside the R08 pressure head','Cover removed; near wall cut away for this view. Printed files retain complete walls.')
for o in objects.values():
 if o['group'] in ['Handle','Interface'] or o.name.startswith(('41_','43_','56_','REF_Lid_','REF_Nylon','REF_Adaptor_')):o.hide_render=True
chassis=objects['42_Magnetic_Chassis'];cutter=cube('Display-only cutaway',(204,-27,4),(74,10,36),PAPER)
bpy.context.view_layer.objects.active=chassis;mod=chassis.modifiers.new('Review cutaway only','BOOLEAN');mod.operation='DIFFERENCE';mod.solver='EXACT';mod.object=cutter
bpy.ops.object.modifier_apply(modifier=mod.name);bpy.data.objects.remove(cutter,do_unlink=True)
label('One replaceable printed cassette','Fixed rail + two beams + moving rail',55,205,(190.4,-8,-8.6),575)
label('Real magnet on moving carriage','6 × 3 mm disc; retained by screwed cap',1175,205,(180,7,0),565)
label('Stationary Hall sensor','Measures field; calibration converts to force',55,900,(170,7,0),590)
label('Mechanical travel limits','2.0 mm compression / 0.6 mm extension',1180,900,(226,7,-14),560)
render('02_Inside_Head')
# Restore the full chassis for the exploded view and saved scene.
bpy.data.objects.remove(chassis,do_unlink=True);bpy.ops.wm.stl_import(filepath=str(OUT/'reference/42_Magnetic_Chassis.stl'));chassis=bpy.context.object;chassis.name='42_Magnetic_Chassis';chassis['group']='Magnetic_head';chassis['moving']=False;smooth(chassis);chassis.data.materials.append(mat(str([.74,.81,.80]),[.74,.81,.80]));objects[chassis.name]=chassis

setup((320,-210,240),(204,-1,28),220,'How the new cassette attaches','Illustrative exploded offsets. Preassemble the moving rail to the carriage outside the housing.')
for o in objects.values():
 if o['group'] in ['Handle','Interface'] or o.name.startswith(('41_','43_','56_','REF_Lid_','REF_Nylon','REF_Adaptor_')):o.hide_render=True
 if o['moving']:o.location.z=57
 if o['group']=='Flexures' or o.name.startswith('REF_Flexure_'):o.location.z=29
 if o.name.startswith('REF_Flexure_Moving_Nut'):o.location.z=57
 if o.name.startswith('REF_Flexure_Fixed_Nut'):o.location.z=0
 if o.name.startswith('48_'):o.location.x=24
label('Blue carriage carries the magnet','Two underside screws attach moving rail',55,188,(201,7,57),580)
label('Teal cassette prints as one part','Select 0.8, 1.0 or 1.2 mm beams',1155,900,(217.4,-10,19),590)
label('Fixed rail attaches to chassis','Two screws from above; nuts underneath',55,900,(194,-22,20.4),590)
label('Cartridge still changes separately','Pin carriage, loosen lock, twist and pull',1155,188,(268,0,57),590)
render('03_Exploded_Cassette')

setup((203,-6,200),(203,-6,-10),108,'The part you print instead of metal springs','43 × 35.4 × 2.4 mm cassette. Flat orientation; no support beneath the flexing beams.')
for o in objects.values():o.hide_render=o['group']!='Flexures'
label('Moving rail','Two holes attach to the blue carriage',65,205,(200,7.4,-8.6),570)
label('Two flexible beams','0.8 mm baseline; rounded roots',1180,650,(217.4,-8,-8.6),555)
label('Fixed rail','Two holes attach to the white chassis',65,900,(204,-22,-8.6),570)
render('04_Printable_Cassette')
setup((350,-390,310),(140,0,1),350,'SoleSense R08 — printed-flexure head','Actual CAD-derived geometry. Replaceable cassette; force performance requires physical testing.')
if font:font.pack()
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R08_Review.blend'))
print('R08_PREVIEWS_COMPLETE')
