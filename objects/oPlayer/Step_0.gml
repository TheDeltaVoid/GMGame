// Steuerung mit A und D
hsp = 0;
if (keyboard_check(ord("D"))) hsp += movespeed;
if (keyboard_check(ord("A"))) hsp -= movespeed;





// Springen mit Space
var onGround = place_meeting(x, y + 1, oHitbox);

// Plattform als Boden nur, wenn du *darüber* stehst
var onPlatform = false;
var plat = instance_place(x, y + 1, oPlatform);
if (plat != noone && bbox_bottom <= plat.bbox_top + 2) {
    onPlatform = true;
}

if (onGround || onPlatform) {

    if (keyboard_check_pressed(vk_space)) {
        vsp = jumpspeed;
    }
}







// Gravitation
vsp += grv;

// Horizontale Kollision mit oHitbox
if (place_meeting(x + hsp, y, oHitbox)) {
    while (!place_meeting(x + sign(hsp), y, oHitbox)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertikale Kollision mit oHitbox
if (place_meeting(x, y + vsp, oHitbox)) {
    while (!place_meeting(x, y + sign(vsp), oHitbox)) {
        y += sign(vsp);
    }
    vsp = 0;
}

// One-Way Plattformen (oPlatform)
if (vsp >= 0) {
    var nextY = y + vsp;
    var plat = instance_place(x, nextY, oPlatform);

    if (plat != noone) {
        var playerBottom = bbox_bottom;
        var platformTop = plat.bbox_top;

        if (playerBottom <= platformTop + 1) {
            while (!place_meeting(x, y + sign(vsp), oPlatform)) {
                y += sign(vsp);
            }
            vsp = 0;
        }
    }
}

y += vsp;










