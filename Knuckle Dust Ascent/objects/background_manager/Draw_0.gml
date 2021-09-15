/// @description Insert description here
// You can write your code in this editor
var yoff = -60;// -60 + (global.current_level * 5);
var spd = .01;
draw_sprite(spr_winter_sky, 0, 
	camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + yoff);
draw_sprite(spr_winter_clouds1,  round(frac(xoffset * spd)),  
	(-0.1 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]) + wrap((xoffset  * spd), 0, 500),
	(-1 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + yoff); 
draw_sprite(spr_winter_clouds1, round(frac(xoffset * spd)),  
	(-0.1 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]) + wrap((xoffset * spd), 0, 500) + 500 , 
	(-1 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + yoff); 
	
var spd = .05;

//mountain
draw_sprite(spr_winter_mountain, 0, 
	(-0.1 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]), 
	(-1 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + yoff);
draw_sprite(spr_winter_clouds1, round(frac(xoffset * spd)),  
	(-0.1 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]) + wrap((xoffset * spd), 0, 500), 
	(-1 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + 30 + yoff); 
draw_sprite(spr_winter_clouds1, round(frac(xoffset * spd)),  
	(-0.1 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]) + wrap((xoffset * spd), 0, 500) + 500, 
	(-1 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + 30 + yoff); 

draw_sprite(spr_winter_town2, 0,  
	(-2 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]), 
	(-20 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + yoff); 
draw_sprite(spr_winter_town1, 0,  
	(-5 * camera_get_view_x(view_camera[0])/ room_width) + camera_get_view_x(view_camera[0]), 
	(-50 * camera_get_view_y(view_camera[0])/ room_height) + camera_get_view_y(view_camera[0]) + yoff); 
	

draw_set_alpha(0.4);
draw_set_color(make_color_rgb(210,247,255));
draw_rectangle(0,0,room_width, room_height, false);
draw_set_alpha(1);
