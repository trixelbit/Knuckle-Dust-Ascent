/// @description Insert description here
// You can write your code in this edit

global.wallet += 1;

_o = instance_create_layer(player.x + random_range(-12,12), player.y - 12,"UI", e_basic);
_o.sprite_index = spr_gold_plus_1;
_o.vspeed = -1;
instance_destroy();