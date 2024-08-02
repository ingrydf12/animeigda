/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

ds_menu_main = create_menu_page(
	["RETOMAR", MenuElementType.ScriptRunner, resume_game],
	["OPÇÕES", MenuElementType.PageTransfer, MenuPage.Settings],
	["VOLTAR AO MENU", MenuElementType.ScriptRunner, game_restart]
);

ds_menu_settings = create_menu_page(
	["TELA CHEIA", MenuElementType.Toggle, change_window_mode,	0, ["OFF", "ON"]],
	["GERAL", MenuElementType.Slider, change_volume,			global.master_volume, [0,1]],
	["EFEITOS", MenuElementType.Slider, change_volume,			global.sfx_volume, [0,1]],
	["MÚSICA", MenuElementType.Slider, change_volume,			global.music_volume, [0,1]],
	["VOLTAR", MenuElementType.PageTransfer, MenuPage.Main]
);

page = MenuPage.Main;
menu_pages = [
	ds_menu_main,
	ds_menu_settings
];

var i = 0, arr_leng = array_length(menu_pages);
repeat (arr_leng) {
	menu_option[i] = 0;
	i++;
}

escala = global.escala_hud;
back_id = menu;
inputting = false;
input_color = make_color_rgb(83,14,16);
non_option_color = make_color_rgb(94,82,77);
