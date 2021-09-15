/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.9;
image_yscale = 0.9;

target = self;
saw_number = 0;


#region Find Target Object for Saw in Room
for(var i = 0; i < instance_number(saw); i++)
{
	temp = instance_find( saw, i );
	if(temp == id)
	{
		saw_number = i;
		target = instance_find(saw_target, i);
	}
}
#endregion
goto = target;


// light spawn
light = instance_create_layer(x,y, "light", light_source_front);
light.sprite_index = spr_light1;
light.image_xscale = .7 * image_xscale;
light.image_yscale = light.image_xscale;
light.image_alpha = .3;
light.image_blend = c_red;


if(place_meeting(x,y,nospawn))
{
	instance_destroy();
}



