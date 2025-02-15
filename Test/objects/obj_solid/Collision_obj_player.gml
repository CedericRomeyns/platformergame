if (obj_player.vspeed >= 0) {
    var slope_y_offset = 0;


    if (place_meeting(obj_player.x, obj_player.y + obj_player.sprite_height / 2, obj_solid)) {
        obj_player.is_on_ground = true;
        obj_player.y = bbox_top - obj_player.sprite_height / 2;  
        obj_player.vspeed = 0;  
    } else {
        obj_player.is_on_ground = false;
    }
} else {
    obj_player.is_on_ground = false;
}
