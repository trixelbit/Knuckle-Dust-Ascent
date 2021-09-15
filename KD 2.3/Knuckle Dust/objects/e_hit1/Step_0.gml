/// @description Insert description here
// You can write your code in this editor
if(light != noone)
{
	light.image_xscale *= (1 - (image_index/ image_number));
	light.image_yscale = light.image_xscale;
}