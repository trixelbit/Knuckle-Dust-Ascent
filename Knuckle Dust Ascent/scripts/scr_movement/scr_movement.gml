/// @description scr_movement(
/// @param run_speed  
/// @param run_thresh 
/// @param run_multiplier
/// @param gravity
/// @param jump_max
/// @param jump_thresh
/// @param jump_multiplier


RUN_MAX = argument0;
RUN_THRESH = argument1;
RUN_MULTIPLIER = argument2;
GRAVITY = argument3;
JUMP_MAX = argument4;
JUMP_THRESH = argument5;
JUMP_MULTIPLIER = argument6;


dir = point_direction(x,y,mouse_x,mouse_y);


//changes face to face towards to mouse
face = mouse_x > x ? 1 : -1;

if(place_free(x, y + 1))
{
	gravity = GRAVITY;
	gravity_direction = 270;
}
else
{	
	//detects clipping
	if(!place_free(x,y))
	{
		temp = instance_place(x,y,block);
		if(temp != noone)
		{
			y -= 1;
		}
	}
	vspeed = 0;
	gravity = 0;
	
	
	if(global.mouseHeld)
	{
		//check mouse_yspeed threshold
		if(global.mouse_Yspeed < -JUMP_THRESH)
		{
			vspeed = JUMP_MULTIPLIER * (global.mouse_Yspeed / JUMP_THRESH);
			vspeed = vspeed < -JUMP_MAX ? -JUMP_MAX : vspeed;
		}
	}
}



if(global.mouseHeld)
{
	// Max Speed = 5
	//
	if(abs(global.mouse_deltaX) > RUN_THRESH and punch.recovery != true)
	{
		hspeed = RUN_MULTIPLIER * (global.mouse_deltaX/RUN_THRESH);
		hspeed = abs(hspeed) > RUN_MAX ? RUN_MAX * (global.mouse_deltaX / abs(global.mouse_deltaX)) : hspeed;
	}
}
// deccelerate object until it is stopped
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




if keyboard_check_pressed(ord("R"))
{
	room_restart();
}