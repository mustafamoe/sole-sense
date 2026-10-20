import bpy, json, math
from pathlib import Path
from mathutils import Vector
OUT=Path(__file__).resolve().parents[1]
manifest=json.loads((OUT/'source/assembly_manifest.json').read_text())
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
base=bpy.context.scene;base.name='01 • Assembly'
base.unit_settings.system='METRIC';base.unit_settings.scale_length=.001;base.unit_settings.length_unit='MILLIMETERS'
materials={}
def mat(name,c,metal=0,rough=.4):
 if name in materials:return materials[name]
 m=bpy.data.materials.new(name);m.diffuse_color=(*c,1);m.use_nodes=True
 bs=m.node_tree.nodes.get('Principled BSDF');bs.inputs['Base Color'].default_value=(*c,1);bs.inputs['Roughness'].default_value=rough;bs.inputs['Metallic'].default_value=metal
 materials[name]=m;return m
objects={}
for d in manifest:
 if d['group']=='Fit_coupons':continue
 bpy.ops.wm.stl_import(filepath=str(OUT/d['assembly_mesh']))
 o=bpy.context.object;o.name=d['name'];objects[o.name]=o
 o['role']=d['kind'];o['design_status']='Engineering prototype: physical fit and force calibration required';o['notes']=d['description']
 o.data.materials.append(mat(str(d['color']),d['color'],.06,.33))
 for p in o.data.polygons:p.use_smooth=False
 # Small presentation bevel only. STEP/STL exports retain exact CAD geometry.
 # Keep engineering meshes exact; beveling triangulated hole rims creates artifacts.
 if d['group']=='Vibration_head' or 'CoinMotor' in o.name or 'Vibration_Driver' in o.name:o.location.y=87;o.location.x=15


# Screen insert on top of provisional OLED envelope.
def cube(n,loc,size,m):
 bpy.ops.mesh.primitive_cube_add(size=1,location=loc);o=bpy.context.object;o.name=n;o.dimensions=size;bpy.ops.object.transform_apply(location=False,rotation=False,scale=True);o.data.materials.append(m);return o
screen=cube('Display glass',(39,0,24.5),(22,11.8,.5),mat('Glass',(.015,.038,.046),.05,.22))
# Hints of external screw hardware; not part of printable geometry.
def cyl(n,loc,r,depth,m,axis='Z'):
 bpy.ops.mesh.primitive_cylinder_add(vertices=48,radius=r,depth=depth,location=loc);o=bpy.context.object;o.name=n
 if axis=='Y':o.rotation_euler.x=math.pi/2
 if axis=='X':o.rotation_euler.y=math.pi/2
 o.data.materials.append(m);b=o.modifiers.new('Machined edge','BEVEL');b.width=.3;b.segments=3;return o
metal=mat('Titanium',(.26,.33,.34),.75,.3)
for sy in [-1,1]:cyl('Head retaining screw',(146.5,sy*28.2,5),3.3,2.8,metal,'Y')
# Lighting, ground and camera.
bpy.ops.mesh.primitive_plane_add(size=2000,location=(90,0,-29));floor=bpy.context.object;floor.name='Studio surface';floor.data.materials.append(mat('Surface',(.77,.81,.8),0,.8))
def area(n,loc,power,size):
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=n;o.data.energy=power;o.data.shape='DISK';o.data.size=size;o.rotation_euler=(Vector((95,20,0))-o.location).to_track_quat('-Z','Y').to_euler()
area('Large softbox',(50,-170,280),1900000,230);area('Fill',(120,180,200),1300000,200);area('Rim',(-100,70,140),900000,140)
bpy.ops.object.camera_add(location=(335,-380,290));cam=bpy.context.object;cam.name='Review camera';cam.data.type='ORTHO';cam.data.ortho_scale=360;cam.rotation_euler=(Vector((125,24,3))-cam.location).to_track_quat('-Z','Y').to_euler();base.camera=cam
base.world.color=(.5,.5,.5)
base.render.engine='CYCLES';base.cycles.samples=24;base.cycles.use_denoising=True
base.render.resolution_x=1800;base.render.resolution_y=1120;base.render.resolution_percentage=100
base.view_settings.view_transform='AgX'
base.render.image_settings.file_format='PNG';base.render.film_transparent=False
# Duplicate scene contents for clear engineering review without moving the assembly source.
def duplicate_scene(name):
 new=bpy.data.scenes.new(name)
 for o in base.objects:
  ob=o.copy();new.collection.objects.link(ob)
  if o==base.camera:new.camera=ob
 new.world=base.world;new.render.engine='CYCLES';new.cycles.samples=24;new.cycles.use_denoising=True
 new.render.resolution_x=1800;new.render.resolution_y=1120;new.render.resolution_percentage=100
 new.render.image_settings.file_format='PNG';new.view_settings.view_transform='AgX';new.unit_settings.system='METRIC';new.unit_settings.scale_length=.001
 return new
exploded=duplicate_scene('02 • Exploded and wiring')
for o in exploded.objects:
 n=o.name
 if n.startswith('02_Handle_Upper'):o.location.z+=65
 if n.startswith('12_Button') or n.startswith('Display glass') or n.startswith('REF_OLED'):o.location.z+=65
 if n.startswith('03_Controller') or n.startswith('REF_Controller'):o.location.z+=22
 if n.startswith('05_SD') or n.startswith('REF_MicroSD'):o.location.z+=22
 if n.startswith('20_Boost') or n.startswith('REF_Pololu'):o.location.z+=40
 if n.startswith('30_OLED') or n.startswith('REF_Power_Slide'):o.location.z+=65
 if n.startswith('07_'):o.location.y-=75
 if n.startswith('09_') or n.startswith(('21_','22_','23_','24_','25_','26_','27_','28_')) or any(t in n for t in ['REF_SG90','REF_Nylon','REF_Probe_','REF_TCST','REF_Stock_Horn']):o.location.x+=35
 if n.startswith('08_'):o.location.x+=72
 if o.get('role')=='reference':o.hide_render=False
 if n.startswith('Head retaining'):o.location.y+=15 if o.location.y>0 else -15
exploded.camera.location=(350,-440,335);exploded.camera.rotation_euler=(Vector((151,8,26))-exploded.camera.location).to_track_quat('-Z','Y').to_euler();exploded.camera.data=exploded.camera.data.copy();exploded.camera.data.ortho_scale=420
# Wire routes are illustrative, with a visible service loop from handle to withdrawn head.
def wire(scene,n,pts,color,r=.46):
 cu=bpy.data.curves.new(n,'CURVE');cu.dimensions='3D';cu.resolution_u=16;cu.bevel_depth=r;cu.bevel_resolution=3
 sp=cu.splines.new('BEZIER');sp.bezier_points.add(len(pts)-1)
 for p,co in zip(sp.bezier_points,pts):p.co=co;p.handle_left_type='AUTO';p.handle_right_type='AUTO'
 ob=bpy.data.objects.new(n,cu);scene.collection.objects.link(ob);cu.materials.append(mat(n,color,0,.36));return ob
for i,c in enumerate([(.08,.09,.1),(.78,.13,.07),(.94,.66,.09),(.04,.40,.48),(.43,.22,.5),(.65,.67,.66)]):
 d=(i-2.5)*1.25
 wire(exploded,'Harness conductor '+str(i+1),[(72,-16,-2.3+d*.2),(105,-10,-3+d*.2),(130,-1,d*.2),(156,-8,d*.2),(172,-16,-10+d*.2),(184,-15,d*.2),(196,-18,d*.2)],c)
# Open handle assembly view retains true relative component positions.
cutaway=duplicate_scene('03 • Internal packaging')
for o in cutaway.objects:
 n=o.name
 if n.startswith('02_Handle_Upper') or n.startswith('12_Button') or n.startswith('Display glass') or n.startswith('REF_OLED'):o.hide_render=True
 if o.get('role')=='reference':o.hide_render=False
 if n.startswith(('REF_OLED','30_OLED','REF_Power_Slide')):o.hide_render=True
 if n.startswith('07_'):o.hide_render=True
 if n.startswith('08_'):o.location.x+=16
for i,c in enumerate([(.08,.09,.1),(.78,.13,.07),(.94,.66,.09),(.04,.40,.48),(.43,.22,.5),(.65,.67,.66)]):
 d=(i-2.5)*1.25
 wire(cutaway,'Wire route '+str(i+1),[(72,-16,-2.3+d*.16),(85,-10,-3+d*.16),(119,-10,-3+d*.16),(127,0,d*.16),(146,0,d*.16),(158,-16,d*.16),(179,-22,d*.16)],c)
# Dedicated mechanism view: actual geometry, body hidden for inspection.
mechanism=duplicate_scene('04 • Filament mechanism')
for o in mechanism.objects:
 n=o.name
 if n.startswith(('01_','02_','03_','04_','05_','06_','07_','08_','10_','11_','12_','14_','20_','29_','30_','31_','Display glass','Head retaining')):o.hide_render=True
 if o.get('role')=='reference' and not any(k in n for k in ['SG90','Nylon','Probe_','TCST','Stock_Horn']):o.hide_render=True
mechanism.camera.data=mechanism.camera.data.copy();mechanism.camera.data.ortho_scale=151
mechanism.camera.location=(335,-225,170);mechanism.camera.rotation_euler=(Vector((220,0,0))-mechanism.camera.location).to_track_quat('-Z','Y').to_euler()
# Store assembled dimensions and limits in a native text block.
t=bpy.data.texts.new('READ ME — engineering prototype');t.write('SoleSense R03: bench engineering prototype.\n31 printable parts including 6 fit coupons. See README.md and docs/decisions.md.\nCAD and mesh checks are geometric only. Hardware references are nominal envelopes, not certified supplier CAD.\nCalibration, electrical validation and print fit remain physical work.\n')
bpy.context.window.scene=base
for screen_data in bpy.data.screens:
 for area_data in screen_data.areas:
  if area_data.type=='VIEW_3D':
   area_data.spaces.active.region_3d.view_distance=320;area_data.spaces.active.region_3d.view_location=Vector((104,20,0))
   area_data.spaces.active.clip_end=5000
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R03_Review.blend'))
for sc,n in [(base,'01_Assembly'),(exploded,'02_Exploded_Wiring'),(cutaway,'03_Internal_Packaging'),(mechanism,'04_Filament_Mechanism')]:
 bpy.context.window.scene=sc;sc.render.filepath=str(OUT/'previews'/f'{n}.png');bpy.ops.render.render(write_still=True,scene=sc.name)
print('RENDER_COMPLETE')
