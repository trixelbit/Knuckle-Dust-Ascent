/// @description Insert description here
// You can write your code in this editor
event_inherited();


// try and fail to deal with collision
if( !place_free(x, vspeed + y))
{
	vspeed = -vspeed;
}
if( !place_free(x + hspeed, y))
{
	hspeed = -hspeed;
}


direction = lerp(direction, wrap(0, 359, point_direction(x ,y, player.x, player.y)), .025);
speed = 2;

// face the player yo dumbo
if(x < player.x)
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}

#region particle spawn
var _i = instance_create_layer(x,y, "obj_back", e_fade);
_i.sprite_index = spr_bullet1;
_i.image_blend = make_color_rgb( 255, 5 , 60 );
_i.x += random_range(-8, 8);
_i.y += random_range(-8, 8);
_i.speed = random_range(-1, 1);
_i.direction = random_range(0, 359);
#endregion