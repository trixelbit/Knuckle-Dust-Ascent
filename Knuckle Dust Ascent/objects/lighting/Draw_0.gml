/// @description Insert description here

if(surface_exists(surface))
{
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy =  camera_get_view_y(view_camera[0]);
	global.color_blend = make_color_rgb(global.shadow_red, global.shadow_green, global.shadow_blue);
	
	surface_set_target(surface);
	
	draw_set_color(make_color_rgb(global.shadow_red * 255, global.shadow_green * 255, global.shadow_blue* 255));
	draw_set_alpha(0.8);
	draw_rectangle(0, 0, _cw, _ch, false);
	
	// set draw mode to subtract
	gpu_set_blendmode(bm_subtract);
	
	with(light_source_back)
	{
		draw_sprite_ext(spr_light1, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, global.color_blend,strength);
	}
	with(light_source_front)
	{
		draw_sprite_ext(spr_light1, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, global.color_blend, strength);
	}
	
	

	draw_set_alpha(1);
	with(light_source_back)
	{
		if(object_get_sprite(self) != -1)
		{
			draw_sprite_ext(sprite_index, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}
	with(light_source_front)
	{
		if(object_get_sprite(self) != -1)
		{

			draw_sprite_ext(sprite_index, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}

	with(light_block)
	{
		draw_sprite_ext(sprite_index, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	with(light_shop_windows)
	{
		draw_sprite_ext(sprite_index, 0, x - _cx, y - _cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(surface, _cx, _cy);
	
	
}
else 
{
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	
	surface = surface_create(_cw, _ch);
	
	surface_set_target(surface);
	draw_set_color(make_color_rgb(10,0,30));
	draw_set_alpha(.6);
	draw_rectangle(0, 0, _cw, _ch, false);
	surface_reset_target();
	
	
}




