/// @description Insert description here
// You can write your code in this editor
if(instance_exists(player))
{
	x = lerp(x, player.x, 0.4) + random_range(-screenshake, screenshake);
	y = lerp(y, player.y - 30,0.2) + random_range(-screenshake, screenshake);
}


speed = lerp(speed, 0, .2);
screenshake = lerp(screenshake, 0, 0.125);