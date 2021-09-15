/// @description Insert description here
// You can write your code in this editor
if(target != noone and target != undefined and instance_exists(target))
{
	draw_set_color(c_gray);
	draw_line_width(target.x, target.y, xstart, ystart, 10);
	draw_set_color(c_black)
	draw_line_width(target.x, target.y, xstart, ystart, 8);

	draw_set_color(c_gray);
	draw_circle(target.x, target.y, 10, true);
	draw_set_color(c_black);
	draw_circle(target.x, target.y, 10, false);
}

draw_set_color(c_gray);
draw_circle(xstart, ystart, 10, true);
draw_set_color(c_black);
draw_circle(xstart, ystart, 10, false);

/*
with(light)
{
	draw_sprite_ext(spr_light1, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, .4);
}
*/
draw_sprite_ext(sprite_index, image_index,x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

