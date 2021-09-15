/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


for(var i = 0; i < cape_length; i++)
{
	if(i = 0)
	{
		cape[|0] = x;
	}
	else
	{
		cape[| i] = sine_osc(.35,300, cape[|i]);
		cape[| i] = lerp(cape[|i], cape[| i-1], .8);
		
	}
	draw_sprite_ext(spr_cape,0, cape[|i], y + i, sign(image_xscale)* (1 + (.4 * i/cape_length)), 1, 0, c_white, 1 );
}