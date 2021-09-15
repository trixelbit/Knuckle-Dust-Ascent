/// @description Insert description here
// You can write your code in this editor
if(device_mouse_check_button_pressed(0,mb_left) and point_distance(x,y,device_mouse_x(0), device_mouse_y(0)) < 30 )
{
	
	room_goto(manager.active_room);
	

}

x = camera_get_view_width(view_camera[0]) / 2;
y = camera_get_view_height(view_camera[0]) / 2;
image_xscale = 4;
image_yscale = 2;