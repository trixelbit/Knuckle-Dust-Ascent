/// @description Initialize Enemy Abstract
//scr_initialize_shader();

global.enemy_count++;
hp = 3;
state = "idle";
hit_stun =  false;
hit_stun_duration = 5;
pure_sprite = sprite_index;
max_drop = 1;



// spawn hitbox ane resize to collission bounding box
hitbox = instance_create_layer(x,y, layer, hit_box);
hitbox.host = id;
hitbox.image_xscale = (bbox_right - bbox_left) / 2;
hitbox.image_yscale = (bbox_bottom - bbox_top) / 2;


light = instance_create_layer(x,y, "light", light_source_front);
light.image_xscale = .3;
light.image_yscale = .3;
light.strength = .5;
