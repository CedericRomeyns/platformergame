// Reset horizontal speed
hsp = 0;

// === Movement ===
if (keyboard_check(vk_left) && !is_ducking) {
    hsp = -walk_speed;
}
if (keyboard_check(vk_right) && !is_ducking) {
    hsp = walk_speed;
}

// === Ducking ===
is_ducking = keyboard_check(vk_down) && is_on_ground;

// === Jumping ===
if (keyboard_check_pressed(vk_space) && is_on_ground && !is_ducking) {
    vsp = -jump_power; // Ensure jump_power is POSITIVE in Create event!
    is_on_ground = false;
}

// === Gravity ===
vsp += gravity;

// === Vertical Collision (Prevents Getting Stuck) ===
if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
    vsp = 0;
}

// === Ground Detection ===
if (place_meeting(x, y + 1, obj_solid)) {
    is_on_ground = true;
} else {
    is_on_ground = false;
}

// === Horizontal Movement (Prevents Walking into Walls) ===
if (!place_meeting(x + hsp, y, obj_solid)) {
    x += hsp;
}
