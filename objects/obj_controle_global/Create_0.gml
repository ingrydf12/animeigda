/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVELS GLOBAIS
global.view_w = view_get_wport(view_camera[0]);		//LARGURA DA 'GUI' DO PLAYER
global.view_h = view_get_hport(view_camera[0]);		//ALTURA DA 'GUI' DO PLAYER
global.pause = false;
global.escala_hud = global.view_w/1280;
global.master_volume = 1;
global.sfx_volume = 1;
global.music_volume = 1;

audio_master_gain(global.master_volume);

//MENU
enum MenuPage {
	Main,
	Settings,
	Credits,
	//Video,
	//Audio,
	MapLevel,
	TroopsSelect,
	Height
}

enum MenuElementType {
	ScriptRunner,
	PageTransfer,
	Toggle,
	Slider,
	Shift
}

//PEÇAS
enum IdPecas {
	ChochinObake,Dotaku,KasaObake,Kappa,Tanuki,AlturaPlayers, //YOUKAIS(PLAYER)
	Ashigaru,Lanceiro,Arqueiro,Samurai,Hatamoto,AlturaInimigos,	//INIMIGOS
	Arvore,Pedras,Agua,AlturaAmbientacao,	//AMBIENTAÇÃO
	Sacerdotisa
}

//MACROS
#macro NADA -1
#macro MOUSE_NEUTRO "NEUTRAL"
#macro MOUSE_BLOQUEADO "BLOCK"
#macro MOUSE_CHECKADO "CHECK"
#macro MOUSE_SWITCH "SWITCH"
#macro MOUSE_ATAQUE "ATAQUE"
#macro MOUSE_INTERACT "INTERACT"
#macro TURNO_JOGADOR "Jogador"
#macro TURNO_INIMIGO "Inimigo"

#macro REGRA_YOUKAIS_SPAWNADOS "tem bixo aqui"
#macro REGRA_MAPA_PERSONAL "eu que essa bagaça de mapa"
#macro REGRA_CORRIDA_SHOGUN "corrida fds"
#macro REGRA_HORDA "battle beetle reference"

#macro TILE_MOVE "move"
#macro TILE_ATTACK "attack"

//TABULEIRO
window_set_cursor(cr_none);	//SUMIR O MOUSE
global.mouse_check = MOUSE_NEUTRO;
global.peca_mouse = NADA;
global.tamanho_cell = 64;		//TAMANHO DE CADA CÉLULA DA GRID
global.wcell = 12;				//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
global.hcell = 12;				//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.escala_sprites = global.tamanho_cell/sprite_get_width(spr_teste);
//global.color_roof = make_color_rgb(0,255,0);
global.color_roof = make_color_rgb(50,50,50);

global.turno = TURNO_JOGADOR;
global.sacerdotisa_vida = 10;

global.informacoes_peca = false;
global.informacoes_peca_inst = noone;

if file_exists("save.sav") {
	ini_open("save.sav");
	
	ini_write_real("mapas_liberados","Mapa 1",true);
	
	ini_close();
}