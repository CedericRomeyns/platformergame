if (obj_player.vspeed >= 0) {
    var slope_y_offset = 0;
    // Check for collision with the slope (obj_halfslope)
    if (collision_point(obj_player.x + 2, obj_player.y + obj_player.sprite_height / 2, obj_halfslope, false, false)) {
        var slope_start_x = obj_halfslope.x;
        var slope_end_x = obj_halfslope.x + obj_halfslope.sprite_width;
        var slope_angle = (obj_halfslope.sprite_height / 2) / (obj_halfslope.sprite_width / 2); // Assuming 45-degree slope
        
        // Calculate Y position on the slope based on the player's X position
        if (obj_player.x >= slope_start_x && obj_player.x <= slope_end_x) {
            slope_y_offset = obj_halfslope.y + slope_angle * (obj_player.x - slope_start_x) - obj_player.y;
        }
    }
    // If the player is on a slope, adjust the Y position
    if (slope_y_offset != 0) {
        obj_player.y += slope_y_offset;
        obj_player.is_on_ground = true;
    } else {
        // Check for collision with solid ground (obj_solid)
        obj_player.is_on_ground = true;
        obj_player.y = bbox_top - obj_player.sprite_height / 2;
        obj_player.vspeed = 0; // Prevent downward movement through the ground
    }
} else {
    obj_player.is_on_ground = false;
}