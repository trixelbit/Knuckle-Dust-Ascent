/// @description Insert description here
// You can write your code in this editor
var _i = 0;
randomize();
should_i_spawn_enemy = random_range(0, 100);
if(should_i_spawn_enemy + spawn_increment <= global.difficulty)
{
	if(!place_meeting(x, y, nospawn))
	{
		switch(round(random_range(0,3)))
		{
			case 0:
			#region Walker
				if(place_empty(x,y))
				{
					instance_create_layer(x, y, "obj_back", enemy_walker);
				}
				spawn_increment = 0;
				break;
				#endregion
			
			case 10:
			#region Cannon
				if(place_empty(x,y))
				{
					if(instance_exists(enemy_canon))
					{
						if(point_distance(x, y, instance_nearest(x,y,enemy_canon).x, instance_nearest(x,y,enemy_canon).y) > 100)
						{
							instance_create_layer(x, y, "obj_back", enemy_canon);
						}
						else
						{
							instance_create_layer(x, y, "obj_back", enemy_walker);
						}
					}
					else
					{
						instance_create_layer(x, y, "obj_back", enemy_canon);
					}
				}
				spawn_increment = 0;
				break;
				#endregion
			
			case 2: 
			#region Flyer
				if(place_empty(x,y))
				{
					instance_create_layer(x, y, "obj_back", enemy_flyer);
				}
				spawn_increment = 0;
				break;
				#endregion
			
			case 3:
			#region Saws

				_i = instance_nearest(x,y, saw);

				if(instance_exists(saw) and point_distance(_i.x, _i.y, x, y) > 150 )
				{
					
					var _target = instance_create_layer(x + random_range(100,200) * sign(random_range(-1,1)), y + random_range(100,200) * sign(random_range(-1,1)), "obj_back", saw_target);
					_i = instance_create_layer(x, y, "obj_back", saw);
				
				}
				else if(!instance_exists(saw))
				{
					var _target = instance_create_layer(x + random_range(100,200) * sign(random_range(-1,1)), y + random_range(100,200) * sign(random_range(-1,1)), "obj_back", saw_target);
					_i = instance_create_layer(x, y, "obj_back", saw);
				}
				
				with(_i)
				{
					var _t = random_range(0,100);
					 if (_t <= 25 or place_meeting(target.x, target.y, nospawn))
					 {
						target.x = x;
						target.y = y;
					 }
				}
			
				
				spawn_increment = 0;
				break;
				#endregion
				
			default:
				spawn_increment += 10;
		}	
	}
}

if(x < room_width)
{
	x += 32;
	
}
else
{
	x = 0;
	y += 64;
}

if(y > room_height)
{
	instance_destroy();
}