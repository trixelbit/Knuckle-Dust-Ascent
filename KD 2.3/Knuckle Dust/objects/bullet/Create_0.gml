/// @description Insert description here
// You can write your code in this edito

scr_initialize_shader();
/*
size = 8;
image_xscale *= size;
image_yscale = image_xscale;
*/

/// put in function you dingus
hitbox = instance_create_layer(x,y, layer, hit_box);
hitbox.host = id;
hitbox.image_xscale = (bbox_right - bbox_left) / 2;
hitbox.image_yscale = (bbox_bottom - bbox_top) / 2;

punched = false;
