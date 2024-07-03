/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVELS GLOBAIS
global.view_w = view_get_wport(view_camera[0]);		//LARGURA DA 'GUI' DO PLAYER
global.view_h = view_get_hport(view_camera[0]);		//ALTURA DA 'GUI' DO PLAYER
global.pause = false;

//MENU
enum MenuPage {
	Main,
	Settings,
	Video,
	Audio,
	MapLevel,
	TroopsSelect,
	Height
}

enum MenuElementType {
	ScriptRunner,
	PageTransfer,
	Toggle,
	Slider
}

//PEÇAS
enum IdPecas {
	ChochinObake,Dotaku,KasaObake,Kappa,Tanuki,AlturaPlayers, //YOUKAIS(PLAYER)
	Ashigaru,Lanceiro,Arqueiro,Samurai,Hatamoto,AlturaInimigos,	//INIMIGOS
	Arvore,Pedras,AlturaAmbientacao	//AMBIENTAÇÃO
}

//MACROS
#macro NADA -1
#macro MOUSE_NEUTRO "NEUTRAL"
#macro MOUSE_BLOQUEADO "BLOCK"
#macro MOUSE_CHECKADO "CHECK"
#macro MOUSE_SWITCH "SWITCH"

//TABULEIRO
window_set_cursor(cr_none);	//SUMIR O MOUSE
global.mouse_check = MOUSE_NEUTRO;
global.peca_mouse = NADA;
global.tamanho_cell = 64;		//TAMANHO DE CADA CÉLULA DA GRID
global.wcell = 9;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
global.hcell = 9;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.escala_sprites = global.tamanho_cell/64;
//global.color_roof = make_color_rgb(0,255,0);
global.color_roof = c_gray;