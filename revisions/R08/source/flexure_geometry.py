"""Replaceable planar cassette. Millimetres. Deformation is kinematic, not FEA."""
import math
import FreeCAD as App
import Part
V = App.Vector
SPAN = 24.0
FIXED_Y = -20.6
MOVING_Y = 3.4
HEIGHT = 2.4
BOTTOM = -11.0
ROOT_RADIUS = .6
FIXED_HOLES = [(185.5, -21.6), (222.5, -21.6)]
MOVING_HOLES = [(188., 7.4), (215., 7.4)]

def cassette(width=.8):
    def box(x,y,dx,dy):
        return Part.makeBox(dx,dy,HEIGHT,V(x,y,BOTTOM))
    pieces = [box(182.5,-24.0,43,3.4), box(184,3.4,36,8)]
    pieces += [box(x-3,-24.0,6,5.4) for x,y in FIXED_HOLES]
    pieces += [box(x,-20.7,width,24.2) for x in (190,217)]
    s=pieces[0].multiFuse(pieces[1:]).removeSplitter()
    # Round the eight re-entrant beam roots in the plane of bending.
    roots=[]
    for e in s.Edges:
        b=e.BoundBox
        if abs(b.ZLength-HEIGHT)<1e-6 and b.XLength<1e-6 and b.YLength<1e-6:
            if any(abs(b.XMin-x)<1e-6 for x in (190,190+width,217,217+width)) and any(abs(b.YMin-y)<1e-6 for y in (FIXED_Y,MOVING_Y)):
                roots.append(e)
    assert len(roots)==8
    s=s.makeFillet(ROOT_RADIUS,roots)
    for x,y in FIXED_HOLES+MOVING_HOLES:
        s=s.cut(Part.makeCylinder(1.2,HEIGHT+2,V(x,y,BOTTOM-1)))
    return s.removeSplitter()

def side_shift(d):
    return -.6*d*d/SPAN

def deformed_cassette(d, width=.8):
    """Sample actual filleted outline; preserve rail holes and fixed/moving ends.
    Smooth prescribed shape used only for clearance. No force/stress prediction.
    """
    rest=cassette(width)
    if abs(d)<1e-10:return rest
    top=[f for f in rest.Faces if abs(f.BoundBox.ZMin-BOTTOM)<1e-6 and f.BoundBox.ZLength<1e-6][0]
    vertices=top.OuterWire.discretize(Deflection=.005)
    pts=[]
    for p in vertices:
        t=max(0.,min(1.,(p.y-FIXED_Y)/SPAN))
        pts.append(V(p.x-d*(3*t*t-2*t*t*t),p.y+side_shift(d)*t,BOTTOM))
    if (pts[-1]-pts[0]).Length>1e-8:pts.append(pts[0])
    s=Part.Face(Part.makePolygon(pts)).extrude(V(0,0,HEIGHT))
    for x,y in FIXED_HOLES:
        s=s.cut(Part.makeCylinder(1.2,HEIGHT+2,V(x,y,BOTTOM-1)))
    for x,y in MOVING_HOLES:
        s=s.cut(Part.makeCylinder(1.2,HEIGHT+2,V(x-d,y+side_shift(d),BOTTOM-1)))
    assert s.isValid() and len(s.Solids)==1
    return s
