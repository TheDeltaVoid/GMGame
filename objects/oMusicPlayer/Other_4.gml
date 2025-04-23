// Welche Musik zu welchem Raum?
switch (room) {
    case rShop:
        if (audio_is_playing(sndSong1)) {
            audio_stop_sound(sndSong1);
        }
        if (!audio_is_playing(sndShop)) {
            audio_play_sound(sndShop, 1, true);
        }
        break;

    case rRoom1:
        if (audio_is_playing(sndShop)) {
            audio_stop_sound(sndShop);
        }
        if (!audio_is_playing(sndSong1)) {
            audio_play_sound(sndSong1, 1, true);
        }
        break;

    // Weitere Räume/Songs hier hinzufügen
}
