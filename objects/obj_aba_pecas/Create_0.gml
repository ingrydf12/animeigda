/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
randomize();

tamcell = global.tamanho_cell;
wcell = 1;		//QUANTIDADE DE CÉLULAS NA LARGURA DO SELETOR
hcell = array_length(pecas_disponiveis);		//QUANTIDADE DE CÉLULAS NA ALTURA DO SELETOR
ds_seletor = ds_grid_create(wcell,hcell);
ds_grid_set_region(ds_seletor,0,0,wcell,hcell,-1);

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < array_length(pecas_disponiveis); yy++) {
		ds_seletor[# xx,yy] = pecas_disponiveis[yy];
		//ds_seletor[# xx,yy] = irandom_range(IdPecas.ChochinObake,IdPecas.AlturaPlayers-1);
	}
}

var ds_h = ds_grid_height(ds_seletor),  ds_w = ds_grid_width(ds_seletor);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var ds_tab_h = ds_grid_height(global.grid_tabuleiro), ds_tab_w = ds_grid_width(global.grid_tabuleiro);
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-(((ds_tab_w/2)+wcell)*tamcell)-((ds_tab_w+wcell)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO

for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < ds_grid_height(ds_seletor); yy++) {
		switch ds_seletor[# xx,yy] {
			case IdPecas.ChochinObake:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				
				instance_create_layer(x1,y1,"Pecas",objChochinObake,{
					peca_id : IdPecas.ChochinObake
				});
				break;
			case IdPecas.Dotaku:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				
				instance_create_layer(x1,y1,"Pecas",objDotaku,{
					peca_id : IdPecas.Dotaku
				});
				break;
			case IdPecas.KasaObake:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				
				instance_create_layer(x1,y1,"Pecas",objKasaObake,{
					peca_id : IdPecas.KasaObake
				});
				break;
			case IdPecas.Kappa:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				
				instance_create_layer(x1,y1,"Pecas",objKappa,{
					peca_id : IdPecas.Kappa
				});
				break;
			case IdPecas.Tanuki:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				
				instance_create_layer(x1,y1,"Pecas",objTanuki,{
					peca_id : IdPecas.Tanuki
				});
				break;
		}
	}
}