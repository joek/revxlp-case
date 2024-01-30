
plate_thickness = 2;
pcb_wiggle_room= 0.25;

pcb_thickness = 1.6;
solder_nut_height = 2;
pcb_to_switch_plate_gap = 1;
switch_plate_thickness = 1.2;
height_buffer = 0.0;
c_steps = 0.1;
chambfer = 0.4;

wall_h = pcb_thickness * 2 
       + solder_nut_height
       + pcb_to_switch_plate_gap 
       + switch_plate_thickness 
       + height_buffer;

module Holes () {

    
    for(i = [0:0.1:1.5]) {
        translate([0,0, i])  {
            linear_extrude(0.1){
                offset(-i)  import("./revxlp_bottom-User_Comments.svg");
            }
        }
    }
    translate([0,0, 1.5])  {
        linear_extrude(pcb_thickness){
            offset(-1.5)  import("./revxlp_bottom-User_Comments.svg");
        }
    }
    
}

module Baseplate () {
    import("./revxlp_bottom-Edge_Cuts.dxf");
}

module Outline () {
    offset(r=pcb_wiggle_room + plate_thickness){
        Baseplate();
    }
}

module Inline () { 
    offset(r=pcb_wiggle_room){
        Baseplate();
    }
}

module Base () {
    difference(){
      Outline ();
      Inline ();
    }
}

module Button(){
    rotate([-90,0,0]){
        translate([94.2,-(2.5 + plate_thickness), -30]) {
            union(){
                cylinder(h = 10, r = 1, center = false, $fn = 20);
                translate([0,-0.6,0]) cube(6, center = true);
            }
            
        }
    }
}

module Switch(){
    rotate([-90,0,0]){
        translate([211.6,-(2.5 + plate_thickness), -28.7]) {
            union(){
                hull() {
                    translate([     2.5,0,0]) cylinder(h = 10, r = 1.5, center = false, $fn = 30);
                    translate([     -2.5,0,0]) cylinder(h = 10, r = 1.5, center = false, $fn = 30);
                }
                hull(){
                    translate([5,0,0]) cylinder(h = 1, r = 2.5, $fn =  30);    
                    translate([-5,0,0]) cylinder(h = 1, r = 2.5, $fn = 30);
                }
            }     
        }
    }
}

module Enclosure(){
    difference() {
        union(){
            translate([0, 0, chambfer]){
                linear_extrude(plate_thickness - chambfer){
                    Outline();
                }
            }
            
            for(i = [0:c_steps:chambfer]) {
                translate([0,0, chambfer - i])  {
                    linear_extrude(c_steps){
                        offset(-i)  Outline();
                    }
                }
            }
            
            translate([0,0,plate_thickness]){
                linear_extrude(wall_h) {
                    Base();
                }
            }

            for(i = [0:c_steps:chambfer]) {
                translate([0,0,plate_thickness + wall_h + i])  {
                    linear_extrude(c_steps){
                        offset(-i)  Base();
                    }
                }
            }
        }
        Holes();
        Button();
        Switch();
    }
}

//translate([0,-210,0]){import("./revxlp-User_1.svg");}


Enclosure();
