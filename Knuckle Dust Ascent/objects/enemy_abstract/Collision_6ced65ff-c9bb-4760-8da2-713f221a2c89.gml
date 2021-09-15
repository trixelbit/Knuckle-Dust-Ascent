/// @description Insert description here
// You can write your code in this editor
if(!hit_stun and punch.recovery)
{
	hit_stun = true;
	alarm[0] = hit_stun_duration;
	hp -= punch.strength
	image_alpha = .6;
	audio_play_sound(se_punch,25,0);
	audio_play_sound(s_metal_hit1,25,0);
	var effect = scr_particle_effect(other.x, other.y, spr_e_hit1, 2.5, .5);
	effect.image_xscale = .35;
	effect.image_yscale = .35;
}