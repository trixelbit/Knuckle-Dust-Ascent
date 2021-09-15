/// @description Insert description here

#region debugging draw events
// You can write your code in this editor
if(debug)
{
	draw_set_color(c_white);
	draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 10, string(fps));
	draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 30, string(fps_real));
	draw_set_color(c_red);
	draw_line_width(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]) + 0,
		camera_get_view_x(view_camera[0]) + room_speed,
		camera_get_view_y(view_camera[0]) + 0,
		8);
	draw_set_color(c_yellow);
	draw_line_width(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]) + 0,
		camera_get_view_x(view_camera[0]) + fps,
		camera_get_view_y(view_camera[0]) + 0,
		8);
		draw_set_color(c_yellow);
	draw_text(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]) + 50,
		"Enemy Count: " + string(global.enemy_count));
}
#endregion

else
{
	/*
	draw_set_color(c_yellow);
	draw_text(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]) + 15,
			"Enemy Count: " + string(global.enemy_count));
	draw_text(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]) + 30,
			"Level: " + string(global.current_level));
			*/
}


if(os_device == os_android)
{
	#region draw joystick

	for(i = 0; i < 2; i++)
	{
		draw_set_alpha(ds_map_find_value(global.inputs[|i], "alpha"));
		mouse_Xstart =  ds_map_find_value(global.inputs[|i], "Xstart");
		mouse_Ystart =  ds_map_find_value(global.inputs[|i], "Ystart");
		mouse_Xlast =  ds_map_find_value(global.inputs[|i], "Xlast");
		mouse_Ylast =  ds_map_find_value(global.inputs[|i], "Ylast");
	
	
		// draw black base
		draw_set_color(c_black);
		draw_circle(
			(mouse_Xstart), 
			(mouse_Ystart), 
			20, false);
	

		dir = point_direction(mouse_Xstart, mouse_Ystart, mouse_Xlast, mouse_Ylast);
		dis = point_distance(mouse_Xstart, mouse_Ystart, mouse_Xlast, mouse_Ylast);
		dis = dis < stick_length ? dis : stick_length;
		stickx = lengthdir_x(dis,dir);
		sticky = lengthdir_y(dis,dir);

		//stick
		//draw_line_width(global.mouse_Xstart, global.mouse_Ystart, global.mouse_Xstart + stickx, global.mouse_Ystart + sticky, 10);

		//joystick head
		switch(i)
		{
			case 0:
				draw_set_color(c_red); 
				draw_circle(mouse_Xstart + stickx, mouse_Ystart + sticky, 16, false);
				draw_sprite(spr_joystick_shine, 0, mouse_Xstart + stickx, mouse_Ystart + sticky);
				break;
			case 1:
				draw_set_color(c_blue); 
				draw_circle(mouse_Xstart + stickx, mouse_Ystart + sticky, 16, false);
				draw_sprite(spr_joystick_shine_blue, 0, mouse_Xstart + stickx, mouse_Ystart + sticky);
		}
	}
	#endregion
}




