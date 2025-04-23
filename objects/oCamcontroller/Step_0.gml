// Kamera folgt dem Spieler und zentriert ihn
var cam = view_camera[0];
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

var old_x = camera_get_view_x(cam);
var old_y = camera_get_view_y(cam);

var target_x = oPlayer.x - cam_width / 2;
var target_y = oPlayer.y - cam_height / 2;

var diff_x = target_x - old_x
var diff_y = target_y - old_y;

var final_x = old_x + diff_x * easing_value * (delta_time / 1000000);
var final_y = old_y + diff_y * easing_value * (delta_time / 1000000);

camera_set_view_pos(cam, final_x, final_y);
