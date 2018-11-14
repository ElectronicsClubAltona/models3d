/*
   Keyrings for Millie's 8th Birthday.
   
   License: CC-0 No Rights Reserved
   https://creativecommons.org/share-your-work/public-domain/cc0/
*/

module cloud(x) {
        
    difference() {

        union () {    
            linear_extrude(2) offset(r=x*3) children();
            linear_extrude(3) offset(r=-x) offset(r=x*3) children();
            color([1,1,0]) linear_extrude(4) offset(r=-x*2) offset(r=x*3) children();
        }
        translate([0,0,2]) linear_extrude(10) children();
    }
}

module keyring(kx, ky) {
   difference() {
      union() {
          color([1,0,0]) translate([kx,ky,0]) cylinder(h=4,d=10);
          children();
      }
      translate([kx,ky,-1]) cylinder(h=6,d=5, $fn=16);
   }
}

module present(name, ox, oy, kx, ky) {
    translate([ox,oy,0]) {
        keyring(kx, ky) {
            cloud(1.75) {
                text(name, size=12, font="URW Chancery L", valign="center");
            }
        }
    }
}
        


module keyrings1() {
present("Benjamin", 5, 10, -4, 0);
present("Charlotte", 5, 35, -4, 0);
present("Allanah", 5, 59, -3, 1);

present("Willow", 5, 83, -4, 0);
present("Shelby", 10, 106, -4, 0);
present("Elise", 63, 105, -4, -1);
present("Mya", 67, 50, -4, 0);
present("Amy", 65, 78, -3, 3);
present("Zac", 72, 24, -2, 2);
}
    
module keyrings2() {
present("Amelia", 5, 10, -3, 1);
present("Charlie", 5, 32, -4, 0);
present("Bianca", 5, 55, -4, 0);
present("Amber", 5, 77, -3, 0);
present("Isobel", 5, 100, -2, 0);
present("Dylan", 59, 20, -4, 0);
present("Caleb", 60, 45, -4, 0);
present("Chloe", 58, 70, -4, 0);
present("Kitty", 55, 96, -3, 0);
}

module keyrings3() {
present("Felix", 5, 10, -3, -1);
present("Betty", 5, 35, -4, 0);
present("April", 5, 62, -3, 1);
present("Rhonda", 5, 90, -3, 1);

}
keyrings3();
