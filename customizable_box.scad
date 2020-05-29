


/* [box dimensions] */
//inner box length
iB_width = 30;
//inner box depth
iB_depth  = 30;
//inner box height
iB_height = 15;
//wall thickness
wall_thickness = 2;

/* [Hidden] */
//margin for the overlaps so that the preview gets right
preview_margin = 0.001;


module top(){
    difference(){
        //outher shell
        cube([iB_width + 2*wall_thickness, iB_depth + 2*wall_thickness, iB_height + wall_thickness]);
        //remove inside
        translate([wall_thickness, wall_thickness, wall_thickness + preview_margin]){
            cube([iB_width, iB_depth, iB_height + wall_thickness]);
        }
    }
}

top();