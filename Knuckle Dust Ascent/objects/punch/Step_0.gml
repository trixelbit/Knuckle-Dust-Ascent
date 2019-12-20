/// @description Insert description here
// You can write your code in this editor

X = player.x + (shoulder_x * player.face);
Y = player.y + shoulder_y;
image_yscale = player.face;

if(global.tap)
{
	state = "jab";
	
}
else
{
	state = "idle";	
}

if(point_distance(x,y,X,Y) < 22)
{
	recovery = false;
}


switch(state)
{
	case "jab":
		image_alpha = 1;
		
		player.hspeed = hspeed/3;
		
		recovery = true;
		
		///rotates arm
		dir =  point_direction(X, Y,global.mouse_Xlast,global.mouse_Ylast);
		dis = point_distance(X, Y, global.mouse_Xlast, global.mouse_Ylast);
		radius = dis < 300 ? dis : 300;
		x = X + lengthdir_x(radius, dir);
		y = Y + lengthdir_y(radius, dir);
		break;
		
	case "idle":
		if(!recovery)
		{
			image_alpha = 0;
		}
		x = lerp(x, X, .25);
		y = lerp(y, Y, .25);
		break;
}