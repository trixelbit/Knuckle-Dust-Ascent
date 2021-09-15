/// @description Insert description here
// You can write your code in this editor
if(!audio_is_playing(m_theme))
{
	audio_play_sound(m_theme,100,1);
	audio_group_set_gain(background_music, global.background_music_volume,1);
}
