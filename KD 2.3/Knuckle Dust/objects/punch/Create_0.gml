scr_initialize_shader();

// if arm is returning back to shoulder, recover = true
recovery = false; 
// possible states: idle, punch, and recoild
state = "idle";

// shoulder position offset
shoulder_x = 1;
shoulder_y = -4;

target_touch = 0;

X = 0;
Y = 0;

arm_length = 100;
range_outline_alpha = 0;

//glove properties
strength = 1;
cool_down = 15;
