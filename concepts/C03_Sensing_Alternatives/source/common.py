"""Photo-based Kuuleyn beam integration study. Not dimensioned production CAD."""
import bpy, math, json, sys, shutil
from pathlib import Path
from mathutils import Vector
from bpy_extras.object_utils import world_to_camera_view

OUT=Path(__file__).resolve().parents[1]
R04=OUT.parents[1]/'revisions/R04'
W,H,FPS,DURATION=1440,900,24,16
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
s=bpy.context.scene;s.name='C03 - pressure sensing alternatives'
s.unit_settings.system='METRIC';s.unit_settings.scale_length=.001
s.render.engine='BLENDER_EEVEE';s.eevee.taa_render_samples=32
s.render.resolution_x=W;s.render.resolution_y=H;s.render.resolution_percentage=100
s.render.image_settings.file_format='PNG';s.render.image_settings.color_mode='RGB'
s.render.image_settings.compression=20;s.render.fps=FPS;s.frame_start=1;s.frame_end=FPS*DURATION
s.view_settings.view_transform='Standard';s.view_settings.look='None';s.world.color=(.55,.55,.55)

def mat(name,c,metal=0,emission=False):
 m=bpy.data.materials.new(name);m.diffuse_color=(*c,1);m.use_nodes=True
 bs=m.node_tree.nodes.get('Principled BSDF');bs.inputs['Base Color'].default_value=(*c,1)
 bs.inputs['Metallic'].default_value=metal;bs.inputs['Roughness'].default_value=.38
 if emission:
  bs.inputs['Emission Color'].default_value=(*c,1);bs.inputs['Emission Strength'].default_value=1
  bs.inputs['Base Color'].default_value=(0,0,0,1)
 return m
shellmat=mat('Warm grey shell',(.64,.72,.73));teal=mat('Existing locking collar',(.015,.32,.28),.15)
blue=mat('Rigid force-transfer bracket',(.035,.25,.53),.35);gold=mat('Replaceable cartridge',(.73,.35,.065),.25)
aluminium=mat('Kuuleyn machined aluminium',(.64,.67,.68),.65)
steel=mat('Mounting screws',(.15,.20,.23),.7);white=mat('White gauge protection',(.9,.9,.87))
pink=mat('Contact surface',(.71,.39,.32));fixedmat=mat('Fixed mounting boss',(.10,.26,.27),.2)
ink=mat('UI ink',(.015,.045,.065),emission=True);muted=mat('UI secondary',(.18,.25,.29),emission=True)
paper=mat('UI paper',(.96,.97,.96),emission=True);accent=mat('UI teal',(.01,.34,.27),emission=True)
amber=mat('UI gold',(.57,.24,.035),emission=True);blueink=mat('UI blue',(.015,.20,.43),emission=True)

def cube(name,loc,size,m=None,bevel=0):
 bpy.ops.mesh.primitive_cube_add(size=1,location=loc);o=bpy.context.object;o.name=name;o.dimensions=size
 bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
 if m:o.data.materials.append(m)
 if bevel:
  b=o.modifiers.new('Edge highlights','BEVEL');b.width=bevel;b.segments=3
 return o
def cyl(name,x,r,length,m=None):
 bpy.ops.mesh.primitive_cylinder_add(vertices=64,radius=r,depth=length,location=(x,0,0),rotation=(0,math.pi/2,0))
 o=bpy.context.object;o.name=name;bpy.ops.object.transform_apply(location=False,rotation=True,scale=True)
 if m:o.data.materials.append(m)
 return o
def boolean(o,cutter):
 bpy.context.view_layer.objects.active=o
 m=o.modifiers.new('Machining or section','BOOLEAN');m.operation='DIFFERENCE';m.solver='EXACT';m.object=cutter
 bpy.ops.object.modifier_apply(modifier=m.name);bpy.data.objects.remove(cutter,do_unlink=True)
def revolved(name,profile,m):
 verts=[];faces=[];N=96
 for x,r in profile:
  for i in range(N):
   a=math.tau*i/N;verts.append((x,r*math.cos(a),r*math.sin(a)))
 for k in range(len(profile)):
  kk=(k+1)%len(profile)
  for i in range(N):
   j=(i+1)%N;faces.append((k*N+i,k*N+j,kk*N+j,kk*N+i))
 me=bpy.data.meshes.new(name);me.from_pydata(verts,[],faces);me.update()
 o=bpy.data.objects.new(name,me);s.collection.objects.link(o);me.materials.append(m);return o
def ring(name,x,ro,ri,t,m):
 return revolved(name,[(x-t/2,ro),(x+t/2,ro),(x+t/2,ri),(x-t/2,ri)],m)
def curve(name,pts,r,m):
 cu=bpy.data.curves.new(name,'CURVE');cu.dimensions='3D';cu.resolution_u=16;cu.bevel_depth=r;cu.bevel_resolution=3
 sp=cu.splines.new('BEZIER');sp.bezier_points.add(len(pts)-1)
 for b,p in zip(sp.bezier_points,pts):b.co=p;b.handle_left_type='AUTO';b.handle_right_type='AUTO'
 o=bpy.data.objects.new(name,cu);s.collection.objects.link(o);cu.materials.append(m);return o

