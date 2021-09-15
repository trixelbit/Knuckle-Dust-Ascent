/// @description Insert description here
// You can write your code in this editor
event_inherited();

image_angle = point_direction(x, y, player.x, player.y);

if (image_angle > 90 and image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}