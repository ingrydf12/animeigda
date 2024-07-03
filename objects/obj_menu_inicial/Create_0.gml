/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

/*
ScriptRunner ->		["NOME", MenuElementType.ScriptRunner, script_to_run],
PageTransfer ->		["NOME", MenuElementType.PageTransfer, MenuPage.PageToTransfer],
Toggle ->			["NOME", MenuElementType.Toggle, script_to_run, InitialValue, [ValueOne, ValueTwo...]],
Slider ->			["NOME", MenuElementType.Slider, script_to_run, InitialValue, [ValueOne, ValueTwo...]],
*/

global.view_w = view_get_wport(view_camera[0]);		//LARGURA DA 'GUI' DO PLAYER
global.view_h = view_get_hport(view_camera[0]);		//ALTURA DA 'GUI' DO PLAYER

ds_menu_main = create_menu_page(
	["INICIAR", MenuElementType.PageTransfer, MenuPage.MapLevel],
	["CONFIGURAÇÕES", MenuElementType.PageTransfer, MenuPage.Settings],
	["SAIR", MenuElementType.ScriptRunner, exit_game]
);

ds_menu_settings = create_menu_page(
	["VÍDEO", MenuElementType.PageTransfer, MenuPage.Video],
	["ÁUDIO", MenuElementType.PageTransfer, MenuPage.Audio],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

ds_menu_video = create_menu_page(
	["TELA CHEIA", MenuElementType.Toggle, change_window_mode, 0, ["OFF", "ON"]],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Settings]
);

ds_menu_audio = create_menu_page(
	["VOLUME GERAL", MenuElementType.Slider, change_volume,		1, [0,1]],
	["EFEITOS SONOROS", MenuElementType.Slider, change_volume,	1, [0,1]],
	["MÚSICA", MenuElementType.Slider, change_volume,		1, [0,1]],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Settings]
);

ds_menu_map_level = create_menu_page(
	["MAPA 1", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["MAPA 2", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["MAPA 3", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["MAPA 4", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["MAPA 5", MenuElementType.ScriptRunner, room_transfer, rm_mapa1],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

page = MenuPage.Main;
menu_pages = [
	ds_menu_main,
	ds_menu_settings,
	ds_menu_video,
	ds_menu_audio,
	ds_menu_map_level
];

var i = 0, arr_leng = array_length(menu_pages);
repeat (arr_leng) {
	menu_option[i] = 0;
	i++;
}

inputting = false;