union(){
difference(){
    import("N17.stl",convexity=3, center=true);
    cylinder(22,r=24.5,$fn=100, center=true);

}
intersection(){
translate([1.4,0.5,0])import("greg3.stl",convexity=10);
//intersection()
//{
//    translate([25,0,0]) intersection()
//    {
//    import("WadeHerringboneGears.stl",convexity=100,center=true);
//    translate([-70,-40,0]) cube([80,80,4]);
//    }
//    cylinder(5,r=25,$fn=100);
//}
    cylinder(5,r=25,$fn=100);

}
difference(){
    cylinder(10,d=16,$fn=100);
    translate([0,0,-1])cylinder(12,d=9,$fn=100);
}
}
