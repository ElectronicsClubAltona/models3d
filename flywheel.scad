use <MCAD/involute_gears.scad>
use <MCAD/shapes.scad>

$fn=100;

difference() {
    union() {
        cylinder(d=15, h=22);
        cylinder(d=20, h=11);
    }
    translate([0,0,10]) gear(
        number_of_teeth=9,
        circular_pitch=142,
        bore_diameter= 0,
        gear_thickness = 13,
        rim_thickness = 13
    );
}

//translate([0,0,5]) hexagon(25, 10);

nh = 15;

difference() {
    cylinder(d=120,h=30);
    cylinder(d=10,h=30);
    translate([0,0,10]) cylinder(d=76,h=30);
    for (i = [0:4]) {
        rotate([0,0,i*360/5]) translate([24,0,-1]) cylinder(d=26,h=12);
    }
    for (i = [0:1:nh]) {
        rotate([0,0,i*360/nh]) translate([49,0,6]) union() {
            cylinder(d=18.5, h=30);
            sphere(d=18.5);
        }
    }
}