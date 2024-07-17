/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if room == rm_menu {exit}

//VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6, tamcell = global.tamanho_cell;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO


if global.turno == TURNO_INIMIGO {
	timer_action++;
	inst_limit = instance_number(objParShoguns);
	
	if timer_action >= TIMEOUT {
		timer_action = 0;
		
		if num_inst < inst_limit {
			var inst = instance_find(objParShoguns, num_inst);
			var xx = inst.xtabuleiro, yy = inst.ytabuleiro;
			xtab = inst.xtabuleiro;
			ytab = inst.ytabuleiro;
			
			//AÇÕES DAS PEÇAS
			var lado = choose(0,1), quantia_andada = 0;
			
			if lado == 0 {//ANDAR NO X
				quantia_andada = irandom_range(-inst.moves, inst.moves);
				if (ds_g[# xx+quantia_andada,yy] == NADA) {
					ds_g[# xx,yy] = NADA;
					inst.xtabuleiro += quantia_andada;
					
					xx = inst.xtabuleiro;
					ds_g[# xx,yy] = inst.shogun_id;
				}
				
			} else {//ANDAR NO Y
				quantia_andada = irandom_range(1, inst.moves);
				
				if (ds_g[# xx,yy+quantia_andada] == NADA) {
					ds_g[# xx,yy] = NADA;
					inst.ytabuleiro += quantia_andada;
					
					yy = inst.ytabuleiro;
					ds_g[# xx,yy] = inst.shogun_id;
				}
			}
			
			var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
			
			inst.x = x1;
			inst.y = y1;
			
			if xx != xtab or yy != ytab {
				num_inst++;
			}
		} else {
			num_inst = 0;
			timer_action = 0;
			
			global.turno = TURNO_JOGADOR;
		}
		
	}
}