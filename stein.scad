///////////////////////////////////////////////////////////////////////////////OpenSCAD/////////////////
/*//////////////////////////////////////////////////

date started:	6/13/2013
date finished:
modeler:			Patrick Conner
copyright:		N/A

*/


//////////////////////////////////////////////////////////////////////////////parameters////////////////////////////////////////////////////////////////////

use<coffee mug.scad>


//////////////////////////////////////////////////////////////////////////////renders///////////////////////////////////////////////////////////////////////

scale(1.75)
	mug();

translate([0,0,280])
	lid();


//////////////////////////////////////////////////////////////////////////////modules///////////////////////////////////////////////////////////////////////
module lid(){
	cylinder(10,105,105);
	
	translate([-110,-140,10])
		color([1,.2,.2,1])
		linear_extrude(height=10)
			import("doodle.dxf");
	translate([100,0,10])
		resize([140,30,50])
			import("mug_grip.stl");
	
}