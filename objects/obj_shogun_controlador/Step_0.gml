/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if room == rm_menu {exit}
if global.vitoria or global.derrota {exit}

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
		tries++;
		
		if num_inst < inst_limit {
			var inst = instance_find(objParShoguns, num_inst);
			inst.alvo = true;
			var xx = inst.xtabuleiro, yy = inst.ytabuleiro;
			var nearest_youkai = instance_nearest(inst.x,inst.y,objParYoukais);
			//AÇÃO EXECUTADA PELO SHOGUN
			
			var arr = inst.array_acoes[1];
			var atk = arr[0];
			var range_min = arr[1];
			var range_max = arr[2];
			
			if inst.moving {exit}
			
			if inst.moved {
				
				//DETECTAR PRIMEIRO SE EXISTE UM YOUKAI PRÓXIMO
				if youkaiProximo(range_min, range_max, inst.x, inst.y) {
					inst.estado = 1;
					inst.reset_state_timer = 0;
					
					switch atk {
						case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
						case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
					}
					
				//SE NÃO TIVER UM YOUKAIS PRÓXIMO, DETECTAR SE A SACERDOTISA ESTÁ PRÓXIMA
				} else if sacerdotisaProxima(range_min, range_max, inst.x, inst.y) {
					inst.estado = 0;
					inst.reset_state_timer = 0;
				
					switch atk {
						case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
						case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
					}
				}
				
				num_inst++;
					tries = 0;
					inst.alvo = false;
					exit;
			}
			
			
			//DETECTAR PRIMEIRO SE EXISTE UM YOUKAI PRÓXIMO
			if youkaiProximo(range_min, range_max, inst.x, inst.y) {
				inst.estado = 1;
				inst.reset_state_timer = 0;
				
				switch atk {
					case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
					case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
				}
				
				num_inst++;
				tries = 0;
				inst.alvo = false;
				exit;
			//SE NÃO TIVER UM YOUKAIS PRÓXIMO, DETECTAR SE A SACERDOTISA ESTÁ PRÓXIMA
			} else if sacerdotisaProxima(range_min, range_max, inst.x, inst.y) {
				inst.estado = 0;
				inst.reset_state_timer = 0;
				
				switch atk {
					case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
					case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
				}
				
				num_inst++;
				tries = 0;
				inst.alvo = false;
				exit;
			//SE NÃO HOUVER NADA PRÓXIMO, ENTÃO SÓ ANDAR
			} else {
				#region SHOGUNS ANDAR
				//SE NÃO TIVER YOUKAI OU SACERDOTISA POR PERTO, ENTÃO ELES IRÃO APENAS ANDAR
				xtab = inst.xtabuleiro;
				ytab = inst.ytabuleiro;
				
				//AÇÕES DAS PEÇAS
				var dir = floor( ((inst.estado == 0 ? point_direction(inst.x, inst.y,objSacerdotisa.x,objSacerdotisa.y) : point_direction(inst.x,inst.y,nearest_youkai.x,nearest_youkai.y))+(irandom_range(0,90))) /90);
				if tries >= limit_tries {
					dir = irandom_range(0,3);
					
					if tries >= limit_tries_to_pass {
						num_inst++;
						tries = 0;
						inst.alvo = false;
						exit;
					}
				}
				
				var quantia_andada = irandom_range(1, inst.moves);
				//show_message("Quadrados: " + string(quantia_andada));
				
				var xalvo = xx+lengthdir_x(quantia_andada,dir*90), yalvo = yy+lengthdir_y(quantia_andada,dir*90);
				//show_message("X: " + string(xalvo) + " | Y: " + string(yalvo));
				inst.direcao_peca = floor(point_direction(xx,yy,xalvo,yalvo)/90);
				
				if (ds_g[# xalvo, yalvo] == NADA) {
					ds_g[# xx, yy] = NADA;
					
					xx = xalvo; yy = yalvo;
					inst.xtabuleiro = xx; inst.ytabuleiro = yy;
					
					ds_g[# xx, yy] = inst.shogun_id;
					
				} else if (ds_g[# xalvo, yalvo] < IdPecas.AlturaPlayers) {
					var xyoukai = xinicial+((xalvo*tamcell)+(xalvo*buff)), yyoukai = yinicial+((yalvo*tamcell)+(yalvo*buff))
					var youkai_dest = instance_nearest(xyoukai,yyoukai,objParYoukais);
					
					switch youkai_dest.peca_id {
						default: //TODAS AS PEÇAS
							if youkai_dest.estado == 0 {
								ds_g[# xx, yy] = NADA;
								
								xx = xalvo; yy = yalvo;
								inst.xtabuleiro = xx; inst.ytabuleiro = yy;
								
								ds_g[# xx, yy] = inst.shogun_id;
							}
							break;
						case IdPecas.Tanuki:
							if youkai_dest.estado == 1 {
								xx = xalvo; yy = yalvo;
								inst.xtabuleiro = xx; inst.ytabuleiro = yy;
							}
							break;
					}
				}
				
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				
				if (xx != xtab or yy != ytab) {
					inst.moving = true;
					inst.xdest = x1;
					inst.ydest = y1;
					//inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
					tries = 0;
				}
				
				#endregion
			}
			
			
		} else {
			num_inst = 0;
			timer_action = 0;
			tries = 0;
			
			global.turno = TURNO_JOGADOR;
		}
		
	}
}