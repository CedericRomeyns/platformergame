visible = false;
if (!variable_global_exists("checkpoint_spawned")) {
    global.checkpoint_spawned = false;
    global.last_checkpoint_x = x;
    global.last_checkpoint_y = y;
}

if (!global.checkpoint_spawned) {
    var _spawn_x = global.last_checkpoint_x;
    var _spawn_y = global.last_checkpoint_y;

    var num_players = 1;


    for (var i = 0; i < num_players; i++) {
        var _new_player = instance_create_layer(_spawn_x, _spawn_y, layer, obj_player);
        _new_player.x += i * 32;
    }
}

if (collision_point(x, y, obj_checkpoint_flag, false, false)) {
    global.checkpoint_spawned = true;
    global.last_checkpoint_x = x;
    global.last_checkpoint_y = y;
}
