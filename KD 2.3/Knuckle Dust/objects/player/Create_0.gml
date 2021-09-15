// initialize shader variables
scr_initialize_shader();

global.enemy_count = 0;
state = "idle";
invulnerable = true;
face = 1;
STOP = true;
FREEZE = true;
step = "left";
punch_alt = 0;
alarm[2] = 60;
image_alpha = 0;

enum state
{
	idle,
	dead,
	hit,
	run,
	trot,
	air
}


// play opening door animation
var t = instance_create_layer(x,y, "obj_back", e_basic);
t.sprite_index = spr_playerspawn;


if (!instance_exists(punch))
{
	instance_create_layer(x,y, layer, punch);
	player_camera = instance_create_layer(x,y, layer, camera);
}

//spawn UI
instance_create_layer(x,y,"UI", ui_pause);


#region Create Skins Data Structure and Populate it with Sprites
// Create Grid of Skin and Spites
current_skin = 0;
skins = ds_grid_create(30,30);
ds_grid_clear(skins, 0);


//default skin
skins[# current_skin, 0] = spr_boxer1_idle;
skins[# current_skin, 1] = spr_boxer1_idlejabl;
skins[# current_skin, 2] = spr_boxer1_trot;	// jump = index ; fall = index = 4;
skins[# current_skin, 3] = spr_boxer1_trotjabl; // jump = index ; fall = index = 4;
skins[# current_skin, 4] = spr_boxer1_run;
skins[# current_skin, 5] = spr_boxer1_hit;
skins[# current_skin, 6] = spr_boxer1_jump;
skins[# current_skin, 7] = spr_boxer1_fall;
skins[# current_skin, 8] = spr_boxer1_idlejabr;
skins[# current_skin, 9] = spr_boxer1_trotjabr;
skins[# current_skin, 15] = spr_boxer1_jab;
#endregion