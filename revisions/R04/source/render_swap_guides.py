"""Labeled CAD exploded views; annotations are native Blender geometry.
Run in a background Blender session. Does not change any mechanical part.
"""
import bpy, math, json
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view
OUT=Path(__file__).resolve().parents[1]
bpy.ops.wm.open_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Review.blend'))
W,H=1800,1200
INK=(.025,.07,.075); MUTED=(.07,.12,.125); TEAL=(.015,.27,.29); GOLD=(.62,.34,.07)
WHITE=(.97,.98,.97); PALE=(.86,.91,.89)
materials={}
def emission(c):
    k=str(c)
    if k in materials:return materials[k]
    m=bpy.data.materials.new('Guide '+k);m.use_nodes=True;m.node_tree.nodes.clear()
    e=m.node_tree.nodes.new('ShaderNodeEmission');e.inputs['Color'].default_value=(*c,1)
    if c==WHITE:e.inputs['Strength'].default_value=4
    o=m.node_tree.nodes.new('ShaderNodeOutputMaterial');m.node_tree.links.new(e.outputs[0],o.inputs['Surface'])
    materials[k]=m;return m
def configure(sc,loc,target,scale):
    bpy.context.window.scene=sc
    sc.camera.location=loc;sc.camera.rotation_euler=(Vector(target)-sc.camera.location).to_track_quat('-Z','Y').to_euler()
    sc.camera.data.ortho_scale=scale;sc.camera.data.clip_start=.1
    sc.render.resolution_x=W;sc.render.resolution_y=H;sc.render.resolution_percentage=100
    sc.cycles.samples=32;sc.render.image_settings.file_format='PNG'
    bpy.context.view_layer.update()
def pworld(sc,x,y,depth=5):
    scale=sc.camera.data.ortho_scale
    return sc.camera.matrix_world @ Vector(((x/W-.5)*scale,(.5-y/H)*scale*H/W,-depth))
def project(sc,xyz):
    p=world_to_camera_view(sc,sc.camera,Vector(xyz));return (p.x*W,(1-p.y)*H)
def polygon(sc,name,pts,color,depth=5.1):
    mesh=bpy.data.meshes.new(name);mesh.from_pydata([pworld(sc,*p,depth) for p in pts],[],[list(range(len(pts)))])
    ob=bpy.data.objects.new(name,mesh);sc.collection.objects.link(ob);ob.data.materials.append(emission(color));return ob
def rect(sc,name,x,y,w,h,c,depth=5.1):return polygon(sc,name,[(x,y),(x+w,y),(x+w,y+h),(x,y+h)],c,depth)
def text(sc,name,body,x,y,size=27,color=INK):
    cu=bpy.data.curves.new(name,'FONT');cu.body=body;cu.size=size*sc.camera.data.ortho_scale/W;cu.align_y='TOP'
    cu.space_line=1.12;ob=bpy.data.objects.new(name,cu);sc.collection.objects.link(ob)
    ob.location=pworld(sc,x,y,4.6);ob.rotation_euler=sc.camera.rotation_euler;cu.materials.append(emission(color));return ob
def line(sc,name,pts,color=TEAL,width=2.5,depth=4.9):
    cu=bpy.data.curves.new(name,'CURVE');cu.dimensions='3D';cu.bevel_depth=width*.5*sc.camera.data.ortho_scale/W;cu.bevel_resolution=2
    sp=cu.splines.new('POLY');sp.points.add(len(pts)-1)
    for p,xy in zip(sp.points,pts):p.co=(*pworld(sc,*xy,depth),1)
    ob=bpy.data.objects.new(name,cu);sc.collection.objects.link(ob);cu.materials.append(emission(color));return ob
def dot(sc,name,x,y,r=5,color=TEAL):
    return polygon(sc,name,[(x+r*math.cos(t*math.pi/16),y+r*math.sin(t*math.pi/16)) for t in range(32)],color,4.75)
def arrow(sc,name,pts,color=TEAL,width=4,head=14):
    line(sc,name,pts,color,width)
    a,b=Vector(pts[-2]),Vector(pts[-1]);d=(b-a).normalized();n=Vector((-d.y,d.x))
    polygon(sc,name+' head',[tuple(b),tuple(b-head*d+head*.46*n),tuple(b-head*d-head*.46*n)],color,4.7)
def label(sc,name,title,subtitle,x,y,w,anchor,color=TEAL,side='bottom'):
    h=94 if subtitle else 65
    rect(sc,name+' background',x-12,y-10,w,h,WHITE)
    rect(sc,name+' accent',x-12,y-10,4,h,color,5.0)
    text(sc,name+' title',title,x+6,y+3,28,color)
    if subtitle:text(sc,name+' detail',subtitle,x+6,y+40,22,MUTED)
    end=project(sc,anchor)
    if side=='bottom':start=(x+w*.5,y+h-10);elbow=(start[0],start[1]+22)
    elif side=='top':start=(x+w*.5,y-10);elbow=(start[0],start[1]-22)
    elif side=='left':start=(x-12,y+h*.5-10);elbow=(start[0]-22,start[1])
    else:start=(x+w-12,y+h*.5-10);elbow=(start[0]+22,start[1])
    line(sc,name+' leader',[start,elbow,end],color,2.3);dot(sc,name+' point',*end,4.5,color)
def header(sc,k,title,subtitle):
    rect(sc,'Header panel',0,0,W,161,WHITE)
    text(sc,'Eyebrow',f'SOLE SENSE  /  R04 CONCEPT  /  {k}',52,25,22,TEAL)
    text(sc,'Title',title,50,61,44)
    text(sc,'Subtitle',subtitle,52,117,24,MUTED)
def steps(sc,items,note):
    rect(sc,'Instruction panel',0,934,W,266,WHITE)
    rect(sc,'Footer rule',52,933,1696,2,PALE)
    for i,(title,body) in enumerate(items):
        x=52+i*570
        dot(sc,'Step circle '+str(i),x+20,982,20,TEAL)
        text(sc,'Step number '+str(i),str(i+1),x+12,968,27,WHITE)
        text(sc,'Step title '+str(i),title,x+56,965,29)
        text(sc,'Step detail '+str(i),body,x+56,1008,24,MUTED)
    text(sc,'Footer note',note,52,1141,21,MUTED)

head=bpy.data.scenes['02 Head swap'];head.name='06 Labeled head exchange'
configure(head,(290,-245,175),(172,0,-4),224)
header(head,'01','Swap the complete head','Power off first. The same connection accepts the pressure head or the vibration head.')
label(head,'slider','Release slider','Pull 5 mm toward the handle',96,197,407,(126,0,34))
label(head,'contacts','Built-in contacts','Separate as the head pulls out',676,190,408,(143.9,-3,0))
label(head,'head','Whole head','Pressure head shown',1330,264,350,(214,-15,12),side='left')
label(head,'collar','Captive collar','Stays on the handle',140,796,360,(151,-29,-3),side='top')
# All motion arrows are projections of actual model directions.
arrow(head,'Slider retract arrow',[project(head,(130,-5,39)),project(head,(119,-5,39))],TEAL,4)
arc=[project(head,(163,36*math.cos(math.radians(a)),36*math.sin(math.radians(a)))) for a in range(140,109,-2)]
arrow(head,'Collar turn arrow',arc,TEAL,4)
arrow(head,'Head withdraw arrow',[project(head,(163,-39,-5)),project(head,(190,-39,-5))],TEAL,4.5)
steps(head,[('Release','Switch power off, then pull\nthe top slider back.'),('Turn the collar','Rotate the teal collar 30°.\nKeep the head aligned.'),('Exchange the head','Pull straight out. Insert the other\nhead, turn back, then relock.')],
      'The collar bolts stay installed. Contacts are provisional hardware envelopes; this is a mechanical concept.')

cart=bpy.data.scenes['03 Replaceable cartridge'];cart.name='07 Labeled cartridge exchange'
# Show the cartridge in its actual unlocked orientation, with the display separation.
for ob in cart.objects:
    if ob.name.startswith(('35_','REF_Exposed')):ob.rotation_euler.x=math.radians(30)
configure(cart,(300,-155,130),(196,0,-3),178)
header(cart,'02','Replace the filament cartridge','The pressure head stays locked to the handle. It is shown alone here so the cartridge joint is visible.')
label(cart,'socket','Cartridge socket','Align the lugs with these slots',72,205,405,(182.7,5.4,3.2))
label(cart,'hub','Grip the wide hub','Twist 30°, then pull straight out',1010,205,480,(209,-7,5),GOLD)
label(cart,'body','Pressure head','Remains attached during replacement',76,793,474,(163,-22,3),side='top')
label(cart,'filament','Filament + hub','Replace together; avoid touching nylon',1164,786,570,(235,0,0),GOLD,side='top')
arrow(cart,'Cartridge withdraw arrow',[project(cart,(187,-15,0)),project(cart,(208,-15,0))],GOLD,4.5)
arc=[project(cart,(211,15*math.cos(math.radians(a)),15*math.sin(math.radians(a)))) for a in range(80,111,2)]
arrow(cart,'Cartridge turn arrow',arc,GOLD,4)
steps(cart,[('Unlock the cartridge','Hold the head steady. Turn\nthe wide cartridge hub 30°.'),('Remove by the hub','Pull the complete cartridge out.\nDo not pull on the filament.'),('Fit the replacement','Align the lugs, insert fully, then\nturn back and check retention.')],
      'No head removal is needed. Cartridge retention, calibrated force and hygiene still require physical validation.')

mapping={}
for sc,name in [(head,'06_Exploded_Head_Swap_Labeled'),(cart,'07_Exploded_Cartridge_Labeled')]:
    bpy.context.window.scene=sc
    mapping[name]={'scene':sc.name,'size':[W,H],'mechanical_geometry':'Unchanged exported R04 CAD meshes','render':f'previews/{name}.png'}
bpy.context.window.scene=head
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Exploded_Guides.blend'))
for sc,name in [(head,'06_Exploded_Head_Swap_Labeled'),(cart,'07_Exploded_Cartridge_Labeled')]:
    bpy.context.window.scene=sc;sc.render.filepath=str(OUT/'previews'/f'{name}.png');bpy.ops.render.render(write_still=True,scene=sc.name)
(OUT/'previews/swap_guide_views.json').write_text(json.dumps(mapping,indent=2))
print('LABELED_SWAP_GUIDES_COMPLETE')
