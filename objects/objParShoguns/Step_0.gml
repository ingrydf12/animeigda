/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//if instance_exists(obj_controle_turno) {
//	if !global.primeiro_turno {
//		visible = true;
//	}
//}

#region VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6, tamcell = global.tamanho_cell;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
#endregion



if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	if mouse_check_button_pressed(mb_right) {
		if informacoes {
			informacoes = false;
		} else {
			var inst_n = instance_number(objParShoguns);
			if inst_n > 0 {
				for (var i = 0; i < inst_n; i++) {
					var other_insts = instance_find(objParShoguns,i);
				
					other_insts.informacoes = false;
				}
			}
			
			informacoes = true;
		}
	}
}

if vida_atual <= 0 {
	global.grid_tabuleiro[# xtabuleiro, ytabuleiro] = NADA;
	instance_destroy()
}

if reset_state_timer >= reset_state_round {
	reset_state_timer = 0;
	estado = 0;
}

if !instance_exists(objSacerdotisa) {estado = 1}

if moving and !moved {
	x = lerp(x, xdest, .18);
	y = lerp(y, ydest, .18);
	
	if point_distance(x,y,xdest,ydest) <= 1 {
		moving = false;
		moved = true;
	}
	
	if collision_rectangle(xdest,ydest,xdest+tamcell,ydest+tamcell,objParYoukais,false,false) {
		var nearest_youkai = instance_nearest(x,y,objParYoukais);
		
		switch nearest_youkai.peca_id {
			default: //TODAS AS PEÇAS
				if nearest_youkai.estado == 0 {
					instance_destroy(nearest_youkai);
				}
				break;
			case IdPecas.Tanuki:
				if nearest_youkai.estado == 1 {
					var dir = floor(point_direction(xdest,ydest,x,y)/90);
					direcao_peca = dir;
					xtabuleiro += lengthdir_x(1,dir*90); ytabuleiro += lengthdir_y(1,dir*90);
					if ds_g[# xtabuleiro, ytabuleiro] != NADA {
						xtabuleiro += lengthdir_x(1,dir*90); ytabuleiro += lengthdir_y(1,dir*90);
					}
					
					var x1 = xinicial+(xtabuleiro*tamcell)+(xtabuleiro*buff), y1 = yinicial+(ytabuleiro*tamcell)+(ytabuleiro*buff);
					
					vida_atual-=nearest_youkai.dano;
					nearest_youkai.estado = 2;
					nearest_youkai.armadilha = false;
					nearest_youkai.armadilha_timer = 0;
					
					moving = true;
					moved = false;
					xdest = x1;
					ydest = y1;
					
					ds_g[# xtabuleiro, ytabuleiro] = shogun_id;
				}
				break;
		}
	}
}