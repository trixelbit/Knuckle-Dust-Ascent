/// @description Insert description here
// You can write your code in this editor
if(debug)
{


	//mouse_xstart
	draw_set_color(c_yellow);
	draw_circle(global.mouse_Xstart ,global.mouse_Ystart, 5, false);


	//mouse_xlast
	draw_set_color(c_red);
	draw_circle(global.mouse_Xlast,global.mouse_Ylast, 5, false);



	//mouse_speed
	draw_set_color(c_white);
	draw_text(10 + camera_get_view_x(camera_get_active()), 10 + camera_get_view_y(camera_get_active()), "X Speed : " + string(global.mouse_Xspeed));
	draw_text(10 + camera_get_view_x(camera_get_active()), 25 + camera_get_view_y(camera_get_active()), "Y Speed : " + string(global.mouse_Yspeed));
	draw_text(10 + camera_get_view_x(camera_get_active()), 40 + camera_get_view_y(camera_get_active()), "Time Held : " + string(global.mouseHeldTime));
	
}