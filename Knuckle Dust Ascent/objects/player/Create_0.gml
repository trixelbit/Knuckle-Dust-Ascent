/// @Creation



state = "idle";

// Create Grid of Skin and Spites
current_skin = 0;
skins = ds_grid_create(30,30);
ds_grid_clear(skins, 0);



//default skin
skins[# current_skin, 0] = spr_boxer1_idle;
skins[# current_skin, 1] = spr_boxer1_idlejab;
skins[# current_skin, 2] = spr_boxer1_trot;	// jump = index ; fall = index = 4;
skins[# current_skin, 3] = spr_boxer1_trotjab; // jump = index ; fall = index = 4;
skins[# current_skin, 4] = spr_boxer1_run;
skins[# current_skin, 15] = spr_boxer1_jab;
