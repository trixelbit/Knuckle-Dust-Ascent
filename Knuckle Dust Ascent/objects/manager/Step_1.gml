/// @description Insert description here
// You can write your code in this editor


global.mouseHeld = mouse_check_button(mb_left);
global.tap = false;


if(mouse_check_button_pressed(mb_left))
{
		global.mouse_Xstart = mouse_x;
		global.mouse_Ystart = mouse_y;	
		mouse_Xstart_margin = mouse_x - camera_get_view_x(view_camera[0]);
		mouse_Ystart_margin = mouse_y - camera_get_view_y(view_camera[0]);
}

if(mouse_check_button_released(mb_left))
{
	if(global.mouseHeldTime < 7)
	{
		global.tap = true;
	}
}



if(global.mouseHeld)
{	
	global.mouseHeldTime++;
	
	global.mouse_Xlast = mouse_x;
	global.mouse_Ylast = mouse_y;
	
	global.mouse_deltaX = mouse_x - global.mouse_Xstart;
	global.mouse_deltaY = mouse_y - global.mouse_Ystart;
	
	global.mouse_Xspeed = global.mouse_deltaX / global.mouseHeldTime;
	global.mouse_Yspeed = global.mouse_deltaY / global.mouseHeldTime;
	
	
}
else
{
	global.mouseHeldTime = 0;
	global.mouse_Xlast = lerp(global.mouse_Xlast, global.mouse_Xstart, .1);
	global.mouse_Ylast = lerp(global.mouse_Ylast, global.mouse_Ystart, .1);
}

global.mouse_Xstart = mouse_Xstart_margin + camera_get_view_x(view_camera[0]);
global.mouse_Ystart = mouse_Ystart_margin + camera_get_view_y(view_camera[0]);
