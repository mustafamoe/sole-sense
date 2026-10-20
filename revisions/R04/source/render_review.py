"""Render exported CAD in a separate background Blender session."""
import bpy, json, math
from pathlib import Path
from mathutils import Vector
OUT=Path(__file__).resolve().parents[1]
manifest=json.loads((OUT/'source/assembly_manifest.json').read_text())
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
scene=bpy.context.scene;scene.name='01 R04 assembly'
scene.unit_settings.system='METRIC';scene.unit_settings.scale_length=.001
mats={};objects={}
def mat(name,color,metal=0,rough=.42):
    if name in mats:return mats[name]
    m=bpy.data.materials.new(name);m.diffuse_color=(*color,1);m.use_nodes=True
    bs=next(n for n in m.node_tree.nodes if n.type=='BSDF_PRINCIPLED')
    bs.inputs['Base Color'].default_value=(*color,1);bs.inputs['Metallic'].default_value=metal;bs.inputs['Roughness'].default_value=rough
    mats[name]=m;return m
for d in manifest:
    if d['group'] in ['Fit_coupons','Accessories']:continue
    bpy.ops.wm.stl_import(filepath=str(OUT/d['assembly_mesh']))
    ob=bpy.context.object;ob.name=d['name'];objects[ob.name]=ob
    ob['group']=d['group'];ob['kind']=d['kind'];ob['design_notes']=d['description']
    ob.data.materials.append(mat(str(d['color']),d['color'],.35 if 'Pad_' in ob.name or 'Spring_Pin' in ob.name else .02))
    if d['group']=='Vibration_head':ob.location=(8,82,0)

def cube(name,location,size,material):
    bpy.ops.mesh.primitive_cube_add(size=1,location=location);ob=bpy.context.object;ob.name=name;ob.dimensions=size
    bpy.ops.object.transform_apply(location=False,rotation=False,scale=True);ob.data.materials.append(material);return ob
glass=cube('Display active area',(40,0,27.12),(29.42,14.7,.12),mat('Screen glass',(.012,.035,.038),.05,.2));glass['group']='Handle'
def text_obj(name,text,loc,size,material,scene=scene):
    cu=bpy.data.curves.new(name,'FONT');cu.body=text;cu.size=size;cu.align_x='LEFT';cu.extrude=0
    ob=bpy.data.objects.new(name,cu);scene.collection.objects.link(ob);ob.location=loc;cu.materials.append(material);return ob
lit=mat('Screen pale',(.64,.92,.84),0,.5)
for txt,loc,size in [('PRESSURE',(26.3,3.0,27.21),2.7),('CARTRIDGE',(26.3,-1.0,27.21),2.05),('READY',(26.3,-5.0,27.21),2.5)]:
    ob=text_obj('Display mockup '+txt,txt,loc,size,lit);ob['group']='Handle'
# Studio setup keeps every visible mesh at its exact CAD dimensions.
bpy.ops.mesh.primitive_plane_add(size=2000,location=(110,15,-32.1));floor=bpy.context.object;floor.name='Studio floor';floor.data.materials.append(mat('Warm background',(.69,.73,.71),0,.85))
def area(name,loc,energy,size):
    bpy.ops.object.light_add(type='AREA',location=loc);ob=bpy.context.object;ob.name=name;ob.data.energy=energy;ob.data.size=size
    ob.rotation_euler=(Vector((115,20,0))-ob.location).to_track_quat('-Z','Y').to_euler()
area('Key softbox',(20,-150,270),1600000,230);area('Fill',(140,180,210),950000,200);area('Rim',(260,70,100),700000,130)
bpy.ops.object.camera_add(location=(300,-400,280));cam=bpy.context.object;cam.name='Review camera';cam.data.type='ORTHO';scene.camera=cam
scene.world.color=(.35,.35,.35)
scene.render.engine='CYCLES';scene.cycles.samples=32;scene.cycles.use_denoising=True
scene.render.resolution_x=1600;scene.render.resolution_y=1000;scene.render.resolution_percentage=100
scene.render.image_settings.file_format='PNG'
def camera(sc,loc,target,scale):
    sc.camera.location=loc;sc.camera.rotation_euler=(Vector(target)-sc.camera.location).to_track_quat('-Z','Y').to_euler();sc.camera.data.ortho_scale=scale
camera(scene,(300,-400,280),(110,24,7),310)
def duplicate(name):
    sc=bpy.data.scenes.new(name)
    for ob in scene.objects:
        cp=ob.copy();sc.collection.objects.link(cp)
        if ob==scene.camera:cp.data=ob.data.copy();sc.camera=cp
    sc.world=scene.world;sc.render.engine='CYCLES';sc.cycles.samples=32;sc.cycles.use_denoising=True
    sc.render.resolution_x=1600;sc.render.resolution_y=1000;sc.render.resolution_percentage=100;sc.render.image_settings.file_format='PNG'
    sc.unit_settings.system='METRIC';sc.unit_settings.scale_length=.001
    return sc

swap=duplicate('02 Head swap')
for ob in swap.objects:
    g=ob.get('group');n=ob.name
    if g=='Vibration_head':ob.hide_render=True
    if g=='Pressure_head':ob.location.x+=37
    if n.startswith('32_Collar'):ob.location.x-=5
    if n.startswith(('33_Captive','40_Captive')):ob.rotation_euler.x=math.radians(-30)
camera(swap,(290,-220,170),(171,0,0),177)

cartridge=duplicate('03 Replaceable cartridge')
for ob in cartridge.objects:
    g=ob.get('group');n=ob.name
    if g in ['Handle','Interface','Vibration_head']:ob.hide_render=True
    if n.startswith('35_') or n.startswith('REF_Exposed'):ob.location.x+=25
camera(cartridge,(300,-155,130),(198,0,0),142)

contacts=duplicate('04 Stationary contacts')
for ob in contacts.objects:
    g=ob.get('group');n=ob.name
    if g in ['Handle','Interface','Vibration_head']:ob.hide_render=True
    if n.startswith('35_') or n.startswith('REF_Exposed'):ob.hide_render=True
camera(contacts,(58,-95,95),(153,0,0),100)

screen=duplicate('05 Larger display')
for ob in screen.objects:
    g=ob.get('group');n=ob.name
    if g in ['Pressure_head','Vibration_head']:ob.hide_render=True
camera(screen,(118,-130,195),(54,0,12),154)

# Native editable review scenes store the same exported CAD meshes.
note=bpy.data.texts.new('R04 READ ME')
note.write('R04 mechanical review concept, October 2026.\nCAD: SoleSense_R04.FCStd.\nHead remains stationary while collar rotates 30 degrees. Pull safety slider back 5 mm first.\nSingle exposed nylon cartridge, manual application; no automatic force measurement or contact timing.\nScreen mockup is illustrative, not firmware. Spring contacts are unselected hardware envelopes.\nSee ../docs/DESIGN_REVIEW.md for validation boundaries.\n')
bpy.context.window.scene=scene
for scr in bpy.data.screens:
    for ar in scr.areas:
        if ar.type=='VIEW_3D':
            ar.spaces.active.clip_end=5000;ar.spaces.active.region_3d.view_location=Vector((110,24,0));ar.spaces.active.region_3d.view_distance=290
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Review.blend'))
for sc,name in [(scene,'01_Assembly'),(swap,'02_Head_Swap'),(cartridge,'03_Cartridge_Replacement'),(contacts,'04_Stationary_Contacts'),(screen,'05_Larger_Display')]:
    bpy.context.window.scene=sc;sc.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True,scene=sc.name)
print('R04_REVIEW_RENDERED')
