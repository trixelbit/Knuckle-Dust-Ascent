/// @description scr_update_shader_values()
function scr_update_shader_values() {

	if( lighting_toggle )
	{
		var t = -1;
		if(instance_number(light_source_back) > 0)
		{
			t = instance_nearest(x,y, light_source_back);
			b_light_dis = point_distance(x,y, t.x, t.y);
		}
		if(instance_number(light_source_front) > 0)
		{
			t = instance_nearest(x,y, light_source_front);
			f_light_dis = point_distance(x, y, t.x, t.y);
		}
	}


}
