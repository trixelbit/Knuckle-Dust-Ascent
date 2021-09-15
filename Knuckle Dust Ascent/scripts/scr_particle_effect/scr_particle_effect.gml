/// @description scr_particle_effect(x, y, sprite_index, image_speed, light_scale)
/// @param x
/// @param y
/// @param sprite_index
/// @param image_speed
/// @param light_scale
/// @returns ID of created effect object

var X = argument0;
var Y = argument1;
var SPRITE_INDEX = argument2;
var IMAGE_SPEED = argument3;
var LIGHT_SCALE = argument4;

var temp = instance_create_layer(X, Y, "UI", e_hit1 );
temp.sprite_index = SPRITE_INDEX;
temp.image_speed = IMAGE_SPEED;
temp.light = instance_create_layer(X,Y, "light", light_source_front);
temp.image_angle = random_range(0,359);
temp.light.image_xscale = LIGHT_SCALE;
temp.light.image_yscale = LIGHT_SCALE;

return temp;