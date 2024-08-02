/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
randomize();

escala = global.escala_hud;
tamcell = global.tamanho_cell;
wcell = 1;		//QUANTIDADE DE CÉLULAS NA LARGURA DO SELETOR
hcell = ds_list_size(pecas_disponiveis);		//QUANTIDADE DE CÉLULAS NA ALTURA DO SELETOR
ds_seletor = ds_grid_create(wcell,hcell);
ds_grid_set_region(ds_seletor,0,0,wcell,hcell,-1);

quantia_pecas = hcell;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < ds_list_size(pecas_disponiveis); yy++) {
		ds_seletor[# xx,yy] = ds_list_find_value(pecas_disponiveis,yy);
		//ds_seletor[# xx,yy] = irandom_range(IdPecas.ChochinObake,IdPecas.AlturaPlayers-1);
	}
}

rh = room_height; rw = room_width;
buff = tamcell/4; margin = 64;
xinv = margin; yinv = margin;
winv = 300; hinv = rh-(margin*2);
xslot_inicial = xinv + (winv/2) - margin; yslot_inicial = (yinv+hinv/2) - (((hcell/2)+1)*tamcell) + (((hcell/2)+1)*buff);

for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < ds_grid_height(ds_seletor); yy++) {
		var x1 = xslot_inicial+(xx*tamcell)+(xx*buff), y1 = yslot_inicial+(yy*tamcell)+(yy*buff);
		
		var inst = instance_create_layer(x1,y1,"Pecas",objParYoukais,{
			peca_id : ds_seletor[# xx,yy]
		});
		
		inst.xtabuleiro = xx;
		inst.ytabuleiro = yy;
		//switch ds_seletor[# xx,yy] {
		//	case IdPecas.ChochinObake:
		//		//var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
		//		//var x2 = x1+tamcell, y2 = y1+tamcell;
				
		//		var inst = instance_create_layer(x1,y1,"Pecas",objChochinObake,{
		//			peca_id : IdPecas.ChochinObake
		//		});
				
		//		inst.xtabuleiro = xx;
		//		inst.ytabuleiro = yy;
		//		break;
		//	case IdPecas.Dotaku:
		//		//var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
		//		//var x2 = x1+tamcell, y2 = y1+tamcell;
				
		//		var inst = instance_create_layer(x1,y1,"Pecas",objDotaku,{
		//			peca_id : IdPecas.Dotaku
		//		});
				
		//		inst.xtabuleiro = xx;
		//		inst.ytabuleiro = yy;
		//		break;
		//	case IdPecas.KasaObake:
		//		//var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
		//		//var x2 = x1+tamcell, y2 = y1+tamcell;
				
		//		var inst = instance_create_layer(x1,y1,"Pecas",objKasaObake,{
		//			peca_id : IdPecas.KasaObake
		//		});
				
		//		inst.xtabuleiro = xx;
		//		inst.ytabuleiro = yy;
		//		break;
		//	case IdPecas.Kappa:
		//		//var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
		//		//var x2 = x1+tamcell, y2 = y1+tamcell;
				
		//		var inst = instance_create_layer(x1,y1,"Pecas",objKappa,{
		//			peca_id : IdPecas.Kappa
		//		});
				
		//		inst.xtabuleiro = xx;
		//		inst.ytabuleiro = yy;
		//		break;
		//	case IdPecas.Tanuki:
		//		//var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
		//		//var x2 = x1+tamcell, y2 = y1+tamcell;
				
		//		var inst = instance_create_layer(x1,y1,"Pecas",objTanuki,{
		//			peca_id : IdPecas.Tanuki
		//		});
				
		//		inst.xtabuleiro = xx;
		//		inst.ytabuleiro = yy;
		//		break;
		//}
	}
}