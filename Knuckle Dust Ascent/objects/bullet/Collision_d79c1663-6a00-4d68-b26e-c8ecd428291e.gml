/// @description Insert description here
// You can write your code in this editor
/*
if(punch.state != "idle")
{
	with(hitbox)
	{
		instance_destroy();
	}
	punched = true;
	hspeed = 6;
	direction = point_direction(player.x, player.y, x, y);
	audio_play_sound(se_deflect,50,0);
}*/
if(punch.image_alpha != 0)
{
	with(hitbox)
	{
		instance_destroy();
	}
	punched = true;
	hspeed = 6;
	direction = point_direction(player.x, player.y, x, y);
	audio_play_sound(se_deflect,50,0);
}
