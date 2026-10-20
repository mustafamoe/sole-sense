"""Check the saved animation's mechanical poses; does not validate physical operation."""
import bpy, math, json
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
bpy.ops.wm.open_mainfile(filepath=str(OUT/'cad/SoleSense_R04_Animation.blend'))
s=bpy.context.scene;checks=[]
def record(name,actual,expected,tolerance=.001):
    ok=abs(actual-expected)<=tolerance;checks.append({'check':name,'actual':actual,'expected':expected,'passed':ok});assert ok,name

def pose(t):s.frame_set(round(t*24)+1)
pose(7.6);record('Safety latch retracts 5 mm',bpy.data.objects['32_Collar_Safety_Slider'].location.x,-5)
pose(9.7);record('Collar unlock angle',math.degrees(bpy.data.objects['Turn collar only'].rotation_euler.x),-30)
record('Head stays stationary during unlock',bpy.data.objects['Pressure head'].location.x,0)
pose(11.8);record('Head withdrawal',bpy.data.objects['Pressure head'].location.x,70)
pose(13.9);record('Replacement head aligned for insertion',bpy.data.objects['Vibration head'].location.x,70)
record('Replacement head on joint axis',bpy.data.objects['Vibration head'].location.y,0)
pose(15.9);record('Vibration head fully seated',bpy.data.objects['Vibration head'].location.length,0)
pose(17.9);record('Collar relocked',bpy.data.objects['Turn collar only'].rotation_euler.x,0)
record('Safety latch returned',bpy.data.objects['32_Collar_Safety_Slider'].location.x,0)
pose(26.8);record('Cartridge unlock angle',math.degrees(bpy.data.objects['Original cartridge'].rotation_euler.x),30)
pose(28.4);record('Cartridge withdrawn',bpy.data.objects['Original cartridge'].location.x,26)
pose(30.9);record('Prepared cartridge fully seated',bpy.data.objects['Prepared replacement cartridge'].location.length,0)
pose(32.9);record('Prepared cartridge locked',bpy.data.objects['Prepared replacement cartridge'].rotation_euler.x,0)
pose(35.7);ob=bpy.data.objects['Filament flex - schematic'];pts=[p.co.xyz for p in ob.data.splines[0].points]
record('Schematic bow preserves reference length',sum((b-a).length for a,b in zip(pts,pts[1:])),38,.002)
record('Schematic filament tip touches test plane',(ob.matrix_world@pts[-1]).x,224.4,.002)
record('Animation duration in seconds',s.frame_end/s.render.fps,44)
(OUT/'video/animation_validation.json').write_text(json.dumps({'scope':'Animation transforms and reference geometry only; not a physical simulation or clinical validation.','checks':checks,'passed':all(c['passed'] for c in checks)},indent=2))
print('ANIMATION_VALIDATION_PASSED',len(checks))
