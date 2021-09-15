/// @description Insert description here
// You can write your code in this editor
/*
view_scale_w = 500;
view_scale_h = (view_scale_w * display_get_height()) / display_get_width();

camera_set_view_size(camera_get_active(), view_scale_w, view_scale_h);
view_camera[0] = view;
view_visible[0] = true;
surface_resize(application_surface,view_scale_w, view_scale_h);

