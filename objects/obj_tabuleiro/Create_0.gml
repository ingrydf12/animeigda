/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

randomize();

global.primeiro_turno = true;

tamcell = global.tamanho_cell;		//TAMANHO DE CADA CÉLULA DA GRID
wcell = global.wcell;			//QUANTIDADE DE CÉLULAS NA LARGURA DO TABULEIRO
hcell = global.hcell;			//QUANTIDADE DE CÉLULAS NA ALTURA DO TABULEIRO
global.grid_tabuleiro = ds_grid_create(wcell,hcell);	//GRID DO TABULEIRO
ds_grid_set_region(global.grid_tabuleiro,0,0,wcell,hcell,NADA);

var ds_h = ds_grid_height(global.grid_tabuleiro),  ds_w = ds_grid_width(global.grid_tabuleiro);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO

switch room {
	
	#region MAPA 1
	case rm_mapa1:
		global.regra_mapa = noone;
		xsacerdotisa = 9;
		ysacerdotisa = 4;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,5],
			[IdPecas.Ashigaru,1,7],
			[IdPecas.Ashigaru,4,9],
			[IdPecas.Ashigaru,6,9],
		]
		
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(5*tamcell)+(5*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(7*tamcell)+(7*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(4*tamcell)+(4*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(6*tamcell)+(6*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objAshigaru,{visible: false});
		break;
	#endregion
	
	#region MAP 2
	case rm_mapa2:
		global.regra_mapa = REGRA_YOUKAIS_SPAWNADOS;
		xsacerdotisa = 10;
		ysacerdotisa = 2;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,4],
			[IdPecas.Ashigaru,1,5],
			[IdPecas.Ashigaru,1,6],
			[IdPecas.Ashigaru,5,10],
			[IdPecas.Ashigaru,6,10],
			[IdPecas.Arqueiro,0,5],
			[IdPecas.Arqueiro,4,10],
			[IdPecas.Arqueiro,7,10],
		]
		
		array_youkais = [
			[IdPecas.Dotaku,4,5]
		]
		
		//global.grid_tabuleiro[# 1,4] = IdPecas.Ashigaru;
		//global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		//global.grid_tabuleiro[# 1,6] = IdPecas.Ashigaru;
		
		instance_create_layer(xinicial+(5*tamcell)+(5*buff),yinicial+(1*tamcell)+(1*buff),"Pecas",objLanceiro,{visible: false});
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(5*tamcell)+(5*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(2*tamcell)+(2*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objArqueiro,{visible: false});
		break;
	#endregion
	
	#region MAP 3
	case rm_mapa3:
		global.regra_mapa = REGRA_YOUKAIS_SPAWNADOS;
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,5],
			[IdPecas.Ashigaru,1,7],
			[IdPecas.Ashigaru,4,9],
			[IdPecas.Ashigaru,6,9],
		]
		
		array_youkais = [
			[IdPecas.Kappa,5,3],
			[IdPecas.Kappa,5,8]
		]
		
		instance_create_layer(xinicial+(5*tamcell)+(5*buff),yinicial+(1*tamcell)+(1*buff),"Pecas",objLanceiro,{visible: false});
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(5*tamcell)+(5*buff),"Pecas",objLanceiro,{visible: false});
		instance_create_layer(xinicial+(2*tamcell)+(2*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objArqueiro,{visible: false});
		break;
	#endregion
	
	#region MAP 4
	case rm_mapa4:
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 2,9] = IdPecas.Arqueiro;
		
		instance_create_layer(xinicial+(5*tamcell)+(5*buff),yinicial+(1*tamcell)+(1*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(5*tamcell)+(5*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(2*tamcell)+(2*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objArqueiro,{visible: false});
		break;
	#endregion
	
	#region MAP 5
	case rm_mapa5:
		xsacerdotisa = 5;
		ysacerdotisa = 5;
		
		global.grid_tabuleiro[# 5,1] = IdPecas.Ashigaru;
		global.grid_tabuleiro[# 1,5] = IdPecas.Samurai;
		global.grid_tabuleiro[# 2,9] = IdPecas.Hatamoto;
		
		instance_create_layer(xinicial+(5*tamcell)+(5*buff),yinicial+(1*tamcell)+(1*buff),"Pecas",objAshigaru,{visible: false});
		instance_create_layer(xinicial+(1*tamcell)+(1*buff),yinicial+(5*tamcell)+(5*buff),"Pecas",objSamurai,{visible: false});
		instance_create_layer(xinicial+(2*tamcell)+(2*buff),yinicial+(9*tamcell)+(9*buff),"Pecas",objHatamoto,{visible: false});
		break;
	#endregion
}

var i = 0; repeat(array_length(array_shoguns)) {
	var arr = array_shoguns[i];
	var xx = arr[1];
	var yy = arr[2];
	
	global.grid_tabuleiro[# xx,yy] = arr[0];
	
	i++;
}

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
		var spawn = random(1);
		
		if spawn > .55 {
			switch room {
				default:
					global.grid_tabuleiro[# xx,yy] = IdPecas.Arvore;
					break;
				case rm_mapa2:
					global.grid_tabuleiro[# xx,yy] = choose(IdPecas.Arvore,IdPecas.Pedras);
					break;
				case rm_mapa3:
					global.grid_tabuleiro[# xx,yy] = choose(IdPecas.Arvore,IdPecas.Pedras,IdPecas.Agua);
					break;
			}
		} else {
			global.grid_tabuleiro[# xx,yy] = NADA;
		}
	}
}

ds_grid_set_region(global.grid_tabuleiro,2,2,wcell-2,hcell-2,NADA);

global.grid_tabuleiro[# xsacerdotisa,ysacerdotisa] = IdPecas.Sacerdotisa;

switch global.regra_mapa {
	case REGRA_YOUKAIS_SPAWNADOS:
		for (var i = 0; i < array_length(array_youkais); i++) {
			var arr = array_youkais[i];
			var xx = arr[1];
			var yy = arr[2];
	
			global.grid_tabuleiro[# xx,yy] = arr[0];
		}
		break;
}

for (var i = 0; i < array_length(array_shoguns); i++) {
	var arr = array_shoguns[i];
	var xx = arr[1];
	var yy = arr[2];
	
	global.grid_tabuleiro[# xx,yy] = arr[0];
}

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
		switch global.grid_tabuleiro[# xx,yy] {
			case IdPecas.Arvore:
				instance_create_layer(xinicial+(xx*tamcell)+(xx*buff),yinicial+(yy*tamcell)+(yy*buff),"Pecas",objArvore);
				break;
			case IdPecas.Pedras:
				instance_create_layer(xinicial+(xx*tamcell)+(xx*buff),yinicial+(yy*tamcell)+(yy*buff),"Pecas",objPedras);
				break;
			case IdPecas.Agua:
				instance_create_layer(xinicial+(xx*tamcell)+(xx*buff),yinicial+(yy*tamcell)+(yy*buff),"Pecas",objAgua);
				break;
			case IdPecas.Sacerdotisa:
				var x1 = xinicial+(xsacerdotisa*tamcell)+(xsacerdotisa*buff), y1 = yinicial+(ysacerdotisa*tamcell)+(ysacerdotisa*buff);
				instance_create_layer(x1,y1,"Pecas",objSacerdotisa);
				break;
		}
	}
}



global.selecao_pecas = true;
instance_create_layer(x,y,"Pecas",obj_selecao_pecas);