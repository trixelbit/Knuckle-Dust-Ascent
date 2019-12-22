/// @description  Movement - States - Animation manager
// You can write your code in this editor

scr_movement(6, 5, 1, 1, 15, 7, 10);


// Spawns Arm
if (!instance_exists(punch))
{
	instance_create_layer(x,y, "Instances", punch);
	instance_create_layer(x,y, "Instances", camera);
}


// State Setter
if(place_free(x,y + 1))
{
	state = "air";
}
else
{
	if(abs(hspeed) > 3)
	{
		state = "run";
	}
	else if(abs(hspeed) > 0 and abs(hspeed) <= 3)
	{
		state = "trot";
	}
	else
	{
		state = "idle";
	}
}

// State Animation Handler
switch(state)
{
	case "idle":
		if(punch.recovery)
		{
			sprite_index = skins[# current_skin, 1];
			image_speed = 1;
			image_xscale = face;
		}
		else
		{
			sprite_index = skins[# current_skin, 0];
			image_speed = 1;
			image_xscale = face;
		}
		
		break;
		
	case "trot":
		if(punch.recovery)
		{
			sprite_index = skins[# current_skin, 1];
			image_speed = 1;
			image_xscale = face;
		}
		else
		{
			sprite_index = skins[# current_skin, 2];
			image_speed = 1;
			image_xscale = hspeed / abs(hspeed);
		}
		break;
		
	case "run":
		sprite_index = skins[# current_skin, 4];
		image_speed = 1;
		image_xscale = hspeed / abs(hspeed);
		
		break;

	case "air":
		// jump
		if(vspeed < 0)
		{
			if(punch.recovery)
			{
				sprite_index = skins[# current_skin, 3];
				image_index = 2;
				image_speed = 0;
				image_xscale = face;
			}
			else
			{
				sprite_index = skins[# current_skin, 2];
				image_index = 2;
				image_speed = 0;
				image_xscale = abs(hspeed / abs(hspeed)) = 1 ? hspeed / abs(hspeed) : face;
			}
		}
		//fall
		else
		{
			if(punch.recovery)
			{
				sprite_index = skins[# current_skin, 3];
				image_index = 4;
				image_speed = 0;
				image_xscale = face;
			}
			else
			{
				sprite_index = skins[# current_skin, 2];
				image_index = 4;
				image_speed = 0;
				image_xscale = abs(hspeed / abs(hspeed)) = 1 ? hspeed / abs(hspeed) : face;
			}
		}
		break;
}


