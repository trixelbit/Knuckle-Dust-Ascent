/// @description scr_initializer_shader()
/// Components needed for the shader
function scr_initialize_shader() {


	lighting_toggle = false;
	if(instance_number(lighting) > 0)
	{
		lighting_toggle = true;
	}

	if( lighting_toggle )
	{
		upixelH = shader_get_uniform(sh_rimlight, "pixelH");
		upixelW = shader_get_uniform(sh_rimlight, "pixelW");
		colors = shader_get_uniform(sh_rimlight, "c_weight");
		front_light_distance = shader_get_uniform(sh_rimlight, "l_front_distance");
		back_light_distance = shader_get_uniform(sh_rimlight, "l_back_distance");
		texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
		texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
		b_light_dis = -1;
		f_light_dis = -1;
	}



}
