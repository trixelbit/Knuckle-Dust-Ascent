/// @description  Movement - States - Animation manager
// calculate distance from light objects for shader
scr_update_shader_values();

if(!FREEZE)
{
	


	#region Player Movement
	// Change Movement Based on Hit state
	if(state != "hit")
	{
		scr_movement( false, 4, 5, 1, 1.2, .8, 12, 9, .3);
		//OLD JUMP Parameters scr_movement( false, 4, 5, 1, 1.2, .7, 12, 6, 8);
	}
	else
	{ 
		scr_movement( true, 4, 5, 1, 1.2, .8, 12, 9, .3);
		//OLD JUMP Parameters scr_movement( true, 4, 5, 1, 1.2, .7, 12, 6, 8);
	}
	#endregion

	// make player transparent when invulnerable
	image_alpha = invulnerable = true ? 0.3 : 1;

	#region State Setter
	if(state != "hit")
	{
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
	}
	#endregion

	#region State Animation Handler
	switch(state)
	{
		case "idle":
			#region idle
			// punch
			if(punch.recovery)
			{
				sprite_index = punch_alt = 0 ? skins[# current_skin, 1] : skins[# current_skin, 8];
				image_speed = 1;
				image_xscale = face;
				image_angle = 0;
			}
			else //idle
			{
				sprite_index = skins[# current_skin, 0];
				image_speed = 1;
				image_xscale = face;
				image_angle = 0;
			}
			#endregion		
			break;
		
		case "trot":
			#region trot
			if(punch.recovery)
			{
				sprite_index = punch_alt = 0 ? skins[# current_skin, 1] : skins[# current_skin, 9];
				image_speed = 1;
				image_xscale = face;
				image_angle = 0;
			}
			else // punching
			{
			
				sprite_index = skins[# current_skin, 2];
				image_speed = 1;
				image_xscale = hspeed / abs(hspeed);
				image_angle = 0;
			}
		
		
			if(image_index >= 1 and image_index < 4)
			{
				if(step = "right")
				{
					audio_stop_sound(s_footstep1_2);
					audio_play_sound(s_footstep1_1,10,0);
					step = "left";
				}
			}
			else
			{
				if(step = "left")
				{
					audio_stop_sound(s_footstep1_1);
					audio_play_sound(s_footstep1_2,10,0);
					step = "right";
				}
			}
			#endregion
			break;
		
		case "run":
			#region run
			sprite_index = skins[# current_skin, 4];
			image_speed = 1;
			image_xscale = hspeed / abs(hspeed);
			image_angle = 0;
		
			if(image_index >= 2 and image_index < 6)
			{
				if(step = "right")
				{
					audio_stop_sound(s_footstep1_2);
					audio_play_sound(s_footstep1_1,10,0);
					step = "left";
				}
			}
			else
			{
				if(step = "left")
				{
					audio_stop_sound(s_footstep1_1);
					audio_play_sound(s_footstep1_2,10,0);
					step = "right";
				}
			}
		
		
			#endregion		
			break;

		case "air":
			#region jump
			if(vspeed < 0)
			{
				#region *Depricated* Switch between different air sprites if player is punching
				/* Switch between different air sprites if player is punching
				if(punch.recovery)
				{
					sprite_index = skins[# current_skin, 6];
					image_index = 2;
					image_speed = 1;
					image_xscale = face;
				}
				else
				{
					sprite_index = skins[# current_skin, 6];
					image_index = 2;
					image_speed = 1;
					image_xscale = abs(hspeed / abs(hspeed)) = 1 ? hspeed / abs(hspeed) : face;
				}*/
				#endregion
			
				sprite_index = skins[# current_skin, 6];
				image_index = 2;
				image_speed = 1;
				image_xscale = abs(hspeed / abs(hspeed)) = 1 ? hspeed / abs(hspeed) : face;
				image_angle = lerp(image_angle, 8 * (-hspeed / 5), .20);
			}
			#endregion
			#region fall
			else
			{
				if(punch.recovery)
				{
					sprite_index = skins[# current_skin, 7];
					image_index = 4;
					image_speed = 1;
					image_xscale = face;
				}
				else
				{
					sprite_index = skins[# current_skin, 7];
					image_index = 4;
					image_speed = 1;
					image_xscale = abs(hspeed / abs(hspeed)) = 1 ? hspeed / abs(hspeed) : face;
				}
			
				image_angle = lerp(image_angle, 0, .30);
			}
			#endregion
			break;
		
		case "hit":
			#region hit
			sprite_index = skins[# current_skin, 5];
			image_speed = 0;
			image_xscale = face;
			hspeed = -face;
			image_angle = 0;
			#endregion
			break;
	}
	#endregion

	// go to next room
	if(place_meeting(x,y, lock_door) and lock_door.image_index = 1)
	{
		room_persistent = false; 	
		global.difficulty += 2;
		global.current_level++;
		room_goto(scr_next_level("snow"));
	}
}