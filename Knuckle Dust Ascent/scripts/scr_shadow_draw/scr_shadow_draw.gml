/// @description scr_shadow_draw(object, max_draw_distance)
/// @param object
/// @param max_draw_distance
var OBJECT = argument0;
var MAX_DRAW = argument1;
var ALPHA = .45;
var light_type = 0; // 0 =  back; 1 = front;

with(OBJECT)
{
	var nearest_b_l = instance_nearest(x,y, light_source_back);
	var nearest_f_l = instance_nearest(x,y, light_source_front);
	
	//make sure that light object exist
	if(nearest_b_l != noone and nearest_f_l != noone)
	{
		var nearest_distance = point_distance(x,y,nearest_f_l.x, nearest_f_l.y);
		if(nearest_distance < point_distance(x,y,nearest_b_l.x, nearest_b_l.y) )
		{
			var nearest_light = nearest_f_l;
			light_type = 0;
		}
		else
		{
			var nearest_light = nearest_b_l;
			nearest_distance = point_distance(x,y,nearest_b_l.x, nearest_b_l.y);
			light_type = 1;
		}
	}
	else if(nearest_b_l != noone)
	{
		var nearest_light = nearest_b_l;
		nearest_distance = point_distance(x,y,nearest_b_l.x, nearest_b_l.y);
		light_type = 1;
	}
	else if(nearest_f_l != noone)
	{
		var nearest_light = nearest_f_l;
		var nearest_distance = point_distance(x,y,nearest_f_l.x, nearest_f_l.y);
		light_type = 0;
	}
	else
	{
		var nearest_light = undefined;
	}
	
	// if light objects exist, perform shadows with respect to them
	if(nearest_light != noone and nearest_light != undefined)
	{
		ALPHA = ((180 - nearest_distance) / 180) * .8;
	
		for(var i = 0; i < MAX_DRAW; i++)
		{
			var l_dir = point_direction(x,y, nearest_light.x, nearest_light.y);
			var _xoffset = lengthdir_x(sprite_height/2, l_dir - 160) * .25;
			var _xscale = max(2 * nearest_distance / 250, .5);
			if(!place_free(x,y + i))
			{
				draw_sprite_ext(sprite_index, image_index, x + _xoffset, i + y + (sprite_height/2) - 3 + (light_type * 2), min( image_xscale, image_xscale * _xscale), .1, 0, make_color_hsv(0,0,0), ALPHA * (MAX_DRAW-i)/MAX_DRAW);
				break;
			}
		}
	}
	// light objects do not exist, do simple shadows
	else
	{
		for(var i = 0; i < MAX_DRAW; i++)
		{
			
			if(!place_free(x,y + i))
			{
				draw_sprite_ext(sprite_index, image_index, x, i + y + (sprite_height/2) - 3, image_xscale, .1, 0, make_color_hsv(0,0,0), ALPHA * (MAX_DRAW-i)/MAX_DRAW);
				break;
			}
		}
	}
}
