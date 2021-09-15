/// @description Insert description here
// You can write your code in this editor



// UI Elements
gpu_set_blendmode(bm_subtract);
draw_rectangle_color(
0,  
camera_get_view_height(view_camera[0]) - 48,
camera_get_view_width(view_camera[0]),
camera_get_view_height(view_camera[0]),
c_black,
c_black,
c_white,
c_white,
0
);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);


//  draw the wallet
draw_set_color(c_white);
draw_set_font(font0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite(spr_coin, 0, 13, 13);
draw_text(30, 13, ": "+ string(global.wallet));

//  draw the wallet
draw_set_color(c_white);
draw_set_font(font0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite(spr_ui_level, 0, camera_get_view_width(view_camera[0])/2, 13);
draw_text((camera_get_view_width(view_camera[0])/2) - 20, 13, ": "+ string(global.current_level));


#region Draw The Hearts
draw_set_color(c_black);
for(var _i = 0; _i < health_limit; _i++)
{
	draw_sprite(spr_heartlife, 1, 
	(1 + sprite_get_width(spr_heartlife)/2)
		+ (_i * sprite_get_width(spr_heartlife)) 
		+ (camera_get_view_width(view_camera[0]) / 2) 
		- ((health_limit/2) * sprite_get_width(spr_heartlife)),
	camera_get_view_height(view_camera[0]) - sprite_get_height(spr_heartlife));
}




var shake = lives != 0 ? .5 * floor(2 / lives) : 0;

draw_set_color(c_white);
for(var _i = 0; _i < lives; _i++)
{
	sprite_get_width(spr_heartlife)
	draw_sprite(spr_heartlife,0, 
	(1 + sprite_get_width(spr_heartlife)/2)
		+ (_i * sprite_get_width(spr_heartlife)) 
		+ (camera_get_view_width(view_camera[0]) / 2) 
		- ((health_limit/2) * sprite_get_width(spr_heartlife))
		+ random_range(-shake, shake),
	camera_get_view_height(view_camera[0]) - sprite_get_height(spr_heartlife)
		+ random_range(-shake, shake)
	);
}
#endregion

if(death)
{
	draw_set_color(c_black);
	draw_rectangle(-1,-1,camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
	draw_set_color(c_white);
	
	if(image_index >= 13)
	{
		image_speed = 0;
		draw_sprite(sprite_index, 14, camera_get_view_width(view_camera[0])/2 , camera_get_view_height(view_camera[0])/2);
	}
	else
	{
		draw_sprite(sprite_index, image_index, camera_get_view_width(view_camera[0])/2 , camera_get_view_height(view_camera[0])/2);
	}
}
