w = 60; // backplate width = w+t
k = 60;
h = 80;  // backplate height
t = 15;
d = 65;
x = 20;
$fn = 50;

// actual clearance width is w-t

module cylisphere(d) {
    translate([0,0,-d/2]) cylinder(d=d, h=d/2);
    sphere(d=d);
}

//#translate([0,0,d/2]) cube([w-t,d-t,w],center=true);

//#translate([0,0,t+17.5]) cube([45,10,35], center=true);
difference() {
    union() {
        hull() {
            translate([-w/2,-h/2,t/2]) cylisphere(d=t);
            translate([+w/2,-h/2,t/2]) cylisphere(d=t);
            translate([-w/2,+h/2,t/2]) cylisphere(d=t);
            translate([+w/2,+h/2,t/2]) cylisphere(d=t);
        }
        /*hull() {
            translate([-w/2,0,t/2]) cylisphere(d=t);
            translate([+w/2,0,t/2]) cylisphere(d=t);
            translate([-w/2,0,t*1.5]) cylisphere(d=t);
            translate([+w/2,0,t*1.5]) cylisphere(d=t);
            translate([-w/2,t,t/2]) cylisphere(d=t);
            translate([+w/2,t,t/2]) cylisphere(d=t);
        }*/
        
        for (z = [-1,1]) {
            hull() {
                translate([w*z/2,0,t/2]) sphere(d=t);
                translate([k*z/2,0,t/2]) sphere(d=t);
                translate([w*z/2,0,d]) sphere(d=t);
                translate([k*z/2,0,d]) sphere(d=t);
                translate([w*z/2,h/2,t/2]) sphere(d=t);
                translate([k*z/2,h/2,t/2]) sphere(d=t);
                
            }
            hull() {
                translate([w*z/2,0,d]) sphere(d=t);
                translate([k*z/2,0,d]) sphere(d=t);
                translate([w*z/2,0,d-x/2]) sphere(d=t);
                translate([k*z/2,0,d-x/2]) sphere(d=t);
                translate([w*z/2,-x,d]) sphere(d=t);
                translate([k*z/2,-x,d]) sphere(d=t);
            }
        }
    }
    translate([0,0,-t]) cube([w*4,h*4,t*2], center=true);
    for (y=[-1,1]) {
        translate([0,y*h*3/8,0]) {
            cylinder(d=16,h=1.5);
            cylinder(d=4,h=t);
            translate([0,0,t-5]) cylinder(d1=4,d2=10,h=3);
            translate([0,0,t-2]) cylinder(d=10,h=3);
        }
    }
}
        