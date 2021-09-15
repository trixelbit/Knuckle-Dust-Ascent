/// @description Send player to next level
/// @param World
var WORLD = argument0;
var target_level;

if(global.current_level mod 10 == 0)
{
	return shop;
}
else
{

	switch(WORLD)
	{
		case "snow":
			randomize();
			target_level = choose(
			snow_outside_1,
			snow_outside_2
			);
		break;
	}
}

return target_level;


