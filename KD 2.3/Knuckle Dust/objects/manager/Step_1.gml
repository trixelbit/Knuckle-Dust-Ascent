//iterate through the 5 inputs
for(i = 0; i < 5; i++)
{
	// set held true if tap is held
	ds_map_replace( global.inputs[|i], "held", device_mouse_check_button(i, mb_left));
	// tap = false
	ds_map_replace(global.inputs[|i], "tap", false);


	#region check if screen is initally tapped
	if(device_mouse_check_button_pressed(i, mb_left))
	{
		// set Touch Start_Point to current mouse_coordinate
		ds_map_replace(global.inputs[|i], "Xstart", device_mouse_x(i));
		ds_map_replace(global.inputs[|i], "Ystart", device_mouse_y(i));
		
		// calculate and set Point_Margins for Start_Point
		ds_map_replace(global.inputs[|i], 
			"Xstart_margin", 
			device_mouse_x(i) - camera_get_view_x(view_camera[0]));
		ds_map_replace(global.inputs[|i], 
			"Ystart_margin", 
			device_mouse_y(i) - camera_get_view_y(view_camera[0]));
	}
	#endregion

	#region set tap to true if touch is held for less than 7 frames
	if(device_mouse_check_button_released(i, mb_left))
	{
		if(ds_map_find_value(global.inputs[|i], "heldTime") < 7)
		{
			//tap is equal to true
			ds_map_replace(global.inputs[|i], "tap", true);
		}
	}
	#endregion
	
	#region if tap is held
	if(ds_map_find_value(global.inputs[|i], "held"))
	{	
		#region Updates Values
		// increment heldTime
		ds_map_replace(global.inputs[|i], "heldTime", ds_map_find_value(global.inputs[|i], "heldTime") + 1);

		#region update Last_Point to current Mouse Coordinate
		ds_map_replace(global.inputs[|i], "Xlast", device_mouse_x(i));
		ds_map_replace(global.inputs[|i], "Ylast", device_mouse_y(i));
		#endregion
		
		#region update delta x and y values
		ds_map_replace(global.inputs[|i], 
			"deltaX", 
				device_mouse_x(i) - ds_map_find_value(global.inputs[|i], "Xstart"));
		ds_map_replace(global.inputs[|i], 
			"deltaY", 
				device_mouse_y(i) - ds_map_find_value(global.inputs[|i], "Ystart"));
		#endregion

		#region update heldTime and speed value for x and y components
		if(abs(ds_map_find_value(global.inputs[|i], "Yspeed")) > 2 + abs((ds_map_find_value(global.inputs[|i], "deltaY") / ds_map_find_value(global.inputs[|i], "heldTime"))))
		{
			ds_map_replace(global.inputs[|i], "heldTime", 0);
		}
		ds_map_replace(global.inputs[|i], 
			"Xspeed", 
				ds_map_find_value(global.inputs[|i], "deltaX") / ds_map_find_value(global.inputs[|i], "heldTime"));
		ds_map_replace(global.inputs[|i], 
			"Yspeed", 
				ds_map_find_value(global.inputs[|i], "deltaY") / ds_map_find_value(global.inputs[|i], "heldTime"));
		#endregion
	    
		#region increase alpha when Start Coordinate is closer to Player
		if(instance_exists(player))
		{
			ds_map_replace(global.inputs[|i], 
				"alpha", 
				(point_distance(ds_map_find_value(global.inputs[|i], "Xstart"), ds_map_find_value(global.inputs[|i], "Ystart"), player.x, player.y)) / 100 );
		}
		else
		{
			ds_map_replace(global.inputs[|i], 
				"alpha", 
				1);
		}
		#endregion
		
		#endregion
	}
	#endregion
	
	#region else if tap is released
	else
	{
		// reset held time
		ds_map_replace(global.inputs[|i], "heldTime", 0);
		
		#region lerp point_last to point_start
		ds_map_replace(global.inputs[|i], 
			"Xlast",
			lerp( ds_map_find_value(global.inputs[|i], "Xlast"),
				ds_map_find_value(global.inputs[|i], "Xstart"),
				.1
			));
		ds_map_replace(global.inputs[|i], 
			"Ylast",
			lerp( ds_map_find_value(global.inputs[|i], "Ylast"),
				ds_map_find_value(global.inputs[|i], "Ystart"),
				.1
			));
		#endregion
		
		// Lerp alpha back to 0
		ds_map_replace(global.inputs[|i], "alpha", lerp(ds_map_find_value(global.inputs[|i],"alpha"), 0, .1));
	}
	#endregion
	
	#region update Start Point to fixed point relative to view
	ds_map_replace(global.inputs[|i], 
		"Xstart", 
		ds_map_find_value(global.inputs[|i], "Xstart_margin") + camera_get_view_x(view_camera[0]));
	ds_map_replace(global.inputs[|i], 
		"Ystart", 
		ds_map_find_value(global.inputs[|i], "Ystart_margin") + camera_get_view_y(view_camera[0]));
	#endregion
}