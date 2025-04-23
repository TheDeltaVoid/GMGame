// Fade-Mechanismus
if (fade_in) {
    // Fade-In
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        fade_in = false;
        
        // Sobald der Fade-In abgeschlossen ist, Raumwechsel durchführen
        room_goto(next_room);  // Der Raum wird jetzt gewechselt
    }
} else {
    // Fade-Out
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        instance_destroy();  // Zerstöre den Fader nach dem Fade-Out
    }
}

// Zeichnen des schwarzen Bildschirms (Fader)
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
