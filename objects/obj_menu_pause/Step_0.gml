/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//if room == rm_menu or global.selecao_pecas {exit}

if (keyboard_check_pressed(vk_escape)) {
	audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false,1*global.sfx_volume);
	
	if page != MenuPage.Main {
		global.pause = true;
	} else {
		global.pause = !global.pause;
	}
}

if (!global.pause) {exit}

var ds_grid = menu_pages[page], ds_h = ds_grid_height(ds_grid);

#region INPUTS
var k_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
var k_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_up);
var k_right = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_up);
var k_left = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_up);
var k_enter = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);
var k_escape = keyboard_check_pressed(vk_escape);
#endregion

var input = k_down - k_up;

if inputting {
	input = k_right - k_left;
	
	if input != 0 {
		switch (ds_grid[# 1, menu_option[page]]) {
			case MenuElementType.Toggle:
				var current_value = ds_grid[# 3, menu_option[page]];
				var current_array = ds_grid[# 4, menu_option[page]];
				
				current_value+=input;
				
				if current_value < 0 {current_value = 1}
				if current_value > 1 {current_value = 0};
				
				if current_value != ds_grid[# 3, menu_option[page]] {
					audio_play_sound(snd_anime_sfx_ui_hover,2,false,1*global.sfx_volume);
					
					script_execute(ds_grid[# 2, menu_option[page]], current_value);
				}
				
				ds_grid[# 3, menu_option[page]] = current_value;
				break;
				
			case MenuElementType.Slider:
				current_value = ds_grid[# 3, menu_option[page]];
				
				current_value+=(input*.2);
				current_value = clamp(current_value,0,1);
				
				if ds_grid[# 3, menu_option[page]] != current_value {
					audio_play_sound(snd_anime_sfx_ui_hover,2,false,1*global.sfx_volume);
					
					script_execute(ds_grid[# 2, menu_option[page]], current_value);
				}
				
				ds_grid[# 3, menu_option[page]] = current_value;
				break;
		}
	}
	
	if k_escape or k_enter {
		audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false,1*global.sfx_volume);
		
		inputting = !inputting;
	}
	
} else {
	
	if input != 0 {
		menu_option[page]+=input;
		
		audio_play_sound(snd_anime_sfx_ui_hover,2,false,1*global.sfx_volume);
		
		if menu_option[page] >= ds_h {menu_option[page] = 0}
		if menu_option[page] < 0 {menu_option[page] = ds_h-1}
	}
	
	if k_enter {
		audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false,1*global.sfx_volume);
		
		switch (ds_grid[# 1, menu_option[page]]) {
			case MenuElementType.ScriptRunner: script_execute(ds_grid[# 2, menu_option[page]]); break;
			case MenuElementType.PageTransfer:
				page = ds_grid[# 2, menu_option[page]];
				menu_option[page] = 0;
				break;
			case MenuElementType.Slider:
			case MenuElementType.Toggle:
				inputting = !inputting;
				break;
		}
		
		switch page {
			default:
				back_id = sprMenuInicial
				break;
			case MenuPage.Settings:
				back_id = sprMenuConfiguracoes;
				break;
		}
	}
	
	if k_escape {
		switch page {
			case MenuPage.Settings:
				audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false,1*global.sfx_volume);
				
				back_id = sprMenuInicial
				page = MenuPage.Main;
				break;
		}
	}
}