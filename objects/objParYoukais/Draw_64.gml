/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) or global.pause {exit}

//var escala = global.escala_sprites;
var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 64*escala, str_h = string_height("I")*escala;
var input_color = make_color_rgb(83,14,16), non_option_color = make_color_rgb(94,82,77), button_color = make_color_rgb(207,174,104);
var c = input_color, c2 = non_option_color, alpha = 1;
draw_set_font(fnt_ingame);

if global.informacoes_peca {
	if global.informacoes_peca_inst == self {
		var wquad = 240*escala, hquad = 220*escala;
		var xquad = gw-margin-wquad, yquad = gh-margin-hquad;
		
		//draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
		
		var buff_quad = 24*escala;
		var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
		var winfo = wquad-(buff_quad*2), hinfo = hquad-(buff_quad*2);
		draw_sprite_stretched(sprCardsPecasYoukais,0,0,0,gw,gh);
		//draw_set_alpha(.8)
		//draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
		//draw_rectangle_color(xinfo,yinfo,xinfo+winfo,yinfo+hinfo,c,c,c,c,false);
		
		var buff_dados = 4*escala;
		
		//NOME
		var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
		draw_set_halign(fa_middle);
		draw_text_transformed_color(xnome,ynome,nome,escala,escala,0,c,c,c,c,1);
		
		
		//VIDA
		var xvida = xnome, yvida = ynome+buff_quad+str_h;
		var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
		draw_text_transformed_color(xvida,yvida,str_hp,escala,escala,0,c,c,c,c,1);
		
		//DANO
		var xdano = xvida, ydano = yvida+buff_dados+str_h;
		var str_dano = "Dano: " + string(dano);
		draw_text_transformed_color(xdano,ydano,str_dano,escala,escala,0,c,c,c,c,1);
		
		//PASSIVA
		var xpassiva = xinfo+buff_dados, ypassiva = ydano+buff_dados+str_h;
		var wpassiva = winfo-(buff_dados*2), hpassiva = 30*escala;
		var str_passiva = "DESAT. DISFARCE";
		
		alpha = 1; c = button_color; var sc = .8;
		
		//FAZER UM SWITCH PARA CADA PEÇA
		switch peca_id {
			default:	//TODAS AS PEÇAS SEM CONDIÇÃO ESPECIAL (PASSIVA DIFERENTE DE DISFARCE)
				
				if estado == 0 {
					//ESTÁ NO MODO DISFARCE ATUALMENTE
					c = button_color;
					
					//VERIFICAR SE O MOUSE ESTÁ POR CIMA
					if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
						//MUDAR O ALPHA
						alpha = .7;
						
						//VERIFICAR SE ESTÁ NO VEZ DO JOGADOR E SE O MOUSE FOI PRESSIONADO (ESQUERDO)
						if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
							//SE ESTIVER NO TURNO DO JOGADOR E O MOUSE TIVER SIDO PRESSIONADO, ENTÃO MUDAR O ESTADO DA PEÇA
							//E CONSEQUENTEMENTE O MODO, DE DISFARCE PARA 'SCARY'
							estado = 1;
							disfarce_round_timer = 0;
							
							//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
							can_attack = false;
							modo_exposicao = TILE_MOVE;
							tile_mode = modo_exposicao;
						}
					}
				} else {
					//NÃO ESTÁ NO MODO DISFARCE ATUALMENTE
					c = non_option_color;
					str_passiva = "COOLDOWN..."
					
					//VERIFICAR SE JÁ PODE ALTERNAR PARA O MODO DE DISFARCE NOVAMENTE
					if disfarce_round_timer >= disfarce_rounds {
						c = button_color;
						str_passiva = "ATIVAR DISFARCE"
						
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
					c = button_color;
					str_passiva = "ATIVAR ARMADILHA";
					
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
					c = non_option_color;
					str_passiva = "ARMADILHA ATIVADA";
					
					//VERIFICAR SE O MOUSE ESTÁ POR CIMA
					if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
						//MUDAR O ALPHA
						alpha = .7;
					}
				} else {
					//MODO SCARY
					c = non_option_color;
					str_passiva = "COOLDOWN..."
					
					//VERIFICAR SE JÁ PODE ALTERNAR PARA O MODO DE DISFARCE NOVAMENTE
					if disfarce_round_timer > disfarce_rounds {
						c = button_color;
						str_passiva = "ATIVAR DISFARCE"
						
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
		c = input_color;
		draw_text_ext_transformed_color(xpassiva+(wpassiva/2),ypassiva+(hpassiva/2),str_passiva,12,wpassiva,escala,escala,0,c,c,c,c,1);
		
		//ATAQUE
		var xataque = xpassiva, yataque = ypassiva+buff_dados+hpassiva;
		var wataque = wpassiva, hataque = hpassiva;
		
		alpha = 1;
		c = button_color; sc = .8;
		var str_atk = "MODO: ANDAR";
		
		//FAZER UM SWITCH PARA CADA PEÇA
		switch peca_id {
			default:	//TODAS AS PEÇAS SEM CONDIÇÃO ESPECIAL (PASSIVA DIFERENTE DE DISFARCE)
				
				if array_ataques[estado] != noone {
					//TEM A POSSIBILIDADE DE ATACAR
					c = button_color;
					
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
							c = button_color;
							str_atk = "MODO: ATACAR";
						}
					}
					
				} else {
					//NÃO TEM A POSSIBILIDADE DE ATAQUE
					c = non_option_color;
					str_atk = "SEM ATAQUES";
					
					if point_in_rectangle(mx,my,xataque,yataque,xataque+wataque,yataque+hataque) {
						//MUDAR O ALPHA
						alpha = .7;
					}
				}
				
				
				
				break;
			
			case IdPecas.Tanuki:	//ÚNICA PEÇA ESPECIAL, POSSUI 3 ESTADOS (DISFARCE, ARMADILHA, SCARY)
				//NÃO TEM A POSSIBILIDADE DE ATAQUE
				c = non_option_color;
				str_atk = "SEM ATAQUES";
				
				if point_in_rectangle(mx,my,xataque,yataque,xataque+wataque,yataque+hataque) {
					//MUDAR O ALPHA
					alpha = .7;
				}
				break;
		}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xataque,yataque,xataque+wataque,yataque+hataque,c,c,c,c,false);
		draw_set_alpha(1);
		c = input_color;
		draw_text_ext_transformed_color(xataque+(wataque/2),yataque+(hataque/2),str_atk,12,wataque,escala,escala,0,c,c,c,c,1);
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);