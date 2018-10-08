holes=6;
diameter=15;
radius=17;
faces=5;

difference(){
import("N17.stl", convexity=3);
for(i=[0:1:holes-1])
{
    rotate([0,0,i*360/holes])
    translate([radius,0,-1])
    cylinder(d=diameter,h=100,$fn=faces);
}
}
