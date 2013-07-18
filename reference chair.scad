//////////////////////////////////////////////////////////////////////////////////OpenSCAD//////////////////////////
/*////////////////////////////////////////////////////////

date started:	6/13/2013
date finished:
modeler:			Patrick Conner
copyright:		N/A

*/


/////////////////////////////////////////////////////////////////////////////////perameters///////////////////////////////////////////////////////////////////////////////////

log_radius=5;
chair_height=100;
log_number=4;


//////////////////////////////////////////////////////////////////////////////////renders/////////////////////////////////////////////////////////////////////////////////////

back_butt();

translate([log_radius*2*log_number,0,0])
	arm();

translate([-log_radius*2*log_number,0,0])
	arm(style="scallop");

echo();



//////////////////////////////////////////////////////////////////////////////////modules/////////////////////////////////////////////////////////////////////////////////////
module back_butt(){
	for(x=[-log_number:1:log_number]){
		translate([x*log_radius*2,0,-5])
			rotate([5,0,0])
				cylinder(chair_height-x*x*3,log_radius,log_radius);
		translate([x*log_radius*2,0,0])
			rotate([-90,0,0])
				cylinder(chair_height-x*x,log_radius,log_radius);
	}
}

module arm(style){
	translate([0,-sin(5)*chair_height-log_number*log_number+15,cos(5)*chair_height-log_number*log_number*3-5])
		difference(){
			rotate([-90,0,0])
				cylinder(chair_height-log_number*log_number+5,log_radius,log_radius);
			if(style=="scallop"){
				scallop();
			}
		}
		translate([0,chair_height-log_number*log_number,-5])
			rotate([5,0,0])
				cylinder(chair_height-log_number*log_number-25,log_radius,log_radius);
}

module scallop(){
	ymax=floor(chair_height-log_number*log_number+5);
	for(y=[0:5:ymax]){
		rotate([0,y*45,0])
			translate([0,y,5+log_radius/2])
				sphere(5);
	}
}

