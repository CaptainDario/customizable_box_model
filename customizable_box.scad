
text_intrusion = 1;

/* [box dimensions] */
//inner box length
iB_width = 40;
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
//air holes
holes_left         = false;
holes_left_d       = 2;
holes_left_rows    = 5;
holes_left_columns = 5;
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
//air holes
holes_right         = false;
holes_right_d       = 2;
holes_right_rows    = 5;
holes_right_columns = 5;
//the text which should be written on the right side
text_right = "";
text_right_size = 10;
text_right_font = "";
text_right_spacing = 1; //[0:0.1:100]

/* [Top] */
//add a barrel jack to the top side (-z)
barrel_jack_top = false;
//add a cable hole to the top side (-z)
square_top = false;
//the size of the square
square_top_size = [10, 10];
//air holes
holes_top         = false;
holes_top_d       = 2;
holes_top_rows    = 5;
holes_top_columns = 5;
//the text which should be written on the top side
text_top = "";
text_top_size = 10;
text_top_font = "";
text_top_spacing = 1; //[0:0.1:100]

/* [Bottom] */
//add a barrel jack to the bottom side (+z)
barrel_jack_bottom = false;
//add a cable hole to the bottom side (+z)
square_bottom = false;
//the size of the square
square_bottom_size = [10, 10];
//air holes
holes_bottom         = false;
holes_bottom_d       = 2;
holes_bottom_rows    = 5;
holes_bottom_columns = 5;
//the text which should be written on the bottom side
text_bottom = "";
text_bottom_size = 10;
text_bottom_font = "";
text_bottom_spacing = 1; //[0:0.1:100]

/* [Front] */
//add a barrel jack to the front side (+y)
barrel_jack_front = false;
//add a cable hole to the front side (+y)
square_front = false;
//the size of the square
square_front_size = [10, 10];
//air holes
holes_front         = false;
holes_front_d       = 2;
holes_front_rows    = 5;
holes_front_columns = 5;
//the text which should be written on the front side
text_front = "";
text_front_size = 10;
text_front_font = "";
text_front_spacing = 1; //[0:0.1:100]

/* [Back] */
//add a barrel jack to the back side (-y)
barrel_jack_back = false;
//add a cable hole to the back side (-y)
square_back = false;
//the size of the square
square_back_size = [10, 10];
//air holes
holes_back         = false;
holes_back_d       = 2;
holes_back_rows    = 5;
holes_back_columns = 5;
//the text which should be written on the back side
text_back = "";
text_back_size = 10;
text_back_font = "";
text_back_spacing = 1; //[0:0.1:100]



/* [Render Options] */
//show the lid
show_lid = false;
//show the box
show_box = true;
//resolution
$fn = 100;

/* [Hidden] */
//DIMENSIONS
//barrel_jack
barrel_jack_d = 8;

//margin for the overlaps so that the preview gets right
preview_margin = 0.01;


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

        //add air holes
        if(holes_left){
            translate([holes_left_d, wall_thickness, wall_thickness]) {
                rotate([0, -90, 0]){
                    #circles(d=holes_left_d, h=wall_thickness,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_depth, width=iB_height);
                }
            }
        }
        if(holes_right){
            translate([2*wall_thickness+iB_width, wall_thickness, wall_thickness]) {
                rotate([0, -90, 0]){
                    #circles(d=holes_left_d, h=wall_thickness,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_depth, width=iB_height);
                }
            }
        }
        if(holes_bottom){
            translate([wall_thickness, wall_thickness, 0]) {
                rotate([0, 0, 0]){
                    #circles(d=holes_left_d, h=wall_thickness,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_depth, width=iB_width);
                }
            }
        }
        if(holes_back){
            translate([wall_thickness, 0, wall_thickness]) {
                rotate([0, -90, -90]){
                    #circles(d=holes_left_d, h=wall_thickness,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_width, width=iB_height);
                }
            }
        }
        if(holes_front){
            translate([wall_thickness, wall_thickness+iB_depth, wall_thickness]) {
                rotate([0, -90, -90]){
                    #circles(d=holes_left_d, h=wall_thickness,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_width, width=iB_height);
                }
            }
        }

        //TEXT (intrusion)
        //left
        if(text_left != ""){
            translate([text_intrusion-preview_margin, wall_thickness+iB_depth/2, wall_thickness+iB_height/2]){
                rotate([90, 0, -90]){
                    linear_extrude(text_intrusion){
                        text(text=text_left, size=text_left_size, font=text_left_font, spacing=text_left_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
        //right
        if(text_right != ""){
            translate([wall_thickness*2 + iB_width - text_intrusion, wall_thickness + iB_depth/2, wall_thickness + iB_height/2]){
                rotate([90, 0, 90]){
                    linear_extrude(text_intrusion){
                        text(text=text_right, size=text_right_size, font=text_right_font, spacing=text_right_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
        //bottom
        if(text_bottom != ""){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, text_intrusion]){
                rotate([0, 180, 90]){
                    linear_extrude(text_intrusion){
                        text(text=text_bottom, size=text_bottom_size, font=text_bottom_font, spacing=text_bottom_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
        //back
        if(text_back != ""){
            translate([wall_thickness + iB_width/2, 2*wall_thickness + iB_depth - text_intrusion, wall_thickness + iB_height/2]){
                rotate([90, 0, 180]){
                    linear_extrude(text_intrusion){
                        text(text=text_back, size=text_back_size, font=text_back_font, spacing=text_back_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
        //front
        if(text_front != ""){
            translate([wall_thickness + iB_width/2, text_intrusion, wall_thickness + iB_height/2]){
                rotate([90, 0, 0]){
                    linear_extrude(text_intrusion){
                        text(text=text_front, size=text_front_size, font=text_front_font, spacing=text_front_spacing,
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
        //air holes
        if(holes_top){
            translate([wall_thickness, wall_thickness, 0]) {
                rotate([0, 0, 0]){
                    #circles(d=holes_left_d, h=lid_height,
                            row=holes_left_rows, column=holes_left_columns,
                            height=iB_depth, width=iB_width);
                }
            }
        }
        //text
        //top
        if(text_top != ""){
            translate([wall_thickness + iB_width/2, wall_thickness + iB_depth/2, text_intrusion]){
                rotate([0, 180, 90]){
                    linear_extrude(text_intrusion){
                        text(text=text_top, size=text_top_size, font=text_top_font, spacing=text_top_spacing,
                            halign="center", valign="center");
                    }
                }
            }
        }
    }
}

module circles(d=5, h=3, row=10, column=5, height=10, width=10){
    for (x=[d : width/row - 2*d/row : width]) {
        for (y=[d : height/column - 2*d/column : height]) {
            translate([x, y, 0]) {
                cylinder(d=d, h=h+preview_margin);
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