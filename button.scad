difference(){
    union(){
        cylinder(h = 4, r = 1.25, $fn = 20);
        for(i = [0:0.1:0.3]) {
            translate([0,0, 4 + i])  {
                cylinder(h = 0.1, r = 1.25 - i * 2, $fn = 20);
            }
        }
        hull(){
            translate([4,0,0]) cylinder(h = 0.75, r = 2, $fn = 20);    
            translate([-4,0,0]) cylinder(h = 0.75, r = 2, $fn = 20);
        }
    }
    cube([1.5,1.5,6], center = true);  
}
