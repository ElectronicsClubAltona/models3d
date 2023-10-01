// Coronation Scepter, for Frozen The Musical.
// By Nick.

// i started making this parametric but it isn't, really.
$fn=100;
d1=50;
d2=26;

module body() {
    sphere(d=d1, $fn=250);
}

module star() {
    a=7; b=2; c=1; d=4; e=10;
    minkowski() {
    sphere(d=1, $fn=32);
    linear_extrude(1)
    polygon([
        [a,0],[b,c],[d,d],[c,b],
        [0,e],[-c,b],[-d,d],[-b,c],
        [-a,0],[-b,-c],[-d,-d],[-c,-b],
        [0,-e],[c,-b],[d,-d],[b,-c],
    ]);
    }
}

module stars() {
translate([0,0,25])
    for (a=[0:3]) rotate([0,0,a*90+45])
    for (j = [-30,+30]) 
    rotate([0,j,0]) translate([d1/2-1,0,0]) rotate([90,0,90]) scale(0.666) star();
}


module circles() {
// circles around rhinestones
    for (a=[0:3]) rotate([0,0,a*90]) translate([d1/2-4,0,25]) rotate([0,90,0]) rotate_extrude() translate([10,0,0]) circle(d=5);
    translate([0,0,25]) rotate_extrude($fn=100) translate([d1/2-2,0,0]) circle(d=5);
}

module cutouts() {
    // cutouts for 20mm rhinestones
    for (a=[0:3]) rotate([0,0,a*90])   translate([d1/2-3,0,25]) rotate([0,90,0]) cylinder(d=20.5,h=10);
}

module base() {
// cutout on base so it can get enough adhesion to print
translate([0,0,-d1/2-5]) cylinder(d=d1,h=10);
}

module beads() {
    // beads around the top
    for (a=[0:9]) rotate([0,0,a*360/10]) translate([0,d1/4.5,26]) sphere(d=10);

}

function stem_func(y) = y^2 * 16 + 5;

module stem() {
    rotate_extrude() polygon(concat(
        [ [ 0, 3 ] ],
        [ for (y=[3:31]) [ stem_func(y/16-1), y ] ],
        [ [ 0, 31 ] ],
    ));
}

difference() {
union() {
translate([0,0,41.5]) stem();
translate([0,0,22]) beads();

    circles();
stars();
    
translate([0,0,25]) sphere(d=50);
cylinder(h=25,d=30);
}
translate([0,0,-30]) cylinder(d=26,h=65);
translate([0,0,35]) cylinder(d1=26,d2=4,h=10);
cylinder(d=4,h=100);
cutouts();
}


// bottom end

translate([50,0,0]) {
difference() {
union() {
    circles();
stars();

    
translate([0,0,25]) sphere(d=50);
cylinder(h=25,d=30);
}
translate([0,0,-30]) cylinder(d=26,h=65);
translate([0,0,35]) cylinder(d1=26,d2=4,h=10);
cutouts();
//cube(200);
translate([0,0,50]) scale([1.4,1.4,10]) star();

}

}
