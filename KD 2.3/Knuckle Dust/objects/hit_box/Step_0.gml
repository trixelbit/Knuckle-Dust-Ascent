/// @description Insert description here
// You can write your code in this editor
if (instance_exists(host))
{
	x = host.x - (host.sprite_xoffset / sprite_width); // - host.sprite_xoffset;
	y = host.y + (host.sprite_yoffset / sprite_height);
}

