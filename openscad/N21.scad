holes=6;
diameter=15;
radius=20;
faces=40;

difference(){
import("../stl/N21.stl", convexity=3);
for(i=[0:1:holes-1])
{
    rotate([0,0,i*360/holes])
    translate([radius,0,-1])
    cylinder(d=diameter,h=100,$fn=faces);
}
}
