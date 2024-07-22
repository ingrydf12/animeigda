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
		global.mapa_atual = "Mapa 1";
		global.proximo_mapa = "Mapa 2";
		xsacerdotisa = 9;
		ysacerdotisa = 4;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,5,	objAshigaru],
			[IdPecas.Ashigaru,1,7,	objAshigaru],
			[IdPecas.Ashigaru,4,9,	objAshigaru],
			[IdPecas.Ashigaru,6,9,	objAshigaru]
		]
		break;
	#endregion
	
	#region MAPA 2
	case rm_mapa2:
		global.regra_mapa = REGRA_YOUKAIS_SPAWNADOS;
		global.mapa_atual = "Mapa 2";
		global.proximo_mapa = "Mapa 3";
		xsacerdotisa = 10;
		ysacerdotisa = 2;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,4,	objAshigaru],
			[IdPecas.Ashigaru,1,5,	objAshigaru],
			[IdPecas.Ashigaru,1,6,	objAshigaru],
			[IdPecas.Ashigaru,5,10,	objAshigaru],
			[IdPecas.Ashigaru,6,10,	objAshigaru],
			[IdPecas.Arqueiro,0,5,	objArqueiro],
			[IdPecas.Arqueiro,4,10,	objArqueiro],
			[IdPecas.Arqueiro,7,10,	objArqueiro]
		]
		
		array_youkais = [
			[IdPecas.Dotaku,4,5,	objDotaku]
		]
		break;
	#endregion
	
	#region MAPA 3
	case rm_mapa3:
		global.regra_mapa = REGRA_YOUKAIS_SPAWNADOS;
		global.mapa_atual = "Mapa 3";
		global.proximo_mapa = "Mapa 4";
		xsacerdotisa = 9;
		ysacerdotisa = 7;
		
		array_shoguns = [
			[IdPecas.Ashigaru,0,4,	objAshigaru],
			[IdPecas.Ashigaru,0,6,	objAshigaru],
			[IdPecas.Arqueiro,0,5,	objArqueiro],
			[IdPecas.Lanceiro,1,4,	objLanceiro],
			[IdPecas.Lanceiro,1,5,	objLanceiro],
			[IdPecas.Lanceiro,1,6,	objLanceiro]
		]
		
		array_youkais = [
			[IdPecas.Kappa,5,3,	objKappa],
			[IdPecas.Kappa,5,8,	objKappa]
		]
		break;
	#endregion
	
	#region MAPA 4
	case rm_mapa4:
		global.regra_mapa = REGRA_CORRIDA_SHOGUN;
		global.mapa_atual = "Mapa 4";
		global.proximo_mapa = "Mapa 5";
		xsacerdotisa = -1;
		ysacerdotisa = -1;
		
		array_shoguns = [
			[IdPecas.Ashigaru,0,5,	objAshigaru],
			[IdPecas.Ashigaru,0,7,	objAshigaru],
			[IdPecas.Ashigaru,1,7,	objAshigaru],
			[IdPecas.Ashigaru,1,8,	objAshigaru],
			[IdPecas.Arqueiro,0,6,	objArqueiro],
			[IdPecas.Lanceiro,1,4,	objLanceiro],
			[IdPecas.Lanceiro,1,5,	objLanceiro],
			[IdPecas.Samurai,0,4,	objSamurai],
			[IdPecas.Samurai,0,8,	objSamurai]
		]
		
		array_youkais = [
			[IdPecas.KasaObake,5,4,		objKasaObake],
			[IdPecas.KasaObake,5,8,		objKasaObake],
			[IdPecas.Dotaku,4,6,		objDotaku],
			[IdPecas.Tanuki,6,5,		objTanuki],
			[IdPecas.Tanuki,6,6,		objTanuki],
			[IdPecas.Kappa,10,4,		objKappa],
			[IdPecas.ChochinObake,10,5,	objChochinObake],
			[IdPecas.ChochinObake,10,6,	objChochinObake],
		]
		
		break;
	#endregion
	
	#region MAPA 5
	case rm_mapa5:
		global.regra_mapa = REGRA_HORDA;
		global.mapa_atual = "Mapa 5";
		global.proximo_mapa = "Mapa 5";
		xsacerdotisa = 5;
		ysacerdotisa = 5;
		
		array_shoguns = [
			[IdPecas.Ashigaru,1,11,		objAshigaru],
			[IdPecas.Ashigaru,10,11,	objAshigaru],
			[IdPecas.Arqueiro,0,11,		objArqueiro],
			[IdPecas.Arqueiro,11,11,	objArqueiro],
			[IdPecas.Lanceiro,0,0,		objLanceiro],
			[IdPecas.Lanceiro,1,0,		objLanceiro],
			[IdPecas.Lanceiro,10,0,		objLanceiro],
			[IdPecas.Lanceiro,11,0,		objLanceiro],
			[IdPecas.Lanceiro,0,10,		objLanceiro],
			[IdPecas.Lanceiro,11,10,	objLanceiro],
			[IdPecas.Samurai,0,1,		objSamurai],
			[IdPecas.Samurai,1,1,		objSamurai],
			[IdPecas.Samurai,10,1,		objSamurai],
			[IdPecas.Samurai,11,1,		objSamurai],
			[IdPecas.Hatamoto,1,10,		objHatamoto],
			[IdPecas.Hatamoto,10,10,	objHatamoto],
		]
		
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

var x1 = xinicial+(xsacerdotisa*tamcell)+(xsacerdotisa*buff), y1 = yinicial+(ysacerdotisa*tamcell)+(ysacerdotisa*buff);
switch global.regra_mapa {
	case noone:
		instance_create_layer(x1,y1,"Pecas",objSacerdotisa);
		break;
	case REGRA_YOUKAIS_SPAWNADOS:
		instance_create_layer(x1,y1,"Pecas",objSacerdotisa);
		
		for (var i = 0; i < array_length(array_youkais); i++) {
			var arr = array_youkais[i];
			var xx = arr[1];
			var yy = arr[2];
	
			global.grid_tabuleiro[# xx,yy] = arr[0];
			x1 = xinicial+(xx*tamcell)+(xx*buff); y1 = yinicial+(yy*tamcell)+(yy*buff);
			instance_create_layer(x1,y1,"Pecas",arr[3],{
				no_tabuleiro : true,
				xtabuleiro : xx,
				ytabuleiro : yy,
				peca_id : arr[0]
			});
		}
		break;
	case REGRA_CORRIDA_SHOGUN:
		for (var i = 0; i < array_length(array_youkais); i++) {
			var arr = array_youkais[i];
			var xx = arr[1];
			var yy = arr[2];
			
			global.grid_tabuleiro[# xx,yy] = arr[0];
			x1 = xinicial+(xx*tamcell)+(xx*buff); y1 = yinicial+(yy*tamcell)+(yy*buff);
			instance_create_layer(x1,y1,"Pecas",arr[3],{
				no_tabuleiro : true,
				xtabuleiro : xx,
				ytabuleiro : yy,
				peca_id : arr[0]
			});
		}
		break;
	case REGRA_HORDA:
		instance_create_layer(x1,y1,"Pecas",objSacerdotisa);
		break;
}

for (var i = 0; i < array_length(array_shoguns); i++) {
	var arr = array_shoguns[i];
	var xx = arr[1];
	var yy = arr[2];
	
	global.grid_tabuleiro[# xx,yy] = arr[0];
	
	x1 = xinicial+(xx*tamcell)+(xx*buff); y1 = yinicial+(yy*tamcell)+(yy*buff);
	instance_create_layer(x1,y1,"Pecas",arr[3],{
		//visible : false,
		xtabuleiro : xx,
		ytabuleiro : yy,
		shogun_id : arr[0]
	});
}

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(global.grid_tabuleiro); xx++) {
	for (var yy = 0; yy < ds_grid_height(global.grid_tabuleiro); yy++) {
		x1 = xinicial+(xx*tamcell)+(xx*buff); y1 = yinicial+(yy*tamcell)+(yy*buff);
		switch global.grid_tabuleiro[# xx,yy] {
			case IdPecas.Arvore:
				instance_create_layer(x1,y1,"Pecas",objArvore);
				break;
			case IdPecas.Pedras:
				instance_create_layer(x1,y1,"Pecas",objPedras);
				break;
			case IdPecas.Agua:
				instance_create_layer(x1,y1,"Pecas",objAgua);
				break;
		}
	}
}



global.selecao_pecas = true;
instance_create_layer(x,y,"Pecas",obj_selecao_pecas);