/// @description Insert description here
// You can write your code in this editor
scr_gravity(.3, 270);


if(!place_free(x,y+1))
{
	hspeed = 0;
	vspeed = -3;
}

