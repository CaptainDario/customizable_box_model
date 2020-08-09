


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

/* [Left] */
//add a barrel jack to the left side (-x)
barrel_jack_left = false;
//add a cable hole to the left side (-x)
square_left = false;
//the size of the square
square_left_size = [10, 10];
//the text which should be written on the left side
text_left = "";
//should the text be extruded in intruded
text_left_in_or_out = "in"; //[ex:extrude, in:intrude]
text_left_size = 10;
text_left_font = "";
text_left_spacing = 1; //[0:0.1:100]

/* [Right] */
//add a barrel jack to the right side (+x)
barrel_jack_right = false;
//add a cable hole to the right side (+x)
square_right = false;
//the size of the square
square_right_size = [10, 10];

/* [Top] */
//add a barrel jack to the top side (-z)
barrel_jack_top = false;
//add a cable hole to the top side (-z)
square_top = false;
//the size of the square
square_top_size = [10, 10];

/* [Bottom] */
//add a barrel jack to the bottom side (+z)
barrel_jack_bottom = false;
//add a cable hole to the bottom side (+z)
square_bottom = false;
//the size of the square
square_bottom_size = [10, 10];

/* [Front] */
//add a barrel jack to the front side (+y)
barrel_jack_front = false;
//add a cable hole to the front side (+y)
square_front = false;
//the size of the square
square_front_size = [10, 10];

/* [Back] */
//add a barrel jack to the back side (-y)
barrel_jack_back = false;
//add a cable hole to the back side (-y)
square_back = false;
//the size of the square
square_back_size = [10, 10];



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
            translate([wall_thickness*3/2 + iB_width, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([0, 90, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_bottom){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, wall_thickness/2]){
                rotate([0, 0, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_back){
            translate([wall_thickness + iB_width/2, wall_thickness/2, wall_thickness + iB_height/2]){
                rotate([90, 0, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        if(barrel_jack_front){
            translate([wall_thickness + iB_width/2, wall_thickness*3/2 + iB_depth, wall_thickness + iB_height/2]){
                rotate([90, 0, 0]){
                    cylinder(d=barrel_jack_d, h=wall_thickness+4*preview_margin, center=true);
                }
            }
        }
        //add cable holes 
        if(square_left){
            translate([wall_thickness/2, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                cube(concat(wall_thickness+4*preview_margin, square_left_size), center=true);
            }
        }
        if(square_right){
            translate([wall_thickness*3/2 + iB_width, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                cube(concat(wall_thickness+4*preview_margin, square_right_size), center=true);
            }
        }
        if(square_bottom){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, wall_thickness/2]){
                cube(concat(square_bottom_size, wall_thickness+4*preview_margin), center=true);
            }
        }
        if(square_back){
            translate([wall_thickness + iB_width/2, wall_thickness/2, wall_thickness + iB_height/2]){
                cube([square_back_size[0], wall_thickness+4*preview_margin, square_back_size[1]], center=true);
            }
        }
        if(square_front){
            translate([wall_thickness + iB_width/2, wall_thickness*3/2 + iB_depth, wall_thickness + iB_height/2]){
                cube([square_front_size[0], wall_thickness+4*preview_margin, square_front_size[1]], center=true);
            }
        }

        //TEXT (intrusion)
        //left
        if(text_left != "" && text_left_in_or_out == "in"){
            translate([wall_thickness/2-preview_margin, wall_thickness+iB_depth/2, wall_thickness+iB_height/2]){
                rotate([90, 0, -90]){
                    linear_extrude(wall_thickness/2){
                        text(text=text_left, size=text_left_size, font=text_left_font, spacing=text_left_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
    }
}

module lid(){
    difference(){
        union(){
            //outher shell
            cube([iB_width + 2*wall_thickness, iB_depth + 2*wall_thickness, lid_height/2]);
            //add longer part
            translate([wall_thickness, wall_thickness, lid_height/2 + preview_margin]){
                cube([iB_width, iB_depth, lid_height/2]);
            }
        }

        //connections
        //barrel jack
        if(barrel_jack_top){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, lid_height/2]){
                rotate([0, 0, 0]){
                    cylinder(d=barrel_jack_d, h=lid_height+4*preview_margin, center=true);
                }
            }
        }
        //cables
        if(square_top){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, lid_height/2]){
                cube(concat(square_top_size, lid_height+4*preview_margin), center=true);
            }
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