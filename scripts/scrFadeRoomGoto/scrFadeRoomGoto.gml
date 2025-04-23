// Diese Funktion wird aufgerufen, wenn der Raumwechsel mit Fade durchgeführt werden soll
function fade_room_goto(target_room) {
    // Wenn der Fader bereits aktiv ist, warten wir auf den Abschluss
    if (instance_exists(oRoomFader)) {
        oRoomFader.fading_out = true;
        oRoomFader.target_room = target_room;
    } else {
        // Fader erstellen, wenn er noch nicht existiert
        var fader = instance_create_layer(0, 0, "GUI", oRoomFader);
        fader.fading_out = true;
        fader.target_room = target_room;
    }
}
