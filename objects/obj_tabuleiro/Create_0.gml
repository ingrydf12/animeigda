/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

randomize();

tamcell = global.tamanho_cell;		//TAMANHO DE CADA CÉLULA DA GRID
wcell = global.wcell;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
hcell = global.hcell;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.grid_tabuleiro = ds_grid_create(wcell,hcell);	//GRID DO TABULEIRO
ds_grid_set_region(global.grid_tabuleiro,0,0,wcell,hcell,NADA);

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
//for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
//	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
//		var spawn = random(1);
		
//		if spawn > .85 {
//			global.grid_tabuleiro[# xx,yy] = choose(IdPecas.Arvore,IdPecas.Pedras);
//		} else {
//			global.grid_tabuleiro[# xx,yy] = NADA;
//		}
//	}
//}

switch room {
	#region MAPA 1
	case rm_mapa1:
		global.grid_tabuleiro[# 0,0] = IdPecas.Pedras;
		global.grid_tabuleiro[# 2,0] = IdPecas.Pedras;
		global.grid_tabuleiro[# 5,0] = IdPecas.Pedras;
		global.grid_tabuleiro[# 7,0] = IdPecas.Pedras;
		global.grid_tabuleiro[# 8,0] = IdPecas.Pedras;
		
		global.grid_tabuleiro[# 0,1] = IdPecas.Pedras;
		global.grid_tabuleiro[# 1,1] = IdPecas.Arvore;
		global.grid_tabuleiro[# 6,1] = IdPecas.Arvore;
		global.grid_tabuleiro[# 8,1] = IdPecas.Arvore;
		
		global.grid_tabuleiro[# 0,2] = IdPecas.Arvore;
		
		global.grid_tabuleiro[# 1,3] = IdPecas.Arvore;
		
		global.grid_tabuleiro[# 1,6] = IdPecas.Arvore;
		
		global.grid_tabuleiro[# 0,7] = IdPecas.Pedras;
		global.grid_tabuleiro[# 1,7] = IdPecas.Pedras;
		global.grid_tabuleiro[# 7,7] = IdPecas.Pedras;
		global.grid_tabuleiro[# 8,7] = IdPecas.Arvore;
		
		global.grid_tabuleiro[# 2,8] = IdPecas.Arvore;
		global.grid_tabuleiro[# 6,8] = IdPecas.Arvore;
		global.grid_tabuleiro[# 7,8] = IdPecas.Pedras;
		break;
}

global.selecao_pecas = true;
instance_create_layer(x,y,"Pecas",obj_selecao_pecas);