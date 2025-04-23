// INPUT
move_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
jump_pressed = keyboard_check_pressed(vk_space);
dash_pressed = mouse_check_button_pressed(mb_right);

if (move_input != 0) {
	image_xscale = move_input;
}

// GRAVITY
if (dash_timer <= 0) {
	vsp += grv;
}

// GROUND CHECK + COYOTE TIME
if (place_meeting(x, y + 1, oHitbox) || check_on_platform()) {
    grounded = true;
    coyote_timer = coyote_time_max;
} else {
    grounded = false;
    if (coyote_timer > 0) coyote_timer--;
}

// RESET JUMPS & DASH
if (grounded) {
    jumps_left = 1;
    can_dash = true;
}

// WALL CHECK
wall_dir = 0;
if (place_meeting(x + 1, y, oHitbox)) wall_dir = 1;
if (place_meeting(x - 1, y, oHitbox)) wall_dir = -1;

// WALL SLIDE
wallslide = false;
if (!grounded && wall_dir != 0 && vsp > 0) {
    wallslide = true;
    vsp = min(vsp, 2);
    jumps_left = 1;
}

// JUMPING
if (jump_pressed) {
    if (coyote_timer > 0 || wallslide || jumps_left > 0) {
        vsp = jumpspeed;
        if (!grounded && !wallslide) jumps_left--;
        if (wallslide) hsp = -wall_dir * movespeed * 1.2;
        coyote_timer = 0;
    }
}

// DASH
if (dash_pressed && can_dash) {
    can_dash = false;
    dash_timer = dash_time;
    hsp = move_input != 0 ? move_input * dash_speed : image_xscale * dash_speed;
	vsp = 0;
}

// DASH TIMER
if (dash_timer > 0) {
    dash_timer--;
    if (dash_timer == 0) {
        hsp = 0;
    }
}

// BEWEGUNG
if (dash_timer == 0) {
    if (move_input != 0) {
        hsp = approach(hsp, move_input * maxspeed, accel);
    } else {
        hsp = approach(hsp, 0, decel);
    }
}

// KOLLISION X
if (place_meeting(x + hsp, y, oHitbox)) {
    while (!place_meeting(x + sign(hsp), y, oHitbox)) x += sign(hsp);
    hsp = 0;
}
x += hsp;

// KOLLISION Y (One-Way-Plattformen)
var plat = instance_place(x, y + vsp, oPlatform);
if (vsp > 0 && plat != noone && (y + bbox_bottom - bbox_top) <= plat.bbox_top + 2) {

    while (!place_meeting(x, y + sign(vsp), oPlatform)) y += sign(vsp);
    vsp = 0;
} else if (place_meeting(x, y + vsp, oHitbox)) {
    while (!place_meeting(x, y + sign(vsp), oHitbox)) y += sign(vsp);
    vsp = 0;
}
y += vsp;
