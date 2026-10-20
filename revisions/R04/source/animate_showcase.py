"""Reproducible CAD animation. Use --preview or --render after Blender's -- separator."""
import bpy, math, sys, json, time
from pathlib import Path
from mathutils import Vector
OUT=Path(__file__).resolve().parents[1]
VID=OUT/'video'; VID.mkdir(exist_ok=True)
FPS=24; DURATION=44; W=1280; H=720
bpy.ops.wm.open_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Review.blend'))
s=bpy.data.scenes['01 R04 assembly']; bpy.context.window.scene=s
for other in list(bpy.data.scenes):
    if other!=s:bpy.data.scenes.remove(other)
s.name='SoleSense R04 - animated walkthrough'
s.render.engine='BLENDER_EEVEE'; s.eevee.taa_render_samples=32
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.fps=FPS;s.frame_start=1;s.frame_end=FPS*DURATION
s.render.image_settings.file_format='PNG';s.render.image_settings.color_mode='RGB';s.render.image_settings.compression=15
s.render.film_transparent=False
cam=s.camera;cam.data.clip_start=.1;cam.data.clip_end=5000
# Smooth shading only changes normals; the CAD mesh and dimensions are preserved.
for o in s.objects:
    if o.type=='MESH' and o.get('group'):
        bpy.ops.object.select_all(action='DESELECT');o.select_set(True);bpy.context.view_layer.objects.active=o
        bpy.ops.object.shade_smooth_by_angle(angle=math.radians(35),keep_sharp_edges=True)

def empty(name,parent=None):
    ob=bpy.data.objects.new(name,None);s.collection.objects.link(ob);ob.parent=parent;return ob
root=empty('Device');pressure=empty('Pressure head',root);vibe=empty('Vibration head',root)
old=empty('Original cartridge',pressure);new=empty('Prepared replacement cartridge',pressure)
collar=empty('Turn collar only',root);slider=None
old_parts=[];new_parts=[];pressure_parts=[];vibe_parts=[]
for ob in list(s.objects):
    g=ob.get('group'); n=ob.name
    if not g:continue
    if not n.startswith('Display'):
        ob.location=(0,0,0);ob.rotation_euler=(0,0,0)
    ob.hide_render=False
    if n.startswith(('35_','REF_Exposed')):
        ob.parent=old;old_parts.append(ob)
    elif g=='Pressure_head':ob.parent=pressure;pressure_parts.append(ob)
    elif g=='Vibration_head':ob.parent=vibe;vibe_parts.append(ob)
    elif n.startswith(('33_Captive','40_Captive')):ob.parent=collar
    else:ob.parent=root
    if n.startswith('32_Collar'):slider=ob
for ob in old_parts:
    cp=ob.copy();cp.data=ob.data;cp.name='Replacement '+ob.name;s.collection.objects.link(cp);cp.parent=new;new_parts.append(cp)

# Clear mode lettering while the device is being exchanged. Screen remains a visual mockup.
screen_text=[o for o in s.objects if o.name.startswith('Display mockup')]
def emissive(name,col,strength=1):
    m=bpy.data.materials.new(name);m.use_nodes=True;n=m.node_tree.nodes;n.clear()
    e=n.new('ShaderNodeEmission');e.inputs['Color'].default_value=(*col,1);e.inputs['Strength'].default_value=strength
    out=n.new('ShaderNodeOutputMaterial');m.node_tree.links.new(e.outputs[0],out.inputs['Surface']);return m
ink=emissive('Overlay dark teal',(.011,.037,.039));muted=emissive('Overlay secondary',(.009,.025,.028))
teal=emissive('Overlay accent',(.01,.23,.24));white=emissive('Overlay white',(.96,.98,.97),4)
gold=emissive('Illustration gold',(.70,.39,.10),1.3)
ui=empty('Camera typography');ui.parent=cam
FONT=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial.ttf')
BOLD=bpy.data.fonts.load('/System/Library/Fonts/Supplemental/Arial Bold.ttf')
REF=350;U=REF/W

def ui_text(name,body,x,y,size,material=ink,bold=False):
    cu=bpy.data.curves.new(name,'FONT');cu.body=body;cu.size=size*U;cu.font=BOLD if bold else FONT;cu.align_y='TOP'
    ob=bpy.data.objects.new(name,cu);s.collection.objects.link(ob);ob.parent=ui;ob.location=((x-W/2)*U,(H/2-y)*U,-4.6);cu.materials.append(material);return ob

def ui_panel(name,x,y,w,h,material=white,depth=5.1):
    verts=[((x-W/2)*U,(H/2-y)*U,-depth),((x+w-W/2)*U,(H/2-y)*U,-depth),((x+w-W/2)*U,(H/2-y-h)*U,-depth),((x-W/2)*U,(H/2-y-h)*U,-depth)]
    mesh=bpy.data.meshes.new(name);mesh.from_pydata(verts,[],[(0,1,2,3)]);mesh.update()
    ob=bpy.data.objects.new(name,mesh);s.collection.objects.link(ob);ob.parent=ui;mesh.materials.append(material);return ob
ui_panel('Header',0,0,W,102);ui_panel('Caption panel',0,610,W,110)
ui_panel('Header accent',38,25,4,51,teal,4.9)
ui_text('Brand','SOLESENSE',1042,32,20,ink,True)
ui_text('Version','R04 / DESIGN CONCEPT',1042,59,13,muted)
ui_text('Persistent status','CAD MOTION STUDY  /  NOT A PHYSICAL DEMONSTRATION',38,696,12,muted)

chapters=[
(0,6,'01  /  OVERVIEW','One handle. Two heads.','Pressure cartridge + vibration head','A shared twist-lock interface, with built-in contacts proposed.'),
(6,8,'02  /  CHANGE THE HEAD','1. Release the safety slider','Power off, then slide the latch back','The teal collar stays captive on the handle.'),
(8,10,'02  /  CHANGE THE HEAD','2. Turn only the collar','Rotate the collar 30 degrees to unlock','The keyed head stays still, keeping the contacts aligned.'),
(10,12,'02  /  CHANGE THE HEAD','3. Pull the pressure head out','Withdraw the complete head straight ahead','The electrical contacts separate with the joint.'),
(12,14,'02  /  CHANGE THE HEAD','4. Align the vibration head','Match the key before inserting','Both heads use the same mechanical connection.'),
(14,16,'02  /  CHANGE THE HEAD','5. Push the head home','Seat the head straight into the handle','The proposed spring contacts meet the handle pads.'),
(16,18,'02  /  CHANGE THE HEAD','6. Lock the collar and slider','Return the collar, then slide the latch forward','The head remains stationary throughout locking.'),
(18,22,'03  /  VIBRATION','Vibration through a rounded tip','A motor inside the head would drive the tip','Wave graphics are schematic; output and frequency are unvalidated.'),
(22,25,'04  /  LARGER SCREEN','More room for a readable display','Enclosure sized for a 1.3-inch OLED','Screen content is a visual mockup. Pressure head shown reattached.'),
(25,27,'05  /  CHANGE THE FILAMENT','1. Turn the cartridge hub','Hold the gold hub and rotate 30 degrees','The pressure head can remain attached to the handle.'),
(27,29,'05  /  CHANGE THE FILAMENT','2. Pull out the whole cartridge','The filament and its hub come out together','Handle the hub; avoid touching or bending the nylon.'),
(29,31,'05  /  CHANGE THE FILAMENT','3. Insert a prepared replacement','Align the cartridge lugs and push the hub home','The replacement is shown with its filament already fixed in place.'),
(31,33,'05  /  CHANGE THE FILAMENT','4. Turn the cartridge to lock','Return the hub to its locked position','Filament geometry, calibration and hygiene still need validation.'),
(33,39,'06  /  PRESSURE CONCEPT','Manual application of the filament','The user moves the handle; the filament deflects','Illustrative flex on a test surface. No force measurement or calibration.'),
(39,44,'07  /  ANOTHER ANGLE','Modular heads. Replaceable contact part.','One pressure filament, changed as a complete cartridge','R04 is a review prototype; physical operation remains to be tested.')]
chapter_obs=[]
for i,(a,b,kicker,title,line1,line2) in enumerate(chapters):
    obs=[ui_text(f'Chapter {i} kicker',kicker,57,23,16,teal,True),ui_text(f'Chapter {i} title',title,57,46,36,ink,True),ui_text(f'Chapter {i} caption',line1,38,627,28,ink,True),ui_text(f'Chapter {i} detail',line2,38,663,21,muted,True)]
    chapter_obs.append(obs)
# A thin, neutral test plane is a visual aid, not a body surface.
bpy.ops.mesh.primitive_cube_add(size=1,location=(225.9,0,0));test=bpy.context.object;test.name='Schematic test surface';test.dimensions=(3,49,49)
bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
m=bpy.data.materials.new('Test surface teal');m.diffuse_color=(.13,.38,.36,1);m.use_nodes=True
bs=next(n for n in m.node_tree.nodes if n.type=='BSDF_PRINCIPLED');bs.inputs['Base Color'].default_value=(.13,.38,.36,1);bs.inputs['Roughness'].default_value=.8;test.data.materials.append(m)
bevel=test.modifiers.new('Soft visual edges','BEVEL');bevel.width=1;bevel.segments=3
# Flexible replacement for the straight CAD reference: a purely illustrative, constant-length curve.
curve=bpy.data.curves.new('Schematic filament flex','CURVE');curve.dimensions='3D';curve.bevel_depth=.45;curve.bevel_resolution=3;curve.resolution_u=1
spline=curve.splines.new('POLY');N=64;spline.points.add(N)
flex=bpy.data.objects.new('Filament flex - schematic',curve);s.collection.objects.link(flex);flex.parent=root
curve.materials.append(old_parts[[o.name.startswith('REF_Exposed') for o in old_parts].index(True)].data.materials[0])

def amplitude(shorten):
    span=38-shorten
    def length(a):
        pts=[Vector((span*j/N,a*math.sin(math.pi*j/N)**2,0)) for j in range(N+1)]
        return sum((b-a).length for a,b in zip(pts,pts[1:]))
    lo=0;hi=20
    for _ in range(25):
        mid=(lo+hi)/2
        if length(mid)>38:hi=mid
        else:lo=mid
    return (lo+hi)/2
# Graphic rings make the proposed vibration function visible without inventing a frequency.
rings=[]
for j in range(3):
    cu=bpy.data.curves.new(f'Schematic wave {j}','CURVE');cu.dimensions='3D';cu.bevel_depth=.25;cu.bevel_resolution=2
    sp=cu.splines.new('POLY');sp.points.add(63)
    for q,p in enumerate(sp.points):
        theta=math.tau*q/64;p.co=(0,math.cos(theta)*(9+j*4),math.sin(theta)*(9+j*4),1)
    sp.use_cyclic_u=True;ob=bpy.data.objects.new(f'Schematic vibration wave {j}',cu);s.collection.objects.link(ob);ob.location=(190+j*5,0,0);cu.materials.append(teal);rings.append(ob)

# Helpers: frame sampling yields deterministic animation and editable keyframes.
def ease(t,a,b):
    x=max(0,min(1,(t-a)/(b-a)));return x*x*(3-2*x)
def mix(a,b,t):return Vector(a).lerp(Vector(b),t)
def show(ob,value,f):ob.hide_render=not value;ob.keyframe_insert('hide_render',frame=f)
def loc(ob,value,f):ob.location=value;ob.keyframe_insert('location',frame=f)
def rot(ob,value,f):ob.rotation_euler=(value,0,0);ob.keyframe_insert('rotation_euler',frame=f)
def camera(position,target,scale,f):
    cam.location=position;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler();cam.data.ortho_scale=scale
    cam.keyframe_insert('location',frame=f);cam.keyframe_insert('rotation_euler',frame=f);cam.data.keyframe_insert('ortho_scale',frame=f)
    ui.scale=(scale/REF,)*3;ui.keyframe_insert('scale',frame=f)
def orbit(target,azimuth,elevation,distance):
    a=math.radians(azimuth);e=math.radians(elevation)
    return Vector(target)+Vector((math.cos(a)*math.cos(e),math.sin(a)*math.cos(e),math.sin(e)))*distance
for f in range(1,s.frame_end+1):
    t=(f-1)/FPS
    root.location=(0,0,0)
    # Mechanical steps, kept distinct on screen.
    slider_x=-5*ease(t,6.35,7.55)+5*ease(t,17.05,17.75)
    angle=-math.radians(30)*ease(t,8.25,9.65)+math.radians(30)*ease(t,16.1,16.95)
    po=Vector((70*ease(t,10.2,11.65),95*ease(t,12.0,12.85),0))
    vo=mix((8,82,0),(70,0,0),ease(t,12.75,13.8));vo.x-=70*ease(t,14.2,15.75)
    if t>=22:po=Vector((0,0,0));vo=Vector((8,82,0));slider_x=0;angle=0
    if t<6:vo=Vector((8,82,0))
    loc(pressure,po,f);loc(vibe,vo,f);rot(collar,angle,f);loc(slider,(slider_x,0,0),f)
    pressure_visible=t<12.9 or t>=22
    for ob in pressure_parts:show(ob,pressure_visible,f)
    for ob in vibe_parts:show(ob,t<6 or 12.75<=t<22 or t>=39,f)
    cartridge_angle=math.radians(30)*ease(t,25.25,26.7)
    old_x=26*ease(t,27.2,28.35)
    loc(old,(old_x,0,40*ease(t,28.5,29)),f);rot(old,cartridge_angle,f)
    new_x=26*(1-ease(t,29.75,30.85));new_angle=math.radians(30)*(1-ease(t,31.25,32.7))
    loc(new,(new_x,0,-40*(1-ease(t,29,29.65))),f);rot(new,new_angle,f)
    for ob in old_parts:show(ob,pressure_visible and t<29,f)
    for ob in new_parts:show(ob,t>=29 and not (ob.name.startswith('Replacement REF_Exposed') and 33<=t<39),f)
    # Schematic pressure compression and recovery.
    shorten=3*ease(t,34.0,35.4)*(1-ease(t,37.0,38.3))
    loc(root,(shorten,0,0),f);show(test,33<=t<39,f);show(flex,33<=t<39,f)
    if 33<=t<39:
        amp=amplitude(shorten)
        for j,p in enumerate(spline.points):
            u=j/N;p.co=(186.4+(38-shorten)*u,0,amp*math.sin(math.pi*u)**2,1);p.keyframe_insert('co',frame=f)
    for j,ob in enumerate(rings):
        show(ob,18<=t<22,f);q=1+.10*math.sin((t-18)*math.tau/1.8-j*.65);ob.scale=(1,q,q);ob.keyframe_insert('scale',frame=f)
    for ob in screen_text:show(ob,t<6 or 22<=t<25 or t>=39,f)
    # Camera cuts plus true orbits. Close-ups deliberately leave the handle out of frame.
    if t<6:
        target=(111,18,5);pos=orbit(target,-65+25*ease(t,0,6),31,480);scale=342
    elif t<10:
        target=(147,0,14);pos=orbit(target,-65+9*ease(t,6,10),42,360);scale=178
    elif t<12:
        target=(180,0,0);pos=orbit(target,-64,31,390);scale=240
    elif t<16:
        target=(186,0,0);pos=orbit(target,-70,40,420);scale=287
    elif t<18:
        target=(153,0,3);pos=orbit(target,-55,37,360);scale=153
    elif t<22:
        target=(159,0,0);pos=orbit(target,-55+28*ease(t,18,22),28,360);scale=173
    elif t<25:
        target=(48,0,10);pos=orbit(target,-80+17*ease(t,22,25),64,340);scale=149
    elif t<33:
        target=(199,0,0);pos=orbit(target,-61+7*ease(t,25,33),28,350);scale=141
    elif t<39:
        target=(199,0,0);pos=orbit(target,-83,24,350);scale=127
    else:
        target=(111,25,5);pos=orbit(target,38+32*ease(t,39,44),45,480);scale=425
    camera(pos,target,scale,f)
    for ci,(a,b,*_) in enumerate(chapters):
        for ob in chapter_obs[ci]:show(ob,a<=t<b,f)
# Linear interpolation between dense samples avoids overshoot or accidental motion at cuts.
for action in bpy.data.actions:
    for layer in action.layers:
        for strip in layer.strips:
            if strip.type=='KEYFRAME':
                for bag in strip.channelbags:
                    for fc in bag.fcurves:
                        for k in fc.keyframe_points:k.interpolation='LINEAR'
for a,b,kicker,title,*_ in chapters:s.timeline_markers.new(title,frame=round(a*FPS)+1)
s.frame_set(1)
note=bpy.data.texts.new('ANIMATION README');note.write('44-second silent captioned CAD walkthrough at 24 fps. Actual R04 mesh geometry animates the head and cartridge exchanges. Vibration waves and constant-length filament bow are schematic only, not physical simulation. No force, frequency, hygiene or electrical validation implied. Screen graphics are illustrative. Camera angles and source dimensions remain editable.\n')
bpy.ops.file.pack_all()
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Animation.blend'))
(VID/'storyboard.json').write_text(json.dumps({'fps':FPS,'duration_seconds':DURATION,'resolution':[W,H],'chapters':[{'start':a,'end':b,'chapter':k,'title':ti,'caption':c,'detail':d} for a,b,k,ti,c,d in chapters]},indent=2))
args=sys.argv[sys.argv.index('--')+1:] if '--' in sys.argv else []
if '--preview' in args:
    for t in [1,7.6,9.6,11.8,13.9,17.8,20,23.5,28.3,30,35.7,41]:
        s.frame_set(round(t*FPS)+1);s.render.filepath=str(VID/f'preview_{t:04.1f}.png');bpy.ops.render.render(write_still=True)
if '--render' in args:
    frames=VID/'frames';frames.mkdir(exist_ok=True)
    s.render.filepath=str(frames/'frame_');bpy.ops.render.render(animation=True)
print('ANIMATION_READY',flush=True)
