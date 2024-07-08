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
for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
		var spawn = random(1);
		
		if spawn > .55 {
			global.grid_tabuleiro[# xx,yy] = choose(IdPecas.Arvore,IdPecas.Pedras);
		} else {
			global.grid_tabuleiro[# xx,yy] = NADA;
		}
	}
}

ds_grid_set_region(global.grid_tabuleiro,2,2,wcell-2,hcell-2,NADA);

switch room {
	#region MAPA 1
	case rm_mapa1:
		xsacerdotisa = 4;
		ysacerdotisa = 4;
		global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;
		
		global.grid_tabuleiro[# 11,3] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 8,9] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 4,10] = IdPecas.Ashigaru;
		break;
	#endregion
	
	#region MAP 2
	case rm_mapa2:
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 2,9] = IdPecas.Ashigaru;
		break;
	#endregion
	
	#region MAP 3
	case rm_mapa3:
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 2,9] = IdPecas.Ashigaru;
		break;
	#endregion
	
	#region MAP 4
	case rm_mapa4:
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 2,9] = IdPecas.Ashigaru;
		break;
	#endregion
	
	#region MAP 5
	case rm_mapa5:
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 2,9] = IdPecas.Ashigaru;
		break;
	#endregion
}

var ds_h = ds_grid_height(global.grid_tabuleiro),  ds_w = ds_grid_width(global.grid_tabuleiro);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO

var x1 = xinicial+(xsacerdotisa*tamcell)+(xsacerdotisa*buff), y1 = yinicial+(ysacerdotisa*tamcell)+(ysacerdotisa*buff);
instance_create_layer(x1,y1,"Pecas",objSacerdotisa);

global.selecao_pecas = true;
instance_create_layer(x,y,"Pecas",obj_selecao_pecas);