/// @description Insert description here
// You can write your code in this editor

scr_update_shader_values();

//set target coordinate to player shoulder position
X = player.x + (shoulder_x * player.face);
Y = player.y + shoulder_y;
image_yscale = player.face;


// cycle through all inputs
for(i = 0; i < 2; i++)
{
	#region check if there is a tap
	if(!player.FREEZE  and ds_map_find_value(global.inputs[|i], "tap") and !recovery and player.state != "air")
	{
		state = "jab";
		break;
	}
	else
	{
		state = "idle";	
	}
	#endregion
}

switch(state)
{
	case "jab":
		range_outline_alpha = 1;
		target_touch = ds_map_find_value(global.inputs[|1], "tap") ? 1 : 0;
		player.punch_alt = (player.punch_alt + 1) mod 2; // alternate punch sides
		// left = 0 for alt_punch
		layer = player.punch_alt ?  layer_get_id( "obj_back") : layer_get_id("obj_front"); 
		image_alpha = 1;
		var rand = random_range(0,100);
		
		if(rand >= 50)
		{
			audio_play_sound(s_punch_air1,10,0);
		}
		else
		{
			audio_play_sound(s_punch_air2,10,0);
		}
		
		recovery = true;
		
		// check if player is grounded and running
		if(player.state != "air" and player.state != "trot")
		{	
			player.hspeed = lerp(player.hspeed, 0, .3);
			player.STOP = true;
			alarm[0] = cool_down;
		}
		
		//rotates arm
		dir =  point_direction(X, Y,ds_map_find_value(global.inputs[|target_touch], "Xlast"),ds_map_find_value(global.inputs[|target_touch], "Ylast"));
		dis = point_distance(X, Y, ds_map_find_value(global.inputs[|target_touch], "Xlast"), ds_map_find_value(global.inputs[|target_touch], "Ylast"));
		radius = dis < arm_length ? dis : arm_length;
		x = X + lengthdir_x(radius, dir);
		y = Y + lengthdir_y(radius, dir);
		
		// create effect
		var e = instance_create_layer(x, y, "obj_front", e_basic);
		e.sprite_index = spr_e_slash;
		e.image_angle = dir;
		e.image_yscale = player.face;
		e.image_xscale = min( 100, dis/100);
		e.image_speed = 3;
		e.image_yscale = min( 2, 1 / e.image_xscale);
		break;
		
	case "idle":
		if(!recovery)
		{
			image_alpha = 0;
		}
		x = lerp(x, X, .25);
		y = lerp(y, Y, .25);
		break;
}

if(point_distance(x,y,X,Y) < 32)
{
	recovery = false;
}

range_outline_alpha = lerp(range_outline_alpha, 0, .1);


