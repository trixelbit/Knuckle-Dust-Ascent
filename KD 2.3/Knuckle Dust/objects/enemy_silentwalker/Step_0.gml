/// @description Insert description here
// You can write your code in this editor
event_inherited();

scr_gravity(1,270);

#region movement
if(point_distance(x,y, player.x, player.y) > 280)
{
	
	hspeed = sign( player.x - x ) * 1;
	image_speed = .8;
	
	if(place_free(x + hspeed,y))
	{
		hspeed = 0;
	}
}
else if(point_distance(x,y, player.x, player.y) < 150)
{
	hspeed = - sign( player.x - x ) * 1;
	image_speed = -.8;
	
	if(place_free(x + hspeed,y))
	{
		hspeed = 0;
	}
	
	if(instance_number(enemy_hand) = 0)
	{
		instance_create_layer(player.x + (player.hspeed * 10) + 40, y + 62, "obj_top", enemy_hand);
	}
}
else
{
	hspeed = 0;
	image_index = 0;
	image_speed = 0;
}
#endregion

#region particle effect
for(var i = 0; i < 4; i++ )
{
	
	if(i == 0)
	{
		var _i = instance_create_layer(x,y, "obj_top", e_fade);
	}
	else
	{
		var _i = instance_create_layer(x,y, "obj_back", e_fade);
	}
	_i.sprite_index = spr_bullet1;
	_i.image_blend = make_color_rgb( 0, 0 , 0 );
	_i.x += random_range(-20,20 );
	_i.y += random_range(-38, 70);
	_i.hspeed = random_range(-1,1);
	_i.vspeed = random_range(-3,-1);
	_i.fade_speed = .015;
}
#endregion

if (current_time mod 240 <= 1 )
{
	instance_create_layer(x,y,"obj_back", enemy_flyer);
}