/// @description Insert description here
// You can write your code in this editor
draw_sprite(
sprite_index, image_index, 
camera_get_view_width(view_camera[0]) - (sprite_get_width(sprite_index)/2), 
sprite_get_height(sprite_index)/2

);