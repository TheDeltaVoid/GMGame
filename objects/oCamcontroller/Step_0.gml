// Kamera folgt dem Spieler und zentriert ihn
var cam = view_camera[0];
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

var target_x = oPlayer.x - cam_width / 2;
var target_y = oPlayer.y - cam_height / 2;

camera_set_view_pos(cam, target_x, target_y);
