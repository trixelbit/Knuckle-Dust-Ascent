/// @description Insert description here
// You can write your code in this editor
temp = instance_create_layer(x, y, "obj_front", bullet); 
temp.speed = bullet_speed;
temp.direction = image_angle;
alarm[1] = shoot_interval; 