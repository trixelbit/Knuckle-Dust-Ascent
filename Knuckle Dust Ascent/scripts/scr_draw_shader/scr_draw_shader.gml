/// @description scr_draw_shader()
/// apply general lighting shader to current sprite

if( lighting_toggle )
{
	shader_set(sh_rimlight);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	shader_set_uniform_f(back_light_distance, b_light_dis);
	shader_set_uniform_f(front_light_distance, f_light_dis);
	shader_set_uniform_f(colors, global.shadow_red, global.shadow_green, global.shadow_blue);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,image_blend,image_alpha);
	shader_reset();
}
else
{
	draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
