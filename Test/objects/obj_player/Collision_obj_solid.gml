while (place_meeting(x, y, obj_solid)) {
    y -= 1; // Push player out of the ground
}
vspeed = 0; // Stop downward movement



////// this code doens't work needs fixing asap needs 
//to check the col for slopes so player can walk on it obj player has acces
//to obj_solid and obj_halfslope is a child of obj_solid
//changed col mask so it fits the chape of the sprite.
if (place_meeting(x, y + 1, obj_halfslope)) {
    while (!place_meeting(x, y, obj_halfslope)) {
        y += 1;
    }
}

if (place_meeting(x, y, obj_halfslope)) {
    var _slope = instance_place(x, y, obj_halfslope);

    if (_slope != noone) {
        var slope_width = _slope.bbox_right - _slope.bbox_left;
        var slope_height = _slope.bbox_bottom - _slope.bbox_top;

        var relative_x = x - _slope.bbox_left;
        var new_y = _slope.bbox_bottom - (relative_x * (slope_height / slope_width));

        show_debug_message("Slope Y: " + string(new_y));

        if (new_y >= _slope.bbox_top && new_y <= _slope.bbox_bottom) {
            y = new_y;
        }
    }
}




