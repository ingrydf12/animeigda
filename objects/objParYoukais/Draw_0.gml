/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

var ds_g = global.grid_tabuleiro;
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var tamcell = global.tamanho_cell;
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var c = c_yellow, alpha = 1;
var move = array_moves[estado];

#region QUANDO A PEÇA AINDA ESTIVER NA ABA DAS PEÇAS
c = c_gray;
if !no_tabuleiro and !clicado {
	alpha = 1;
	
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
		alpha = .7;
	}
	
	draw_set_alpha(alpha);
	draw_rectangle_color(x,y,x+global.tamanho_cell,y+global.tamanho_cell,c,c,c,c,false);
	draw_set_alpha(1);
}
#endregion

//DESENHAR OS TILES

if can_attack or can_move {
	switch tile_mode {
		default:
			//NÃO DESENHAR TILES
			break;
	
		case TILE_MOVE:
		
			#region MOVER
			//DESENHAR OS TILES DE MOVIMENTO
		
			//EIXO X:
			for (var xx = 0; xx < ((move*2)+1); xx++) {
				var x1 = x - ((move*tamcell) + (move*buff)) + ((xx*tamcell) + (xx*buff)), y1 = y;
				var x2 = x1 + tamcell, y2 = y1 + tamcell;
				c = c_yellow;
				
				if moved {c = make_color_rgb(180,90,100)}
			
				if collision_rectangle(x1,y1,x2,y2,objParPecas,false,true) {c = c_red}
			
				if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
					
					if global.turno == TURNO_JOGADOR and !moved and !global.primeiro_turno {
						if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
							c = c_orange;
							
							if mouse_check_button_pressed(mb_left) {
								moved = true;
								can_move = false;
								
								ds_g[# xtabuleiro, ytabuleiro] = NADA;
								xtabuleiro += (xx-move);
								ds_g[# xtabuleiro, ytabuleiro] = peca_id;
								
								x = x1;
								y = y1;
								
							}
						}
					}
					
					draw_set_alpha(.3);
					draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
					draw_set_alpha(1);
				}
			}
			
			//EIXO Y:
			for (var yy = 0; yy < ((move*2)+1); yy++) {
				var x1 = x, y1 = y - ((move*tamcell) + (move*buff)) + ((yy*tamcell) + (yy*buff));
				var x2 = x1 + tamcell, y2 = y1 + tamcell;
				c = c_yellow;
				
				if moved {c = make_color_rgb(180,90,100)}
			
				if collision_rectangle(x1,y1,x2,y2,objParPecas,false,true) {c = c_red}
			
				if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
					
					if global.turno == TURNO_JOGADOR and !moved and !global.primeiro_turno {
						if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
							c = c_orange;
							
							if mouse_check_button_pressed(mb_left) {
								moved = true;
								can_move = false;
								
								ds_g[# xtabuleiro, ytabuleiro] = NADA;
								ytabuleiro += (yy-move);
								ds_g[# xtabuleiro, ytabuleiro] = peca_id;
								
								x = x1;
								y = y1;
								
							}
						}
					}
					
					draw_set_alpha(.3);
					draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
					draw_set_alpha(1);
				}
			}
			break;
			#endregion
		
		case TILE_ATTACK:
		
			#region ATACAR
			//DESENHAR OS TILES DE ATAQUE
			var arr = array_ataques[estado];
			var range_min = arr[1], range_max = arr[2];
		
			switch peca_id {
				default:
					//EIXO X:
					for (var xx = 0; xx < ((range_max*2)+1); xx++) {
						var x1 = x - ((range_max*tamcell) + (range_max*buff)) + ((xx*tamcell) + (xx*buff)), y1 = y;
						var x2 = x1 + tamcell, y2 = y1 + tamcell;
						c = c_purple;
						
						//if collision_rectangle(x1,y1,x2,y2,objParPecas,false,true) {c = c_gray}
						
						if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
							
							if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
								if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
									c = make_color_rgb(200,0,200);
									var xinim = xtabuleiro + (xx-range_max), yinim = ytabuleiro;
									
									if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
										if mouse_check_button_pressed(mb_left) {
											attacked = true;
											can_attack = false;
											modo_exposicao = TILE_MOVE;
											tile_mode = TILE_MOVE;
											
											var inst = instance_nearest(x1,y1,objParShoguns);
											inst.vida_atual-=array_dano[estado];
											inst.estado = 1;
											inst.reset_state_timer = 0;
										}
									}
								}
							}
							
							draw_set_alpha(.3);
							draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
							draw_set_alpha(1);
						}
					}
				
					//EIXO Y:
					for (var yy = 0; yy < ((range_max*2)+1); yy++) {
						var x1 = x, y1 = y - ((range_max*tamcell) + (range_max*buff)) + ((yy*tamcell) + (yy*buff));
						var x2 = x1 + tamcell, y2 = y1 + tamcell;
						c = c_purple;
					
						//if collision_rectangle(x1,y1,x2,y2,objParPecas,false,true) {c = c_gray}
					
						if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
							if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
								if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
									c = make_color_rgb(200,0,200);
									var xinim = xtabuleiro, yinim = ytabuleiro + (yy-range_max);
									
									if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
										if mouse_check_button_pressed(mb_left) {
											attacked = true;
											can_attack = false;
											modo_exposicao = TILE_MOVE;
											tile_mode = TILE_MOVE;
											
											var inst = instance_nearest(x1,y1,objParShoguns);
											inst.vida_atual-=array_dano[estado];
											inst.estado = 1;
											inst.reset_state_timer = 0;
										}
									}
								}
							}
							
							draw_set_alpha(.3);
							draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
							draw_set_alpha(1);
						}
					}
					break;
				
				case IdPecas.Dotaku:
					if estado == 1 {
						//MODO SCARY (ESTADO = 1)
						
						//ÁREA AO REDOR DO DOTAKU
						for (var xx = 0; xx < ((range_min*2)+1); xx++) {
							for (var yy = 0; yy < ((range_min*2)+1); yy++) {
								var x1 = x - ((range_min*tamcell) + (range_min*buff)) + ((xx*tamcell) + (xx*buff));
								var y1 = y - ((range_min*tamcell) + (range_min*buff)) + ((yy*tamcell) + (yy*buff));
								var x2 = x1 + tamcell, y2 = y1 + tamcell;
								c = c_purple;
								
								if (x1 != x or y1 != y) {
									if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff))) {
										if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff))) {
											
											if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
												if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
													c = make_color_rgb(200,0,200);
													
													//LOCALIZAR TODOS OS INIMIGOS NA ÁREA DE ATAQUE
													var x1col = x - ((range_min*tamcell) + (range_min*buff)), y1col = y - ((range_min*tamcell) + (range_min*buff));
													var x2col = x + tamcell + ((range_min*tamcell) + (range_min*buff)), y2col = y + tamcell + ((range_min*tamcell) + (range_min*buff));
													var inst_list = ds_list_create();
													
													c = c_red;
													draw_rectangle_color(x1col,y1col,x2col,y2col,c,c,c,c,true);
													var int_n = collision_rectangle_list(x1col,y1col,x2col,y2col, objParShoguns, false, true,inst_list,false);
													
													if int_n > 0 {
														if mouse_check_button_pressed(mb_left) {
															attacked = true;
															can_attack = false;
															modo_exposicao = TILE_MOVE;
															tile_mode = TILE_MOVE;
															
															for (var i = 0; i < int_n; i++) {
																var inst = ds_list_find_value(inst_list, i);
																inst.estado = 1;
																inst.vida_atual-=array_dano[estado];
																inst.reset_state_timer = 0;
															}
														}
													}
													
													ds_list_destroy(inst_list);
												}
											}
											
											draw_set_alpha(.3);
											draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
											draw_set_alpha(1);
										}
									}
								}
							}
						}
					} else {
						//MODO DISFARCE (ESTADO = 0)
						
						//EIXO X:
						for (var xx = 0; xx < ((range_max*2)+1); xx++) {
							var x1 = x - ((range_max*tamcell) + (range_max*buff)) + ((xx*tamcell) + (xx*buff)), y1 = y;
							var x2 = x1 + tamcell, y2 = y1 + tamcell;
							c = c_purple;
							
							if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
								
								if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
									if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
										c = make_color_rgb(200,0,200);
										var xinim = xtabuleiro + (xx-range_max), yinim = ytabuleiro;
										
										if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
											if mouse_check_button_pressed(mb_left) {
												attacked = true;
												can_attack = false;
												modo_exposicao = TILE_MOVE;
												tile_mode = TILE_MOVE;
												
												var inst = instance_nearest(x1,y1,objParShoguns);
												inst.vida_atual-=array_dano[estado];
												inst.estado = 1;
												inst.reset_state_timer = 0;
											}
										}
									}
								}
								
								draw_set_alpha(.3);
								draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
								draw_set_alpha(1);
							}
						}
						
						//EIXO Y:
						for (var yy = 0; yy < ((range_max*2)+1); yy++) {
							var x1 = x, y1 = y - ((range_max*tamcell) + (range_max*buff)) + ((yy*tamcell) + (yy*buff));
							var x2 = x1 + tamcell, y2 = y1 + tamcell;
							c = c_purple;
							
							if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
								if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
									if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
										c = make_color_rgb(200,0,200);
										var xinim = xtabuleiro, yinim = ytabuleiro + (yy-range_max);
										
										if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
											if mouse_check_button_pressed(mb_left) {
												attacked = true;
												can_attack = false;
												modo_exposicao = TILE_MOVE;
												tile_mode = TILE_MOVE;
												
												var inst = instance_nearest(x1,y1,objParShoguns);
												inst.vida_atual-=array_dano[estado];
												inst.estado = 1;
												inst.reset_state_timer = 0;
											}
										}
									}
								}
								
								draw_set_alpha(.3);
								draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
								draw_set_alpha(1);
							}
						}
					}
					break;
			}
			break;
			#endregion
			
	}
}

draw_self();

if selecionado {
	c = c_red;
	draw_rectangle_color(x,y,x+tamcell,y+tamcell,c,c,c,c,true);
}
