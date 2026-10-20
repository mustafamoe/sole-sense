"""Render verified CAD exports in background Blender; all dimensions are mm."""
import bpy,json,math
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view
OUT=Path(__file__).resolve().parents[1];W,H=1800,1200
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='R05 magnetic prototype';s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=48
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.image_settings.file_format='PNG';s.view_settings.view_transform='Standard';s.view_settings.look='None';s.world.color=(.6,.6,.6)
M={};objects={};md=json.loads((OUT/'source/assembly_manifest.json').read_text())
def mat(key,c,metal=0,emit=False):
 if key in M:return M[key]
 m=bpy.data.materials.new(key);m.use_nodes=True;b=m.node_tree.nodes.get('Principled BSDF');b.inputs['Base Color'].default_value=(*c,1);b.inputs['Metallic'].default_value=metal;b.inputs['Roughness'].default_value=.4
 if emit:b.inputs['Base Color'].default_value=(0,0,0,1);b.inputs['Emission Color'].default_value=(*c,1);b.inputs['Emission Strength'].default_value=1
 M[key]=m;return m
for d in md:
 if d['group'] in ['Fit_coupons','Legacy_contact_concept']:continue
 bpy.ops.wm.stl_import(filepath=str(OUT/d['assembly_mesh']));o=bpy.context.object;o.name=d['name'];o['group']=d['group'];o['moving']=d['moving'];o['description']=d['description'];objects[o.name]=o
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
 panel(x-10,y-8,width,82);text(title,x,y,27,ACCENT);text(detail,x,y+36,21,MUTED);leader(x+width/2,y+76,target)
def setup(loc,target,scale,title,subtitle):
 for o in annotations:bpy.data.objects.remove(o,do_unlink=True)
 annotations.clear()
 for o in objects.values():o.location=(0,0,0);o.hide_render=o['group'] in ['Vibration_head','Service_lock','Accessories']
 cam.location=loc;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale;bpy.context.view_layer.update()
 panel(0,0,W,150);text('SOLESENSE  /  R05  /  FIRST PHYSICAL PROTOTYPE',48,23,22,ACCENT);text(title,48,62,42);text(subtitle,49,114,23,MUTED)
 panel(0,1084,W,116);text('Printed housing + metal leaf springs + magnetic displacement sensing',48,1107,27,INK)
 text('Bench prototype. Fit and 1 / 10 / 75 gf performance require physical calibration. Dimensions are millimetres.',48,1153,21,MUTED)
def render(name):
 s.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True)
setup((350,-390,310),(140,0,1),350,'Magnetic pressure head — assembled','Same R04 twist-lock and larger display, with a serviceable magnetic sensing head.')
label('Replaceable filament cartridge','Quarter-turn hub + positive locking screw',1260,230,(244,0,4),490)
label('Removable cover','Four screws open the sensing head',900,895,(204,0,18),490)
label('Existing twist-lock interface','Pressure and vibration heads share the joint',80,895,(152,-22,15),580)
render('01_Assembled')

setup((286,135,190),(202,-3,0),200,'Inside the magnetic head','Lid removed. Gold strips flex; the blue carriage carries the magnet and filament together.')
for o in objects.values():
 if o['group'] in ['Handle','Interface'] or o.name.startswith(('43_','REF_Lid_','REF_Nylon')):o.hide_render=True
# Camera-side wall is removed in this review only; printed chassis remains complete.
chassis=objects['42_Magnetic_Chassis'];cutter=cube('Temporary cutaway',(201.5,34,1),(74,5,33),PAPER)
bpy.context.view_layer.objects.active=chassis;mod=chassis.modifiers.new('Review cutaway only','BOOLEAN');mod.operation='DIFFERENCE';mod.solver='EXACT';mod.object=cutter
bpy.ops.object.modifier_apply(modifier=mod.name);bpy.data.objects.remove(cutter,do_unlink=True)
label('Two replaceable metal leaves','28 × 12 × 0.10 mm phosphor bronze',65,190,(190.05,-17,1),550)
label('Hall sensor, fixed to the housing','DRV5055A3QLPG; adjustable gap',65,880,(170,0,0),560)
label('Magnet moves with the carriage','6 × 3 mm, axially magnetized',1170,190,(180,0,0),570)
label('Mechanical travel stops','2.4 mm compression / 1.0 mm extension',1170,880,(226,0,-14),570)
render('02_Inside_Head')

setup((285,145,180),(203,0,23),245,'Assembly and cartridge service','Install the service pin before clamping leaves or changing the cartridge; remove it completely to measure.')
for o in objects.values():
 if o['group'] in ['Handle','Interface'] or o.name.startswith('REF_Nylon'):o.hide_render=True
 if o.name.startswith(('43_','REF_Lid_')):o.location.z=43
 if o['group']=='Service_lock':o.hide_render=False;o.location.z=60
 if o.name.startswith(('48_','REF_Nylon')):o.location.x=25
 if o.name.startswith(('51_','REF_Cartridge_Lock')):o.location.z=7
label('Lid and captive nuts','Install nuts before closing the head',65,180,(207,10,62),530)
label('Red service pin','Protects the leaves during cartridge changes',1150,180,(226,0,80),590)
label('Clamped metal springs','No drilling through the thin strips',65,890,(190,-17,0),550)
label('Locking cartridge','Loosen small knob, twist 30°, withdraw',1150,890,(268,0,0),590)
render('03_Assembly_Service')
# Save clean native view with uncut mesh restored from the CAD export.
bpy.data.objects.remove(chassis,do_unlink=True);bpy.ops.wm.stl_import(filepath=str(OUT/'reference/42_Magnetic_Chassis.stl'));chassis=bpy.context.object;chassis.name='42_Magnetic_Chassis';chassis['group']='Magnetic_head';chassis.data.materials.append(mat(str([.74,.81,.80]),[.74,.81,.80]));objects[chassis.name]=chassis
setup((350,-390,310),(140,0,1),350,'Magnetic pressure head — R05','Editable CAD-derived review. See the build guide before printing.')
if font:font.pack()
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R05_Review.blend'))
print('R05_PREVIEWS_COMPLETE')
