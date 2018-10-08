holes=3;
diameter=40;
radius=30;
faces=40;

difference(){
import("../stl/N34.stl", convexity=3);
for(i=[0:1:holes-1])
{
    rotate([0,0,i*360/holes])
    translate([radius,0,-1])
    cylinder(d=diameter,h=100,$fn=faces);
}
}
