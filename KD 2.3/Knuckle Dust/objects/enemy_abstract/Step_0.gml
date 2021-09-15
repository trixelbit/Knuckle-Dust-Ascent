/// @description Insert description here

// calculate distance from light for shader
//scr_update_shader_values();


//trigger death state
if(hp <= 0)
{
	state = "dead";
}

light.x = x;
light.y = y;


if(state = "dead")
{
	with(hitbox)
	{
		instance_destroy();
	}
	
	instance_destroy();
}

