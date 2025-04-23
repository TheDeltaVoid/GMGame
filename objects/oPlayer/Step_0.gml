// Steuerung mit A und D für Bewegung
hsp = 0;
if (keyboard_check(ord("D"))) hsp += movespeed;  // D
if (keyboard_check(ord("A"))) hsp -= movespeed;  // A

// Springen mit Space
if (place_meeting(x, y + 1, oHitbox)) {
    if (keyboard_check_pressed(vk_space)) {  // Space für Sprung
        vsp = jumpspeed;
    }
}

// Gravitation
vsp += grv;

// Horizontale Kollision
if (place_meeting(x + hsp, y, oHitbox)) {
    while (!place_meeting(x + sign(hsp), y, oHitbox)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertikale Kollision
if (place_meeting(x, y + vsp, oHitbox)) {
    while (!place_meeting(x, y + sign(vsp), oHitbox)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
