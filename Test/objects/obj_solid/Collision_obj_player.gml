if(obj_player.vspeed >= 0) {
    var slope_y_offset = 0;
    if (collision_point(obj_player.x + 1, obj_player.y + obj_player.sprite_height / 2, obj_halfslope, false, false)) {
        var slope_start_x = obj_halfslope.x;
        var slope_end_x = obj_halfslope.x + obj_halfslope.sprite_width;
        var slope_angle = (obj_halfslope.sprite_height / 2) / (obj_halfslope.sprite_width / 2); 
        
        
        if (obj_player.x >= slope_start_x && obj_player.x <= slope_end_x) {
            slope_y_offset = obj_halfslope.y + slope_angle * (obj_player.x - slope_start_x) - obj_player.y;
        }
    }


    if (slope_y_offset != 0) {
        obj_player.y += slope_y_offset;
        obj_player.is_on_ground = true;
    } else {
       
        obj_player.is_on_ground = true;
        obj_player.y = bbox_top - obj_player.sprite_height / 2;
        obj_player.vspeed = 0;
    }
} else {
    obj_player.is_on_ground = false;
}