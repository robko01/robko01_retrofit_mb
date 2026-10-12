"""Build a simplified 5x20 mm fuse and Bel FC-203-style clips for visualization.

Original repository asset, released under CC0-1.0. Dimensions describe a visual
envelope, not manufacturer CAD. Coordinates use mm before VRML unit conversion.
"""
from pathlib import Path
from math import sin, cos, pi

parts = []
def shape(geometry, color, transparency=0):
    return f'Shape {{ appearance Appearance {{ material Material {{ diffuseColor {color} ambientIntensity 0.3 specularColor 0.3 0.3 0.3 shininess 0.4 transparency {transparency} }} }} geometry {geometry} }}'
def mesh(points,faces):
    coords=', '.join(' '.join(f'{v/2.54:.5f}' for v in p) for p in points)
    indices=', '.join(' '.join(map(str,f))+' -1' for f in faces)
    return f'IndexedFaceSet {{ solid FALSE coord Coordinate {{ point [ {coords} ] }} coordIndex [ {indices} ] }}'
def box(x,y,z,sx,sy,sz,color):
    points=[(x+a*sx/2,y+b*sy/2,z+c*sz/2) for a,b,c in [(-1,-1,-1),(1,-1,-1),(1,1,-1),(-1,1,-1),(-1,-1,1),(1,-1,1),(1,1,1),(-1,1,1)]]
    faces=[(0,3,2,1),(4,5,6,7),(0,1,5,4),(1,2,6,5),(2,3,7,6),(3,0,4,7)]
    parts.append(shape(mesh(points,faces),color))
def cylinder(x,length,radius,color,transparency=0):
    steps=48
    points=[(xx,-2.5+radius*cos(2*pi*i/steps),5+radius*sin(2*pi*i/steps)) for xx in (x-length/2,x+length/2) for i in range(steps)]
    faces=[(i,(i+1)%steps,(i+1)%steps+steps,i+steps) for i in range(steps)]
    faces.extend([tuple(reversed(range(steps))),tuple(range(steps,2*steps))])
    parts.append(shape(mesh(points,faces),color,transparency))
cylinder(8.9,14,2.5,'0.72 0.86 0.90',.55)
for x in (.4,17.4):cylinder(x,3,2.5,'0.70 0.72 0.74')
cylinder(8.9,17,.10,'0.30 0.30 0.30')
for x in (0,17.8):
    points=[]; faces=[]; steps=32
    for i in range(steps+1):
        a=(135+270*i/steps)*pi/180
        for xx,r in [(x-1.5,2.7),(x+1.5,2.7),(x-1.5,2.5),(x+1.5,2.5)]:
            points.append((xx,-2.5+r*cos(a),5+r*sin(a)))
    for i in range(steps):
        j=i*4;k=j+4
        faces.extend([(j,j+1,k+1,k),(j+2,k+2,k+3,j+3),(j,k,k+2,j+2),(j+1,j+3,k+3,k+1)])
    faces.extend([(0,2,3,1),(steps*4,steps*4+1,steps*4+3,steps*4+2)])
    parts.append(shape(mesh(points,faces),'0.65 0.67 0.70'))
    box(x,-2.5,1.15,3,5.4,.3,'0.65 0.67 0.70')
    for y in (0,-5):box(x,y,-.5,.65,.65,3.5,'0.65 0.67 0.70')
target=Path(__file__).with_name('Fuse_5x20_Bel_FC203_approx.wrl')
target.write_text('#VRML V2.0 utf8\n# CC0-1.0; simplified visual model; see build-fuse-model.py\nGroup { children [\n'+'\n'.join(parts)+'\n] }\n')
