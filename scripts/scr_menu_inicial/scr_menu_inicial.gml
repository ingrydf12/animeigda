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
	
}

function change_window_mode() {
	window_set_fullscreen(!window_get_fullscreen());
}