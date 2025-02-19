// Horizontal movement
hsp = 0;
if (keyboard_check(vk_left) && !is_ducking) hsp = -walk_speed;
if (keyboard_check(vk_right) && !is_ducking) hsp = walk_speed;
if (keyboard_check(vk_down) && is_on_ground) {
    is_ducking = true;
} else {
    is_ducking = false;
}
if (keyboard_check(vk_space) && is_on_ground) {
    vsp = jump_power;
    is_on_ground = false;
    jump_held = true;
}
if (is_on_ground) {
    jump_held = false;
}
vsp += gravity;
if (place_meeting(x, y + vsp, obj_solid)) { 
    while (!place_meeting(x, y + sign(vsp), obj_solid)) { 
        y += sign(vsp);
    }
    vsp = 0;
    is_on_ground = true;
} else {
    is_on_ground = false;
}
if (!place_meeting(x + hsp, y, obj_solid)) { 
    x += hsp;
}
if (!place_meeting(x, y + vsp, obj_solid)) { 
    y += vsp;
} else {
    vsp = 0;
}