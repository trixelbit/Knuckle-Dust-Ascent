//c = camera_create();
view_scale_w = 500;
view_scale_h = (view_scale_w * display_get_height()) / display_get_width();

view = camera_create_view(0, 0, view_scale_w, view_scale_h, 0, player,10000,10000,100000,10000);
view_camera[0] = view;
view_visible[0] = true;
surface_resize(application_surface,view_scale_w, view_scale_h);




window_set_position(0,0);
window_set_size(display_get_width(), display_get_height());