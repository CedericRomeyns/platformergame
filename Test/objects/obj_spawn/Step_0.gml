/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("R"))) {
    global.checkpoint_spawned = false;
    global.last_checkpoint_x = xstart;
    global.last_checkpoint_y = ystart;
    room_restart();
}
