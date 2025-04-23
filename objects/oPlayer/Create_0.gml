// Movement
hsp = 0;
vsp = 0;
grv = 0.45;
jumpspeed = -10;
movespeed = 5;
accel = 0.5;
decel = 0.3;
maxspeed = 6;

jump_active = false;
jump_timer = 0;
jump_time_max = 15; // anpassen für Gefühl


jump_pressed = false;
jump_time = 0;


// Jump States
jumps_left = 1;
grounded = false;

// Wall Slide
wallslide = false;
wall_dir = 0;

// Dash
can_dash = true;
dash_speed = 15;
dash_time = 8;
dash_timer = 0;

// Input
move_input = 0;
jump_pressed = false;
dash_pressed = false;

// Coyote Time
coyote_time_max = 6;
coyote_timer = 0;

depth = -10




global.spawn_shop_x = 450
global.spawn_shop_y = 380


global.spawn_room1_x = 1980
global.spawn_room1_y = 700
