/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

enum IdPecas {
	ChochinObake,Dotaku,KasaObake,Kappa,Tanuki,AlturaPlayers, //YOUKAIS(PLAYER)
	Ashigaru,Lanceiro,Arqueiro,Samurai,Hatamoto,AlturaInimigos,	//INIMIGOS
	Arvore,Pedras,AlturaAmbientacao	//AMBIENTAÇÃO
}

#macro NADA -1
#macro MOUSE_NEUTRO "NEUTRAL"
#macro MOUSE_BLOQUEADO "BLOCK"
#macro MOUSE_CHECKADO "CHECK"
#macro MOUSE_SWITCH "SWITCH"

window_set_cursor(cr_none);
global.mouse_check = MOUSE_NEUTRO;
global.peca_mouse = NADA;
global.tamanho_cell = 64;		//TAMANHO DE CADA CÉLULA DA GRID
global.wcell = 8;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
global.hcell = 8;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.escala_sprites = global.tamanho_cell/64;
//global.color_roof = make_color_rgb(0,255,0);
global.color_roof = c_white;

tamcell = global.tamanho_cell;		//TAMANHO DE CADA CÉLULA DA GRID
wcell = global.wcell;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
hcell = global.hcell;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.grid_tabuleiro = ds_grid_create(wcell,hcell);	//GRID DO TABULEIRO
ds_grid_set_region(global.grid_tabuleiro,0,0,wcell,hcell,NADA);

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
		var spawn = random(1);
		
		if spawn > .85 {
			global.grid_tabuleiro[# xx,yy] = choose(IdPecas.Arvore,IdPecas.Pedras);
		} else {
			global.grid_tabuleiro[# xx,yy] = NADA;
		}
	}
}

instance_create_layer(x,y,"Pecas",obj_seletor_pecas,{
	pecas_disponiveis: [
		choose(IdPecas.ChochinObake,IdPecas.Dotaku,IdPecas.KasaObake,IdPecas.Kappa,IdPecas.Tanuki),
		choose(IdPecas.ChochinObake,IdPecas.Dotaku,IdPecas.KasaObake,IdPecas.Kappa,IdPecas.Tanuki),
		choose(IdPecas.ChochinObake,IdPecas.Dotaku,IdPecas.KasaObake,IdPecas.Kappa,IdPecas.Tanuki),
		choose(IdPecas.ChochinObake,IdPecas.Dotaku,IdPecas.KasaObake,IdPecas.Kappa,IdPecas.Tanuki),
	]
})