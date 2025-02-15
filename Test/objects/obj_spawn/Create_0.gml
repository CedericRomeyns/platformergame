visible = false;
var num_players = 1; 

for (var i = 0; i < num_players; i++) {
    var _new_player = instance_create_layer(obj_spawn.x, obj_spawn.y, layer, obj_player);
    _new_player.x += i * 32;  
}
