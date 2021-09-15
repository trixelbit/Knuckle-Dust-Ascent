/// @description Applies Gravity and Collision Detection for Solid Floor and Ceiling
/// @param Gravity
/// @param Gravity_Direction
function scr_gravity(argument0, argument1) {
	GRAVITY = argument0;
	GRAVITY_DIRECTION = argument1;


	if(place_free(x, y + 1))
	{
		gravity = GRAVITY;
		gravity_direction = GRAVITY_DIRECTION;
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
		vspeed = 0;
		gravity = 0;
	}

	if(place_free(x,y) and !place_free(x,y + vspeed - 1))
	{
		vspeed = 0;
	}


}
