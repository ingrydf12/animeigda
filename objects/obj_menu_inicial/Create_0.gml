/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

/*
ScriptRunner ->		["NOME", MenuElementType.ScriptRunner, script_to_run],
PageTransfer ->		["NOME", MenuElementType.PageTransfer, MenuPage.PageToTransfer],
Toggle ->			["NOME", MenuElementType.Toggle, script_to_run, InitialValue, [ValueOne, ValueTwo...]],
Slider ->			["NOME", MenuElementType.Slider, script_to_run, InitialValue, [ValueOne, ValueTwo...]],
Shift ->			["NOME", MenuElementType.Shift, script_to_run, InitialValue, [ValueOne, ValueTwo...]],
*/

audio_play_sound(snd_background_menu,1,true);

global.view_w = view_get_wport(view_camera[0]);		//LARGURA DA 'GUI' DO PLAYER
global.view_h = view_get_hport(view_camera[0]);		//ALTURA DA 'GUI' DO PLAYER

ds_menu_main = create_menu_page(
	["INICIAR", MenuElementType.PageTransfer, MenuPage.MapLevel],
	["OPÇÕES", MenuElementType.PageTransfer, MenuPage.Settings],
	["CRÉDITOS", MenuElementType.PageTransfer, MenuPage.Credits],
	["SAIR", MenuElementType.ScriptRunner, exit_game]
);

ds_menu_settings = create_menu_page(
	["TELA CHEIA", MenuElementType.Toggle, change_window_mode,	0, ["OFF", "ON"]],
	["GERAL", MenuElementType.Slider, change_volume,			global.master_volume, [0,1]],
	["EFEITOS", MenuElementType.Slider, change_volume,			global.sfx_volume, [0,1]],
	["MÚSICA", MenuElementType.Slider, change_volume,			global.music_volume, [0,1]],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

ds_menu_credits = create_menu_page(
	["andretlf", MenuElementType.Shift, noone,	0, ["PRODUTOR"]],
	["Iago Frota", MenuElementType.Shift, noone,	0, ["GAME DESIGNER"]],
	["Babs", MenuElementType.Shift, noone,	0, ["UX DESIGNER"]],
	["Luska", MenuElementType.Shift, noone,	0, ["PROGRAMADOR"]],
	["Seu Vagem", MenuElementType.Shift, noone,	0, ["PIXEL ARTIST"]],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

ds_menu_map_level = create_menu_page(
	["MAPA 1", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["MAPA 2", MenuElementType.ScriptRunner, room_transfer, rm_mapa2],
	["MAPA 3", MenuElementType.ScriptRunner, room_transfer, rm_mapa3],
	["MAPA 4", MenuElementType.ScriptRunner, room_transfer, rm_mapa4],
	["MAPA 5", MenuElementType.ScriptRunner, room_transfer, rm_mapa5],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

page = MenuPage.Main;
menu_pages = [
	ds_menu_main,
	ds_menu_settings,
	ds_menu_credits,
	//ds_menu_video,
	//ds_menu_audio,
	ds_menu_map_level
];

var i = 0, arr_leng = array_length(menu_pages);
repeat (arr_leng) {
	menu_option[i] = 0;
	i++;
}

escala = global.escala_hud;
inputting = false;
input_color = make_color_rgb(83,14,16);
non_option_color = make_color_rgb(94,82,77);
