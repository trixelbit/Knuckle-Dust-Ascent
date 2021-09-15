// Camera set

if(!view_visible[0])
{
	view_scale_w = 500;
	view_scale_h = (view_scale_w * display_get_height()) / display_get_width();
	view_camera[0]  = camera_create_view(0, 0, view_scale_w, view_scale_h, 0, self, 10000, 10000, 100000, 10000);
	view_visible[0] = true;


	window_set_position(0,0);
	window_set_size(display_get_width(), display_get_height());

	surface_resize(application_surface,view_scale_w, view_scale_h);
}

screenshake = 0;