center=true;

/*
 * Rotation disk base
 */
radius=50;
hole_radius=3;


difference() {
cylinder(2, radius, radius, center);

translate([-20,-20, 0]) cylinder(2+3, 3, 3, center);
translate([20,20,0]) cylinder(2+3, 3, 3, center);
translate([-20,20,0]) cylinder(2+3, 3, 3, center);
translate([20,-20,0]) cylinder(2+3, 3, 3, center);
}
/*
 * Bridges
 */
width=radius*2;
depth=2;
height=20;

translate([0,0,10])
cube([width, depth, height], center);

rotate([0,0,90]) 
translate([0,0,10])
cube([width, depth, height], center);

/*
 * Mount for the top part
 */
color([0.75, 1, 0.5, 1]) union() {

    translate([0,0,-4])  cylinder(4, 20, 20);
    

    translate([0,0,-20]) rotate([0, 0, 90]) cube([30, 2, 35], true);
    
    offsetZ_Arc=25;

    rotate([0, 90, 0]) translate([offsetZ_Arc,0,-1]) cylinder(2, 20, 20);
}

/* 
 * Vertical axis motor
 */
motor_cl=[0.4,0.1,0.1,0.4];
color(motor_cl) translate([30, 0, -25]) cube([25, 17, 15], center);

// shaft
shaft_cl=[0,0,0.7,0.7];
color(shaft_cl) rotate([90, 180, 90]) translate([0,26,-20]) cylinder(40, 1.55, 1.5);

/*
 * Vertical motor mount
 */

/*
 * CONTEXT
 */
scalar_outter=1.7;
scalar_inner=scalar_outter*0.95;
/*
 * Base holder
 */ 

% translate([0,0,-110]) cylinder(10, radius*scalar_outter, radius*scalar_outter);

/* 
 * Enclosing case
 */


% difference() {
    translate([0,0,-110]) cylinder(100, radius*scalar_outter, radius*scalar_outter);
    
    translate([0,0,-111]) cylinder(102, scalar_inner, scalar_inner);
}


% difference() {
    bring_lower=40;
    offz=(radius/2)-bring_lower;
    translate([0,0,offz]) sphere(radius*scalar_outter);
    
    // inner space
    translate([0,0,offz]) sphere(radius*scalar_inner);

    a=radius*2*1.5;
    translate([0,0,(-a/2/1.5)-bring_lower]) cube([a,a,a], center);
}