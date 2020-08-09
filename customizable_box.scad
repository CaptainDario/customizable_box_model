


/* [box dimensions] */
//inner box length
iB_width = 30;
//inner box depth
iB_depth  = 30;
//inner box height
iB_height = 15;
//wall thickness
wall_thickness = 2;

/* [lid dimensions] */
//the height of the lid
lid_height = 3;

/* [Connections] */
//add a barrel jack to the left side (-x)
barrel_jack_left = false;
//add a barrel jack to the right side (+x)
barrel_jack_right = false;
//add a barrel jack to the top side (-z)
barrel_jack_top = false;
//add a barrel jack to the bottom side (z)
barrel_jack_bottom = false;
//add a barrel jack to the back side (-y)
barrel_jack_back = false;
//add a barrel jack to the front side (y)
barrel_jack_front = false;

/* [Render Options] */
//show the lid
show_lid = false;
//show the box
show_box = true;

/* [Hidden] */
//DIMENSIONS
//barrel_jack
barrel_jack_d = 8;

//margin for the overlaps so that the preview gets right
preview_margin = 0.001;
//resolution
$fn = 100;


module box(){
    difference(){
        //outher shell
        cube([iB_width + 2*wall_thickness, iB_depth + 2*wall_thickness, iB_height + wall_thickness]);
        //remove inside
        translate([wall_thickness, wall_thickness, wall_thickness + preview_margin]){
            cube([iB_width, iB_depth, iB_height]);
        }

        //connections
        //add barrel jack-hole(s)
        if(barrel_jack_left){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_right){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_bottom){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_back){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_front){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
    }
}

module lid(){
    union(){
        //outher shell
        cube([iB_width + 2*wall_thickness, iB_depth + 2*wall_thickness, lid_height/2]);
        //add longer part
        translate([wall_thickness, wall_thickness, wall_thickness + preview_margin]){
            cube([iB_width, iB_depth, lid_height/2]);
        }
    }
}

module main(){
    if(show_lid){
        lid();
    }
    if(show_box){
        box();
    }
}

main();