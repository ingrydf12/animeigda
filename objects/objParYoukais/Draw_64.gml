/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) or (global.primeiro_turno) {exit}

var gw = display_get_gui_width(), gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 50, str_h = string_height("I");
var c = c_gray, alpha = 1;
draw_set_font(fnt_hud_menu)

if global.informacoes_peca {
	if global.informacoes_peca_inst == self {
		var wquad = 150, hquad = 200;
		var xquad = margin, yquad = gh-margin-hquad;
		
		draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
		
		var buff_quad = 8;
		var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
		var winfo = 134, hinfo = 184;
		c = c_orange;
		draw_rectangle_color(xinfo,yinfo,xinfo+winfo,yinfo+hinfo,c,c,c,c,false);
		
		var buff_dados = 4;
		
		//NOME
		var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
		draw_set_halign(fa_middle);
		draw_text(xnome,ynome,nome);
		
		
		//VIDA
		var xvida = xnome, yvida = ynome+buff_quad+str_h;
		var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
		draw_text(xvida,yvida,str_hp);
		
		//DANO
		var xdano = xvida, ydano = yvida+buff_dados+str_h;
		var str_dano = "Dano: " + string(dano);
		
		draw_text(xdano,ydano,str_dano);
		
		//PASSIVA
		var xpassiva = xinfo+buff_dados, ypassiva = ydano+buff_quad+str_h;
		var wpassiva = 126, hpassiva = 30;
		var str_passiva = "DESATIVAR: DISFARCE";
		
		alpha = 1; c = c_green; var sc = .8;
		
		//FAZER UM SWITCH PARA CADA PEÇA
		switch peca_id {
			default:	//TODAS AS PEÇAS SEM CONDIÇÃO ESPECIAL (PASSIVA DIFERENTE DE DISFARCE)
				
				if estado == 0 {
					//ESTÁ NO MODO DISFARCE ATUALMENTE
					c = c_green;
					
					//VERIFICAR SE O MOUSE ESTÁ POR CIMA
					if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
						//MUDAR O ALPHA
						alpha = .7;
						
						//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR E SE O MOUSE FOI PRESSIONADO (ESQUERDO)
						if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
							//SE ESTIVER NO TURNO DO JOGADOR E O MOUSE TIVER SIDO PRESSIONADO, ENTÃO MUDAR O ESTADO DA PEÇA
							//E CONSEQUENTEMENTE O MODO, DE DISFARCE PARA 'SCARY'
							estado = 1;
							
							//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
							can_attack = false;
							modo_exposicao = TILE_MOVE;
							tile_mode = modo_exposicao;
						}
					}
				} else {
					//NÃO ESTÁ NO MODO DISFARCE ATUALMENTE
					c = c_dkgray;
					str_passiva = "COOLDOWN..."
					
					//VERIFICAR SE JÁ PODE ALTERNAR PARA O MODO DE DISFARCE NOVAMENTE
					if disfarce_round_timer > disfarce_rounds {
						c = c_green;
						str_passiva = "ATIVAR: DISFARCE"
						
						//VERIFICAR SE O MOUSE ESTÁ POR CIMA
						if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
							//MUDAR O ALPHA
							alpha = .7;
							
							//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR E SE O MOUSE FOI PRESSIONADO (ESQUERDO)
							if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
								//SE ESTIVER NO TURNO DO JOGADOR E O MOUSE TIVER SIDO PRESSIONADO, ENTÃO MUDAR O ESTADO DA PEÇA
								//E CONSEQUENTEMENTE O MODO, DE 'SCARY' PARA DISFARCE
								estado = 0;
								disfarce_round_timer = 0;
							
								//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
								can_attack = false;
								modo_exposicao = TILE_MOVE;
								tile_mode = modo_exposicao;
							}
						}
					}
				}
				
				
				
				break;
			
			case IdPecas.Tanuki:	//ÚNICA PEÇA ESPECIAL, POSSUI 3 ESTADOS (DISFARCE, ARMADILHA, SCARY)
				
				
				//VERIFICAR EM QUE ESTADO SE ENCONTRA
				if estado == 0 {
					//MODO DISFARCE
					c = c_green;
					str_passiva = "ATIVAR: ARMADILHA";
					
					//VERIFICAR SE O MOUSE ESTÁ POR CIMA
					if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
						//MUDAR O ALPHA
						alpha = .7;
						
						//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR E SE O MOUSE FOI PRESSIONADO (ESQUERDO)
						if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
							//SE ESTIVER NO TURNO DO JOGADOR E O MOUSE TIVER SIDO PRESSIONADO, ENTÃO MUDAR O ESTADO DA PEÇA
							//E CONSEQUENTEMENTE O MODO, DE DISFARCE PARA 'ARMADILHA'
							estado = 1;
							armadilha = true;
							armadilha_timer = 0;
							
							//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
							can_attack = false;
							modo_exposicao = TILE_MOVE;
							tile_mode = modo_exposicao;
						}
					}
				} else if estado == 1 {
					//MODO ARMADILHA
					c = c_dkgray;
					str_passiva = "ARMADILHA ATIVADA";
					
					//VERIFICAR SE O MOUSE ESTÁ POR CIMA
					if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
						//MUDAR O ALPHA
						alpha = .7;
					}
				} else {
					//MODO SCARY
					c = c_dkgray;
					str_passiva = "COOLDOWN..."
					
					//VERIFICAR SE JÁ PODE ALTERNAR PARA O MODO DE DISFARCE NOVAMENTE
					if disfarce_round_timer > disfarce_rounds {
						c = c_green;
						str_passiva = "ATIVAR: DISFARCE"
						
						if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
							alpha = .7;
							
							//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR E SE O MOUSE FOI PRESSIONADO (ESQUERDO)
							if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
								//SE ESTIVER NO TURNO DO JOGADOR E O MOUSE TIVER SIDO PRESSIONADO, ENTÃO MUDAR O ESTADO DA PEÇA
								//E CONSEQUENTEMENTE O MODO, DE 'SCARY' PARA DISFARCE
								estado = 0;
								disfarce_round_timer = 0;
							
								//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
								can_attack = false;
								modo_exposicao = TILE_MOVE;
								tile_mode = modo_exposicao;
							}
						}
					}
				}
				break;
		}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva,c,c,c,c,false);
		draw_set_alpha(1);
		draw_set_valign(fa_middle);
		draw_text_transformed(xpassiva+(wpassiva/2),ypassiva+(hpassiva/2),str_passiva,sc,sc,0);
		
		//ATAQUE
		var xataque = xpassiva, yataque = ypassiva+buff_quad+hpassiva;
		var wataque = wpassiva, hataque = hpassiva;
		
		alpha = 1;
		c = c_green; sc = .8;
		var str_atk = "MODO: ANDAR";
		
		//FAZER UM SWITCH PARA CADA PEÇA
		switch peca_id {
			default:	//TODAS AS PEÇAS SEM CONDIÇÃO ESPECIAL (PASSIVA DIFERENTE DE DISFARCE)
				
				if array_ataques[estado] != noone {
					//TEM A POSSIBILIDADE DE ATACAR
					c = c_green;
					
					if !attacked {
						//VERIFICAR SE O MOUSE ESTÁ POR CIMA
						if point_in_rectangle(mx,my,xataque,yataque,xataque+wataque,yataque+hataque) {
							//MUDAR O ALPHA
							alpha = .7;
						
							//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR, SE O MOUSE FOI PRESSIONADO (ESQUERDO) E SE AQUELA PEÇA AINDA NÃO ATACOU
							if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
								can_attack = !can_attack;
							
								if can_attack {
									modo_exposicao = TILE_ATTACK;
									tile_mode = modo_exposicao;
								} else {
									modo_exposicao = TILE_MOVE;
									tile_mode = noone;
								}
							}
						}
						
						if can_attack {
							c = c_green;
							str_atk = "MODO: ATACAR";
						}
					}
					
				} else {
					//NÃO TEM A POSSIBILIDADE DE ATAQUE
					c = c_dkgray
					str_atk = "SEM ATAQUES";
				}
				
				
				
				break;
			
			case IdPecas.Tanuki:	//ÚNICA PEÇA ESPECIAL, POSSUI 3 ESTADOS (DISFARCE, ARMADILHA, SCARY)
				
				break;
		}
		
		//if point_in_rectangle(mx,my,xataque,yataque,xataque+wataque,yataque+hataque) {
		//	alpha = .7;
			
		//	if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR and array_ataques[estado] != noone and !attacked {
		//		can_attack = !can_attack;
				
		//		if can_attack {
		//			modo_exposicao = TILE_ATTACK;
		//			tile_mode = modo_exposicao;
		//		} else {
		//			modo_exposicao = TILE_MOVE;
		//			tile_mode = noone;
		//		}
		//	}
		//}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xataque,yataque,xataque+wataque,yataque+hataque,c,c,c,c,false);
		draw_set_alpha(1);
		draw_text_transformed(xataque+(wataque/2),yataque+(hataque/2),str_atk,sc,sc,0);
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);