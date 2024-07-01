/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

tamcell = 32;		//TAMANHO DE CADA CÉLULA DA GRID
wcell = 8;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
hcell = 8;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.grid_tabuleiro = ds_grid_create(wcell,hcell);	//GRID DO TABULEIRO
ds_grid_set_region(global.grid_tabuleiro,0,0,wcell,hcell,0);