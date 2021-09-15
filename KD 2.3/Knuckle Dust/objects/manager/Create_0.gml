show_debug_overlay(true);
audio_group_load(sound_effects);
audio_group_load(background_music);

death = 0;
// 2nd input stick origin
tap_origin_xoffset = 64;
tap_orgin_yoffset = 64;

// if more than 1 manager exists, destroy self
if(instance_number(self) > 1)
{
	instance_destroy();
}

health_limit = 5;
lives = health_limit;

//set in game values
global.wallet = 0;


//set difficulty
global.difficulty = 20;
global.enemy_count = 0;
global.current_level = 0;

//audio volume levels
global.sound_effects_volume = 1;
global.background_music_volume = 0;


// set shadow base color
global.shadow_red = 0.05;
global.shadow_green = 0.02;
global.shadow_blue = 0.1;



debug = false;
active_room = room;

global.mouse_Xstart = 0;
global.mouse_Ystart = 0;

global.mouse_Xlast = 0;
global.mouse_Ylast = 0;
	
global.mouse_deltaX = 0;
global.mouse_deltaY = 0;
	
global.mouse_Xspeed = 0;
global.mouse_Yspeed = 0;

global.mouseHeldTime = 0;

global.tap = false;

#region ds list containg a ds_map for every screent tap
global.inputs = ds_list_create();
ds_list_add(global.inputs, ds_map_create());
ds_list_add(global.inputs, ds_map_create());
ds_list_add(global.inputs, ds_map_create());
ds_list_add(global.inputs, ds_map_create());
ds_list_add(global.inputs, ds_map_create());

for(i = 0; i < 5; i++)
{
	ds_map_add(global.inputs[| i], "Xstart", 0);
	ds_map_add(global.inputs[| i], "Ystart", 0);
	
	ds_map_add(global.inputs[| i], "Xlast", 0);
	ds_map_add(global.inputs[| i], "Ylast", 0);
	
	ds_map_add(global.inputs[| i], "deltaX", 0);
	ds_map_add(global.inputs[| i], "deltaY", 0);
	
	ds_map_add(global.inputs[| i], "Xspeed", 0);
	ds_map_add(global.inputs[| i], "Yspeed", 0);
	
	ds_map_add(global.inputs[| i], "tap", false);
	
	ds_map_add(global.inputs[| i], "heldTime", 0);
	
	ds_map_add(global.inputs[| i], "held", false);
	
	ds_map_add(global.inputs[| i], "alpha", 0);
	
	ds_map_add(global.inputs[| i], "Xstart_margin", 0);
	ds_map_add(global.inputs[| i], "Ystart_margin", 0);
	ds_list_mark_as_map(global.inputs, global.inputs[| i]);
}
#endregion

mouse_Xstart_margin = 0;
mouse_Ystart_margin = 0;
stick_length = 25;

dir = 0;
stickx = lengthdir_x(100,dir);
sticky = lengthdir_y(100,dir);


