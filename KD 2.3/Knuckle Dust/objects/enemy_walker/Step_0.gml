/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Make Sprite Face where its moving
if(hspeed < 0)
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}


scr_gravity(1, 270);