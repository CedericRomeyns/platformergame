/// @description Insert description here
// You can write your code in this editor

// Find a spawn point

var spawn = instance_nearest(x, y, obj_spawn);

if (spawn != noone) {

    obj_player.x = spawn.x;
    obj_player.y = spawn.y;
}
