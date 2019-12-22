/// @description Insert description here
// You can write your code in this editor
if(debug)
{


	//mouse_xstart
	draw_set_color(c_yellow);
	draw_circle(global.mouse_Xstart, global.mouse_Ystart, 5, false);

	//hand calc_xstart

	draw_set_color(c_black);
	draw_circle(
		(mouse_Xstart_margin + camera_get_view_x(camera_get_active())), 
		(mouse_Ystart_margin + camera_get_view_y(camera_get_active())), 
		10, false);


	//mouse_tap
	if(global.tap)
	{
		draw_set_color(c_green);
		draw_circle(mouse_x, mouse_y, 7, false)
	}

	//mouse_xlast
	draw_set_color(c_red); 
	draw_circle(global.mouse_Xlast,global.mouse_Ylast, 5, false);



	//mouse_speed
	draw_set_color(c_white);
	draw_text(10 + camera_get_view_x(camera_get_active()), 10 + camera_get_view_y(camera_get_active()), "X Speed : " + string(global.mouse_Xspeed));
	draw_text(10 + camera_get_view_x(camera_get_active()), 25 + camera_get_view_y(camera_get_active()), "Y Speed : " + string(global.mouse_Yspeed));
	draw_text(10 + camera_get_view_x(camera_get_active()), 40 + camera_get_view_y(camera_get_active()), "Time Held : " + string(global.mouseHeldTime));
	draw_text(10 + camera_get_view_x(camera_get_active()), 
		55 + camera_get_view_y(camera_get_active()), 
		"View_Coordinate : (" + string(camera_get_view_x(camera_get_active())) + ", " + string(camera_get_view_y(camera_get_active())) + ")");
	draw_text(10 + camera_get_view_x(camera_get_active()), 
		70 + camera_get_view_y(camera_get_active()), 
		"Mouse_start_margins : (" + string(mouse_Xstart_margin) + ", " + string(mouse_Ystart_margin) + ")");	
	draw_text(10 + camera_get_view_x(camera_get_active()), 
			85 + camera_get_view_y(camera_get_active()), 
			"Mouse_start : (" + string(global.mouse_Xstart) + ", " + string(global.mouse_Ystart) + ")");
	draw_text(10 + camera_get_view_x(camera_get_active()), 
			100 + camera_get_view_y(camera_get_active()), 
			"Delta Mouse : (" + string(global.mouse_deltaX) + ", " + string(global.mouse_deltaY) + ")");

}

	draw_set_color(c_black);
	draw_circle(
		(mouse_Xstart_margin + camera_get_view_x(camera_get_active())), 
		(mouse_Ystart_margin + camera_get_view_y(camera_get_active())), 
		10, false);



	//mouse_xlast
	draw_set_color(c_red); 
	draw_circle(global.mouse_Xlast,global.mouse_Ylast, 5, false);