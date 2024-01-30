
AirpodWidth = 80;
AirpodHeight = 22;
AirpodDepth = 50;

braketWidth = 10;
braketHeight = 5;
boltDiameter = 3;

module AirPods(){
    braketOffset = braketWidth / 2;
    translate([0,(AirpodDepth/2 + braketOffset),0])  AirPodsBraket(AirpodWidth, braketWidth);
    translate([0,-(AirpodDepth/2 + braketOffset) ,0])  AirPodsBraket(AirpodWidth, braketWidth);
}

module AirPodsBraket(width, braketWidth){
    
    
    difference() {  
        cube([width, braketWidth, 5], center = true);
        translate([0, 0, braketHeight/2]) cube([width - 20, braketWidth, 5], center = true);
        translate([(width / 2 - 5), 0, 0]) cylinder(h = braketHeight*2, r=boltDiameter/2, center = true, $fn=100);
        translate([-(width / 2 - 5), 0, 0]) cylinder(h = braketHeight*2, r=boltDiameter/2, center = true, $fn=100);
    }
}

