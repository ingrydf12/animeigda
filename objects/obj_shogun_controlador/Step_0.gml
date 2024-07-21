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
			
			//VERIFICAR PRIMEIRO SE EXISTE UM YOUKAI (PRECISA TER SIDO ATACADO ANTES, ESTADO = 1) OU UMA SACERDOTISA POR PERTO (ESTADO = 0)
			if (inst.estado == 0 ? sacerdotisaProxima(inst.moves, inst.x, inst.y) : youkaiProximo(inst.moves, inst.x, inst.y)) {
				//SE ALGUM DOS 2 ESTIVER DENTRO DO ALCANCE DO GOLPE, ENTÃO O SHOGUN IRÁ ATACAR
				
				if inst.estado == 0 {
					global.sacerdotisa_vida-=inst.dano;
				} else {
					nearest_youkai.vida_atual-=inst.dano;
					inst.estado = 0;
				}
				
				num_inst++;
				//with(inst) {
				//	var arr = array_acoes[estado];
				//	script_execute(arr[0],arr[1],arr[2]);
				//}
				
			} else {
				
				#region SHOGUNS ANDAR
				//SE NÃO TIVER YOUKAI OU SACERDOTISA POR PERTO, ENTÃO ELES IRÃO APENAS ANDAR
				//inimigoAvancar(
				//	inst.moves,
				//	(inst.estado == 0 ? obj_tabuleiro.xsacerdotisa : nearest_youkai.xtabuleiro),
				//	(inst.estado == 0 ? obj_tabuleiro.ysacerdotisa : nearest_youkai.ytabuleiro)
				//);
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
						}
						break;
				}
				
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				
				inst.x = x1;
				inst.y = y1;
				
				if xx != xtab or yy != ytab {
					num_inst++;
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