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


if global.vitoria or global.derrota {exit}

if global.turno == TURNO_INIMIGO {
	timer_action++;
	inst_limit = instance_number(objParShoguns);
	
	if timer_action >= TIMEOUT {
		timer_action = 0;
		tries++;
		
		if num_inst < inst_limit {
			var inst = instance_find(objParShoguns, num_inst);
			var xx = inst.xtabuleiro, yy = inst.ytabuleiro;
			var nearest_youkai = instance_nearest(inst.x,inst.y,objParYoukais);
			//AÇÃO EXECUTADA PELO SHOGUN
			
			var arr = inst.array_acoes[1];
			var atk = arr[0];
			var range_min = arr[1];
			var range_max = arr[2];
			
			if inst.moving {exit}
			
			if inst.moved {
				
				if (inst.estado == 0 ? sacerdotisaProxima(range_min, range_max, inst.x, inst.y) : youkaiProximo(range_min, range_max, inst.x, inst.y)) {
					//SE ALGUM DOS 2 ESTIVER DENTRO DO ALCANCE DO GOLPE, ENTÃO O SHOGUN IRÁ ATACAR
					
					switch atk {
						case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
						case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
					}
				}
				
				num_inst++;
				tries = 0;
				exit;
			}
			
			//VERIFICAR PRIMEIRO SE EXISTE UM YOUKAI (PRECISA TER SIDO ATACADO ANTES, ESTADO = 1) OU UMA SACERDOTISA POR PERTO (ESTADO = 0)
			if (inst.estado == 0 ? sacerdotisaProxima(range_min, range_max, inst.x, inst.y) : youkaiProximo(range_min, range_max, inst.x, inst.y)) {
				//SE ALGUM DOS 2 ESTIVER DENTRO DO ALCANCE DO GOLPE, ENTÃO O SHOGUN IRÁ ATACAR
				
				switch atk {
					case atkPertoInimigo: script_execute(atk,inst, nearest_youkai); break;
					case atkDistanciaInimigo: script_execute(atk, inst,nearest_youkai,range_min,range_max); break;
				}
				
				num_inst++;
			} else {
				
				#region SHOGUNS ANDAR
				//SE NÃO TIVER YOUKAI OU SACERDOTISA POR PERTO, ENTÃO ELES IRÃO APENAS ANDAR
				xtab = inst.xtabuleiro;
				ytab = inst.ytabuleiro;
				
				//AÇÕES DAS PEÇAS
				dir = floor( ((inst.estado == 0 ? point_direction(inst.x, inst.y,objSacerdotisa.x,objSacerdotisa.y) : point_direction(inst.x,inst.y,nearest_youkai.x,nearest_youkai.y))+45) /90);
				var lado = choose(0,1), quantia_andada = 0;
				
				if tries >= limit_tries {dir = 5}
				
				switch dir {
					default: //NÃO CONSEGUE SE MOVER
						if lado == 0 { //ANDAR EM X
							//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
							quantia_andada = irandom_range((-inst.moves), inst.moves);
							
							//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
							if (ds_g[# xx+quantia_andada,yy] == NADA) {
								ds_g[# xx,yy] = NADA;
								inst.xtabuleiro += quantia_andada;
								
								xx = inst.xtabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							} else if (ds_g[# xx+quantia_andada,yy] < IdPecas.AlturaPlayers) {
								var youkai_disfarcado_proximo = instance_nearest(xinicial+((xx+quantia_andada)*tamcell)+((xx+quantia_andada)*buff), inst.y, objParYoukais);
								if youkai_disfarcado_proximo.estado == 0 {
									ds_g[# xx,yy] = NADA;
									inst.xtabuleiro += quantia_andada;
									
									xx = inst.xtabuleiro;
									ds_g[# xx,yy] = inst.shogun_id;
								}
							}
						} else { //ANDAR EM Y
							//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
							quantia_andada = irandom_range((-inst.moves),inst.moves);
							
							//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
							if (ds_g[# xx,yy+quantia_andada] == NADA) {
								ds_g[# xx,yy] = NADA;
								inst.ytabuleiro += quantia_andada;
								
								yy = inst.ytabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							} else if (ds_g[# xx,yy+quantia_andada] < IdPecas.AlturaPlayers) {
								var youkai_disfarcado_proximo = instance_nearest(inst.x, yinicial+((yy+quantia_andada)*tamcell)+((yy+quantia_andada)*buff), objParYoukais);
								if youkai_disfarcado_proximo.estado == 0 {
									ds_g[# xx,yy] = NADA;
									inst.ytabuleiro += quantia_andada;
									
									yy = inst.ytabuleiro;
									ds_g[# xx,yy] = inst.shogun_id;
								}
							}
						}
						break;
					
					case 0:	//DIREITA
					case 4:	//DIREITA
						//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
						quantia_andada = irandom_range(1, inst.moves);
						
						//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
						if (ds_g[# xx+quantia_andada,yy] == NADA) {
							ds_g[# xx,yy] = NADA;
							inst.xtabuleiro += quantia_andada;
							
							xx = inst.xtabuleiro;
							ds_g[# xx,yy] = inst.shogun_id;
						} else if (ds_g[# xx+quantia_andada,yy] < IdPecas.AlturaPlayers) {
							var youkai_disfarcado_proximo = instance_nearest(xinicial+((xx+quantia_andada)*tamcell)+((xx+quantia_andada)*buff), inst.y, objParYoukais);
							if youkai_disfarcado_proximo.estado == 0 {
								ds_g[# xx,yy] = NADA;
								inst.xtabuleiro += quantia_andada;
								
								xx = inst.xtabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							}
						}
						break;
					
					case 1:	//CIMA
						//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
						quantia_andada = irandom_range((-inst.moves),-1);
						
						//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
						if (ds_g[# xx,yy+quantia_andada] == NADA) {
							ds_g[# xx,yy] = NADA;
							inst.ytabuleiro += quantia_andada;
							
							yy = inst.ytabuleiro;
							ds_g[# xx,yy] = inst.shogun_id;
						} else if (ds_g[# xx,yy+quantia_andada] < IdPecas.AlturaPlayers) {
							var youkai_disfarcado_proximo = instance_nearest(inst.x, yinicial+((yy+quantia_andada)*tamcell)+((yy+quantia_andada)*buff), objParYoukais);
							if youkai_disfarcado_proximo.estado == 0 {
								ds_g[# xx,yy] = NADA;
								inst.ytabuleiro += quantia_andada;
								
								yy = inst.ytabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							}
						}
						break;
					case 2:	//ESQUERDA
						//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
						quantia_andada = irandom_range((-inst.moves),-1);
						
						//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
						if (ds_g[# xx+quantia_andada,yy] == NADA) {
							ds_g[# xx,yy] = NADA;
							inst.xtabuleiro += quantia_andada;
							
							xx = inst.xtabuleiro;
							ds_g[# xx,yy] = inst.shogun_id;
						} else if (ds_g[# xx+quantia_andada,yy] < IdPecas.AlturaPlayers) {
							var youkai_disfarcado_proximo = instance_nearest(xinicial+((xx+quantia_andada)*tamcell)+((xx+quantia_andada)*buff), inst.y, objParYoukais);
							if youkai_disfarcado_proximo.estado == 0 {
								ds_g[# xx,yy] = NADA;
								inst.xtabuleiro += quantia_andada;
								
								xx = inst.xtabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							}
						}
						break;
					case 3:	//BAIXO
						//DETERMINAR UMA QUANTIA DE PASSOS PARA O SHOGUN ANDAR
						quantia_andada = irandom_range(1, inst.moves);
						
						//SE NESSE NOVO LOCAL EXISTIR NADA, ENTÃO ELE IRÁ PARA LÁ
						if (ds_g[# xx,yy+quantia_andada] == NADA) {
							ds_g[# xx,yy] = NADA;
							inst.ytabuleiro += quantia_andada;
							
							yy = inst.ytabuleiro;
							ds_g[# xx,yy] = inst.shogun_id;
						} else if (ds_g[# xx,yy+quantia_andada] < IdPecas.AlturaPlayers) {
							var youkai_disfarcado_proximo = instance_nearest(inst.x, yinicial+((yy+quantia_andada)*tamcell)+((yy+quantia_andada)*buff), objParYoukais);
							if youkai_disfarcado_proximo.estado == 0 {
								ds_g[# xx,yy] = NADA;
								inst.ytabuleiro += quantia_andada;
								
								yy = inst.ytabuleiro;
								ds_g[# xx,yy] = inst.shogun_id;
							}
						}
						break;
				}
				
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				
				if (xx != xtab or yy != ytab) {
					inst.moving = true;
					inst.xdest = x1;
					inst.ydest = y1;
					inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
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