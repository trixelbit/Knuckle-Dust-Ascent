/// @description Insert description here

#region Change Saws Target once it Reaches its Current Target
if(target != noone and target != undefined and instance_exists(target))
{
	speed = 2;
	// goto possible values: target, noone;
	if(goto == target)
	{
		direction = point_direction(x, y, target.x, target.y);
	}
	else
	{
		direction = point_direction(x, y, xstart, ystart);
	}

	if(goto == target)
	{
		if( point_distance(x, y, target.x, target.y) < abs(speed))
		{
			goto = noone;
		}
	}
	else if (point_distance(x, y, xstart, ystart) < abs(speed))
	{
		goto = target;
	}
}
#endregion

light.x = x;
light.y = y;


image_angle += 10;
image_blend = make_color_hsv(
	wrap( sine_osc(20, 300, 0), 0, 255 ), 
	255, 
	sine_osc(25, 100, 230));



