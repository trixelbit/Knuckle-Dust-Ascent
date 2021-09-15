/// @description Collission with hitbox
if (!invulnerable)
{
	// end hitstun
	alarm[0] = 10;
	// end invulnerable
	alarm[1] = 60;
	
	state = "hit";
	invulnerable = true;
	lives--;
	audio_stop_sound(se_hit);
	audio_play_sound(se_hit,50,0);
	//camera.x += random_range(2,4) * sign(random_range(-1,1));
	//camera.y += random_range(2,4) * sign(random_range(-1,1));
	player_camera.screenshake = 25;
	camera.speed = 6;
	camera.direction = random_range(0,359);
}