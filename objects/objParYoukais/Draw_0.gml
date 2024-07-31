/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) or global.pause {exit}

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
		
		case TILE_MOVE:
		
			#region MOVER
			//DESENHAR OS TILES DE MOVIMENTO
		
			//EIXO X:
			for (var xx = 0; xx < ((move*2)+1); xx++) {
				var x1 = x - ((move*tamcell) + (move*buff)) + ((xx*tamcell) + (xx*buff)), y1 = y;
				var x2 = x1 + tamcell, y2 = y1 + tamcell;
				c = c_yellow;
				if moved {c = make_color_rgb(180,90,100)}
			
				var colid = collision_rectangle(x1,y1,x2,y2,objParPecas,false,true);
				if colid {c = c_red}
			
				if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
					
					if global.turno == TURNO_JOGADOR and !moved and !global.primeiro_turno {
						if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
							c = c_orange;
							
							if mouse_check_button_pressed(mb_left) and !colid {
								moved = true;
								direcao_peca = floor((point_direction(x,y,x1,y1))/90);
								
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
				
				var colid = collision_rectangle(x1,y1,x2,y2,objParPecas,false,true);
				if colid {c = c_red}
			
				if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
					
					if global.turno == TURNO_JOGADOR and !moved and !global.primeiro_turno {
						if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
							c = c_orange;
							
							if mouse_check_button_pressed(mb_left) and !colid {
								moved = true;
								direcao_peca = floor((point_direction(x,y,x1,y1))/90);
								
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
						if attacked {c = make_color_rgb(150,50,80)}
						
						if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
							
							if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
								if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
									c = make_color_rgb(200,0,200);
									var xinim = xtabuleiro + (xx-range_max), yinim = ytabuleiro;
									
									if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
										if mouse_check_button_pressed(mb_left) {
											var arr = array_ataques[estado];
											var atk = arr[0];
											direcao_peca = point_direction(x,y,x1,y1)/90;
											
											script_execute(atk, x1, y1);
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
						if attacked {c = make_color_rgb(150,50,80)}
						
						if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
							if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
								if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
									c = make_color_rgb(200,0,200);
									var xinim = xtabuleiro, yinim = ytabuleiro + (yy-range_max);
									
									if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
										if mouse_check_button_pressed(mb_left) {
											var arr = array_ataques[estado];
											var atk = arr[0];
											direcao_peca = point_direction(x,y,x1,y1)/90;
											
											script_execute(atk, x1, y1);
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
								if attacked {c = make_color_rgb(150,50,80)}
								
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
													var inst_n = collision_rectangle_list(x1col,y1col,x2col,y2col, objParShoguns, false, true,inst_list,false);
													
													if inst_n > 0 {
														if mouse_check_button_pressed(mb_left) {
															atkArea(inst_list, inst_n);
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
							if attacked {c = make_color_rgb(150,50,80)}
							
							if (x1 >= xinicial and x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 != x) {
								
								if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
									if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
										c = make_color_rgb(200,0,200);
										var xinim = xtabuleiro + (xx-range_max), yinim = ytabuleiro;
										
										if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
											if mouse_check_button_pressed(mb_left) {
												var arr = array_ataques[estado];
												var atk = arr[0];
												
												script_execute(atk, x1, y1);
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
							if attacked {c = make_color_rgb(150,50,80)}
							
							if (y1 >= yinicial and y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 != y) {
								if global.turno == TURNO_JOGADOR and !attacked and !global.primeiro_turno {
									if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
										c = make_color_rgb(200,0,200);
										var xinim = xtabuleiro, yinim = ytabuleiro + (yy-range_max);
										
										if (ds_g[# xinim, yinim] > IdPecas.AlturaPlayers and ds_g[# xinim, yinim] < IdPecas.AlturaInimigos) {
											if mouse_check_button_pressed(mb_left) {
												var arr = array_ataques[estado];
												var atk = arr[0];
												
												script_execute(atk, x1, y1);
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

var sc = image_xscale+.5*global.escala_sprites;
var xx = x-((tamcell/2)*(sc-image_xscale)), yy = y-((tamcell*.8)*(sc-image_xscale));

if hit {
	gpu_set_fog(true,c_white,0,0);
	draw_sprite_ext(sprite_index,image_index,xx,yy,sc,sc,0,c_white,1);
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_sprite_ext(sprite_index,image_index,xx,yy,sc,sc,0,c_white,1);
}

//draw_set_color(c_red)
//draw_rectangle(xx,yy,xx+(tamcell*sc),yy+(tamcell*sc),true);
//draw_self();

if selecionado {
	c = c_red;
	draw_rectangle_color(x,y,x+tamcell,y+tamcell,c,c,c,c,true);
}

if no_tabuleiro {
	//draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+tamcell/2,image_xscale-.4,image_yscale-.4,direcao_peca*90,c_white,1);
	//sc = image_xscale-.4;
	switch direcao_peca {
		default:
			draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+(tamcell/2)-12,image_xscale,image_yscale,direcao_peca*90,c_white,1);
			break;
		case 2:
			draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+(tamcell/2)-12,image_xscale,-(image_yscale),direcao_peca*90,c_white,1);
			break;
		case 1:
		case 3:
			draw_sprite_ext(sprDirecaoPeca,0,x+(tamcell/2)-14,y+tamcell/2,image_xscale,image_yscale,direcao_peca*90,c_white,1);
			break;
	}
}


//draw_rectangle(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,false);
