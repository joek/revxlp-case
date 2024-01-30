//*******************************************************************************************************
//
//    Universal parametic rugged Box
//
//  2023 by Rainer Backes
//
//   based on ideas of yanew and Whity
//
//*******************************************************************************************************


/* [View] */
// Select View
View="Complete Open";  // [Complete, Complete Open, Parts, Lid, Bottom, Latch, Seal ]
// Open Angle for complete Open
ViewAngle = 120; //[0:180]

/* [General] */

// Depth of Inner Box (available space)
InnerBoxDepth = 25;
// Width of Inner Box (available space)
InnerBoxWidth= 57;
// Hight of bottom part of Inner Box (available space) >= 16
InnerBoxBottomHeight = 80;
// Hight of top part of Inner Box (available space)
InnerBoxLidHeight=10;
// Cornet Radius of Inner Box (vertical)
InnerCornerRadius=3;
// Chamfer of inner Box (horizontal)
InnerChamferSize=1.5;

// Length of Screw
ScrewLength=20;
// Diameter of Screw
ScrewDiameter=3;
// Tolerance for Latch holes
ScrewTol = 0.4;

ScrewThreadDiameter=ScrewDiameter-0.15;
// Wall Thickness 
WallThickness=2.4;
// Number of Hinges(1-3)
NumHinge=1;
// Number of Latches (1-3)
NumLatch=1;
// Additional Height for TPU-Seal
TSealHeight = 1;
// Apply Interior to Lid
InteriorToLid=true;




/* [Hinges] */
// Offset of Hinge and Latchs to inner side corner
HingeLatchOffset = 12;

HingeWidthTolerance=0.25;

// With of Front and Back Ribs
HingeLatchRibWidth=3.2;

HingeOuterDiameter=6.8;
HingeOuterExtend=2;
HingeBottomLength=HingeLatchRibWidth+HingeOuterExtend;
HingeLidLength=ScrewLength-2*HingeBottomLength-HingeWidthTolerance;

/* [Side Ribs] */
// Number of Side rib Pairs
NumRibs=2;
// if more than 1 Side Rib Pair, distance of Ribs to the inner corner
RibOffset=18;
// Width of Ribs
RibWidth=3;
// Distance between Ribs
RibDist=20;


/* [Latches] */
// Distance of the screws making the Latch
LatchDistance=16;
// Latch Displacement downwards
LatchDisplacement = 4;

LatchWidthTolerance=0.4;
BoxLatchRibChamfer=17;
LidLatchRibChamfer=10;


// Latch: Radius of the rounding
LatchRoundRad= 15;
// Latch Wall thickness
LatchWall=3;
// Length of the Latch Handle
LatchHandleLen= 11;
// Ofset of Handle from vertical
LatchHandleOfs=4;


/* [Seal] */
// Height of Seal
SealHeight=1.4;
// Height of Lid protion, if TPUSeal > 0
TSealLid = 0.5;
// Tolerance for the TPU-Seal ( 1 layer )
TSealTol = 0.2;

SealWall=WallThickness/2;
// Additional wall tickness of box for seal
SealThick=1.9;
// Toleance
SealTol=0.2;
// Chanfer Angle for Seal-Support
SealCAng=70;
// Heigth of Seal support
SealBHeigh=8;

/* [Interior] */
// default Width of interior Walls
iWall = 1;


// Interior definition, everything here get masked an added to the interior of bottom and optional lid
module Interior (){
//	wwall(40,0,100,50);
//	dwall(0,30,100,90);

}

// evertything here gets substracted (difference() ) from the lid
module liddiff () {

}

// evertything here gets added to the lid
module lidadd () {

}

// evertything here gets substracted (difference() ) from the bottom
module bottomdiff () {
}

// evertything here gets added to the bottom

module bottomadd () {

}

include <rugbox.scad>