/// @description Insert description here
// You can write your code in this editor
global.enemy_count--;
with(light)
{
	instance_destroy();
}

var drop_amount = random_range(1, max_drop);

for(var _i = 0; _i < drop_amount; _i++)
{
	instance_create_layer(x,y,"obj_front", gold_coin);
}