


/* [box dimensions] */
//inner box length
iB_width = 30;
//inner box depth
iB_depth  = 30;
//inner box height
iB_height = 15;
//wall thickness
wall_thickness = 2;

/* [Connections] */
//add a barrel jack
barrel_jack = true;

/* [Render Options] */
//show the lid
show_lid = false;
//show the box
show_box = true;

/* [Hidden] */
//margin for the overlaps so that the preview gets right
preview_margin = 0.001;


module box(){
    difference(){
        //outher shell
        cube([iB_width + 2*wall_thickness, iB_depth + 2*wall_thickness, iB_height + wall_thickness]);
        //remove inside
        translate([wall_thickness, wall_thickness, wall_thickness + preview_margin]){
            cube([iB_width, iB_depth, iB_height]);
        }
    }
}

module lid(){

}

module main(){
    if(show_lid){
        lid();
    }
    else if(show_box){
        box();
    }
}

main();