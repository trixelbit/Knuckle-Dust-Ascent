/// @description 
/// @param stun?
/// @param run_speed  
/// @param run_thresh 
/// @param run_multiplier
/// @param air_horizontal_multiplier
/// @param gravity
/// @param jump_max
/// @param jump_thresh
/// @param jump_multiplier

var STUN = argument0;
var RUN_MAX = argument1;
var RUN_THRESH = argument2;
var RUN_MULTIPLIER = argument3;
var AIR_HORIZONTAL_MULTIPLIER = argument4;
var GRAVITY = argument5;
var JUMP_MAX = argument6;
var JUMP_THRESH = argument7;
var JUMP_MULTIPLIER = argument8;
var touch = 0;

k_up = ord("W");
k_down = ord("S");
k_left = ord("A");
k_right = ord("D");

jump = keyboard_check(k_up);
jump_pressed = keyboard_check_pressed(k_up);
left = keyboard_check(k_left);
right = keyboard_check(k_right);

dir = point_direction(x,y,mouse_x,mouse_y);

//face = hspeed;

switch(os_type)
{
	case os_android:
	#region android movement script
	//changes xscale to face towards to mouse
	if(instance_exists(punch))
	{
		face = punch.target_touch;
		face = ds_map_find_value(global.inputs[|face], "Xlast") >= x ? 1 : -1;
	}

	#region Gravity Set, Vertical Collision, and Vertical Jump
	if(place_free(x, y + 1))
	{
		gravity = GRAVITY;
		gravity_direction = 270;
	}
	else
	{	
		//detects clipping
		if(!place_free(x,y) and !place_free(x, y + 1))
		{
			temp = instance_place(x,y,block);
			if(temp != noone)
			{
				y -= 1;
			}
		}
	
		// on land on ground
		if(gravity != 0)
		{
			_i = instance_create_layer(x, y + 20, "light", e_basic );
			_i.sprite_index = spr_e_dustring;
			_i.image_speed = 1.1;
			_i.image_index = 3;
			audio_play_sound(s_lowwind,10,0);
			audio_play_sound(s_footstep1_2,10,0);
		}
		vspeed = 0;
		gravity = 0;
	
		if(!STUN)
		{

			#region New Player Jump
			for(i = 0; i < 2; i++)
			{
				if( ds_map_find_value(global.inputs[| i], "held" ))
				{
					if(ds_map_find_value(global.inputs[|i], "deltaY") < -JUMP_THRESH)
					{
						vspeed = -JUMP_THRESH;
						audio_play_sound(s_windgust1,10,0);
					
						var _i = instance_create_layer(x, y + 25, "light", e_basic);
						_i.sprite_index = spr_e_jumpdust;
						_i.image_speed = 1.1;
						_i.image_angle =  point_direction(x,y, player.x + hspeed, player.y);
					
						var _i = instance_create_layer(x, y + 25, "light", e_basic);
						_i.sprite_index = spr_e_dustring;
						_i.image_speed = 1.1;
					}
				
				}
			}
			#endregion
		}
	}
	#endregion

	#region Increase Jump the Longer You Hold the Joystick
	if(!STUN)
	{	
			if(vspeed < 0)
			{
				for(i = 0; i < 2; i++)
				{
					if( ds_map_find_value(global.inputs[| i], "held" ))
					{
						if(ds_map_find_value(global.inputs[|i], "deltaY") < -JUMP_THRESH)
						{
							var _de = JUMP_MULTIPLIER;
							vspeed -= _de;
						}
					}
				}
			
				vspeed = max(vspeed, -JUMP_MAX);
			}
	}
	#endregion

	#region Horizontal Movement
	if(!STUN and !STOP)
	{
		#region Horizontal Movement
		// if a touch is held and deltax is greater than threshold, change hspeed
		if(ds_map_find_value(global.inputs[| 0], "held") or ds_map_find_value(global.inputs[| 1], "held"))
		{
			if(abs(ds_map_find_value(global.inputs[| 0], "deltaX")) > RUN_THRESH)
			{
				touch = 0;//abs(ds_map_find_value(global.inputs[| 0], "deltaX")) > abs(ds_map_find_value(global.inputs[| 1], "deltaX")) ? 0 : 1;
			
				if (instance_exists(punch) and punch.recovery != true)
				{
					hspeed = RUN_MULTIPLIER * (ds_map_find_value(global.inputs[| touch], "deltaX") / RUN_THRESH);
					hspeed = abs(hspeed) > RUN_MAX ? RUN_MAX * sign(ds_map_find_value(global.inputs[| touch], "deltaX")) : hspeed;
					hspeed = gravity > 0 ? hspeed * AIR_HORIZONTAL_MULTIPLIER : hspeed;
				}
			}
		}
		#endregion
		#region deccelerate object until it is stopped
		else if (hspeed != 0 and abs(hspeed) > .5)
		{
			hspeed = lerp(hspeed, 0, .1);
		}
		// resets lerp
		else if (abs(hspeed) < .5)
		{
			hspeed = 0;
		}
		if(!place_free(x + hspeed * 2, y))
		{
			hspeed = 0;
		}
		#endregion
	}
	else
	{
		#region deccelerate object until it is stopped
		scr_decelerate(hspeed, .1);
		#endregion
	}
	#endregion
	#endregion
	break;
	
	case os_windows:
	#region windows movement script
	
	//changes xscale to face towards to mouse
	if(instance_exists(punch))
	{
		if(hspeed != 0)
		{
			face = sign(hspeed);
		}
		else if(mouse_check_button(mb_left))
		{
			if(mouse_x > x)
			{
				face = 1;
			}
			else
			{
				face = -1;
			}
		}
	}

	#region Gravity Set, Vertical Collision, and Vertical Jump
	if(place_free(x, y + 1))
	{
		gravity = GRAVITY;
		gravity_direction = 270;
	}
	else
	{	
		//detects clipping
		if(!place_free(x,y) and !place_free(x, y + 1))
		{
			temp = instance_place(x,y,block);
			if(temp != noone)
			{
				y -= 1;
			}
		}
	
		// on land on ground
		if(gravity != 0)
		{
			_i = instance_create_layer(x, y + 20, "light", e_basic );
			_i.sprite_index = spr_e_dustring;
			_i.image_speed = 1.1;
			_i.image_index = 3;
			audio_play_sound(s_lowwind,10,0);
			audio_play_sound(s_footstep1_2,10,0);
		}
		vspeed = 0;
		gravity = 0;
	
		if(!STUN)
		{

			#region player jump
			if(jump_pressed)
			{
				vspeed = -JUMP_THRESH;
				audio_play_sound(s_windgust1,10,0);
					
				var _i = instance_create_layer(x, y + 25, "light", e_basic);
				_i.sprite_index = spr_e_jumpdust;
				_i.image_speed = 1.1;
				_i.image_angle =  point_direction(x,y, player.x + hspeed, player.y);
					
				var _i = instance_create_layer(x, y + 25, "light", e_basic);
				_i.sprite_index = spr_e_dustring;
				_i.image_speed = 1.1;
					
			}
			#endregion
		}
	}
	#endregion

	#region Increase Jump the Longer You Hold the Joystick
	if(!STUN)
	{	
		if(vspeed < 0)
		{
			if(jump)
			{
				var _de = JUMP_MULTIPLIER;
				vspeed -= _de;
			}
			vspeed = max(vspeed, -JUMP_MAX);
		}
	}
	#endregion

	#region Horizontal Movement
	if(!STUN and !STOP)
	{
		#region Horizontal Movement
		// if a touch is held and deltax is greater than threshold, change hspeed
		if(right or left)
		{
			
			if (instance_exists(punch) and punch.recovery != true)
			{
				//hspeed = RUN_MULTIPLIER * (ds_map_find_value(global.inputs[| touch], "deltaX") / RUN_THRESH);
				//hspeed = abs(hspeed) > RUN_MAX ? RUN_MAX * sign(ds_map_find_value(global.inputs[| touch], "deltaX")) : hspeed;
					
				hspeed = lerp(hspeed,  sign( right - left ) * RUN_MAX, .5 );
				hspeed = gravity > 0 ? lerp(hspeed, sign( hspeed) * RUN_MAX * AIR_HORIZONTAL_MULTIPLIER, .5) : hspeed;
			}
		}

		
		#endregion
		#region deccelerate object until it is stopped
		else if (hspeed != 0 and abs(hspeed) > .5)
		{
			hspeed = lerp(hspeed, 0, .1);
		}
		// resets lerp
		else if (abs(hspeed) < .5)
		{
			hspeed = 0;
		}
		if(!place_free(x + hspeed * 2, y))
		{
			hspeed = 0;
		}
		#endregion
	}
	else
	{
		#region deccelerate object until it is stopped
		scr_decelerate(hspeed, .1);
		#endregion
	}
	#endregion
	#endregion
	break;
	

}

#region collision management
//ceiling collision
if(place_free(x,y) and !place_free(x,y + vspeed - 1))
{
	vspeed = 0;
}

//horizontal collission prevention 
if(!place_free(x + 6, y))
{
	x -= 1;
}
else if(!place_free(x - 6, y))
{
	x += 1;
}
#endregion

if keyboard_check_pressed(ord("R"))
{
	room_restart();
}