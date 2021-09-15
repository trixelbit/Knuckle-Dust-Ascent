/// debug set
if keyboard_check_pressed(vk_f1)
{
	debug = true;
}
else if keyboard_check_pressed(vk_f2)
{
	debug = false;
}

if keyboard_check_pressed(vk_escape)
{
	game_end();
}

/*

#region Click on Mute Music
var _i = max(!ds_map_find_value(global.inputs[|0], "tap" ) + ds_map_find_value(global.inputs[|1], "tap" ) - 1, 0 )
if( ds_map_find_value(global.inputs[|_i], "tap" ) and
	point_distance( 464 + camera_get_view_x(view_camera[0]), 26 + camera_get_view_y(view_camera[0]), 
	ds_map_find_value(global.inputs[|_i], "Xlast" ), ds_map_find_value(global.inputs[|_i], "Ylast" ) ) 
	< 40)
{
	global.background_music_volume = global.background_music_volume = .3 ? 0 : .3; 
	audio_group_set_gain(background_music, global.background_music_volume, 1);
}
#endregion
*/

if(os_is_paused())
{
	active_room = room;
	room_persistent = true;
	room_goto(pause);
}

if(lives <= 0 and sprite_index != spr_death)
{
	//scr_death();
	death = 1;
	player.FREEZE = true;
	sprite_index = spr_death;
	image_speed = .5
	audio_stop_sound(m_theme);
	audio_play_sound(m_death,100,0);
	audio_group_set_gain(background_music, global.background_music_volume,1);
	
	
}
