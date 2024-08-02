/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
function create_menu_page(){
	///@arg ["NOME", Type, Execution...]
	
	var args, yy = 0;
	repeat(argument_count) {
		args[yy] = argument[yy];
		yy++;
	}
	
	var ds_grid = ds_grid_create(5, array_length(args));
	
	yy = 0;
	repeat(argument_count) {
		var array = args[yy];
		var array_l = array_length(array);
		
		var xx = 0; repeat(array_l) {
			ds_grid[# xx, yy] = array[xx];
			xx++
		}
		yy++
	}
	
	return ds_grid;
}

function room_transfer() {
	var ds_grid = menu_pages[page];
	
	room_goto(ds_grid[# 3, menu_option[page]]);
}

function resume_game() {
	global.pause = false;
}

function exit_game() {
	game_end();
}

function change_volume() {
	var type = menu_option[page];
	
	switch type {
		case 1:
			global.master_volume = argument[0];
			audio_master_gain(global.master_volume);
			break;
		case 2: global.sfx_volume = argument[0]; break;
		case 3:
			global.music_volume = argument[0];
			if room == rm_menu {
				audio_sound_gain(snd_background_menu,global.music_volume,5);
			} else {
				audio_sound_gain(snd_background_gameplay,global.music_volume,5);
			}
			break;
	}
}

function change_window_mode() {
	window_set_fullscreen(!window_get_fullscreen());
}