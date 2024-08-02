/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

view_set_wport(view_camera[0],global.view_w);
view_set_hport(view_camera[0],global.view_h);

camera_set_view_size(view_camera[0],room_width,room_height);

if room != rm_menu {
	audio_play_sound(snd_background_gameplay,1,true,1*global.music_volume);
}