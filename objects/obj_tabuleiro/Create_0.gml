/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

global.peca_mouse = -1;
global.tamanho_cell = 32;		//TAMANHO DE CADA CÉLULA DA GRID
global.wcell = 8;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
global.hcell = 8;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO

tamcell = global.tamanho_cell;		//TAMANHO DE CADA CÉLULA DA GRID
wcell = global.wcell;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
hcell = global.hcell;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.grid_tabuleiro = ds_grid_create(wcell,hcell);	//GRID DO TABULEIRO
ds_grid_set_region(global.grid_tabuleiro,0,0,wcell,hcell,-1);