/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//draw_text(20,20,global.sacerdotisa_vida)

if global.pause {exit}

//VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro, ds_youkais = global.grid_pecas_youkais, ds_shoguns = global.grid_pecas_shoguns;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = (rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff)), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
//var xinicial = rw/2-(((ds_w/2)-1)*tamcell)-(((ds_w/2)-1)*xbuff), yinicial = rh/2-(((ds_h/2)-1)*tamcell)-(((ds_h/2)-1)*ybuff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var color = global.color_roof, c = color, max_alp = .3, min_alp = .5, alpha = max_alp, escala = global.escala_sprites;
var mcheck = MOUSE_NEUTRO;

if instance_exists(obj_aba_pecas) or global.primeiro_turno {
	
	#region DURANTE A FASE DE POSIÇÃO DE PEÇAS
	//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
	for (var xx = 0; xx < ds_w; xx++) {
		for (var yy = 0; yy < ds_h; yy++) {
			//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
			switch ds_g[# xx,yy] {
				
				#region CASA VAZIA ANTES
				case -1:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) and !global.selecao_pecas {
						alpha = min_alp;
						
						if (xx >= xsacerdotisa-raio_sacerdotisa and yy >= ysacerdotisa-raio_sacerdotisa) {
							if (xx <= xsacerdotisa+raio_sacerdotisa and yy <= ysacerdotisa+raio_sacerdotisa) {
							
								if mouse_check_button_pressed(mb_left) {
									if global.peca_mouse != NADA {
										var inst = instance_nearest(mouse_x-global.tamanho_cell/2,mouse_y-global.tamanho_cell/2,objParYoukais);
										inst.clicado = false;
										inst.no_tabuleiro = true;
										inst.x = x1;
										inst.y = y1;
										inst.xtabuleiro = xx;
										inst.ytabuleiro = yy;
										
										ds_g[# xx,yy] = global.peca_mouse;
										global.peca_mouse = NADA;
									}
								}
							}
						}
					}
					
					if global.peca_mouse != -1 {
						if xx >= xsacerdotisa-raio_sacerdotisa and yy >= ysacerdotisa-raio_sacerdotisa {
							if xx <= xsacerdotisa+raio_sacerdotisa and yy <= ysacerdotisa+raio_sacerdotisa {
								c = make_color_rgb(100,255,100);
							}
						}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region AMBIENTAÇÃO ANTES
				case IdPecas.Arvore:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					//draw_set_alpha(1);
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprArvore,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				case IdPecas.Pedras:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprPedras,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				case IdPecas.Agua:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprPedras,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region SACERDOTISA ANTES
				case IdPecas.Sacerdotisa:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region PEÇAS DO PLAYER ANTES
				case IdPecas.ChochinObake:
				case IdPecas.Dotaku:
				case IdPecas.KasaObake:
				case IdPecas.Kappa:
				case IdPecas.Tanuki:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) and !global.selecao_pecas {
						mcheck = MOUSE_BLOQUEADO;
						alpha = min_alp;
						
					}
					
					c = color;
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region PEÇAS DOS INIMIGOS ANTES
				case IdPecas.Ashigaru:
				case IdPecas.Lanceiro:
				case IdPecas.Arqueiro:
				case IdPecas.Samurai:
				case IdPecas.Hatamoto:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) and !global.selecao_pecas {
						mcheck = MOUSE_BLOQUEADO;
						alpha = min_alp;
					}
					
					c = color;
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
			}
		}
	}
	#endregion
	
} else {
	
	#region DURANTE TODO O RESTO DA PARTIDA E O SELETOR DE PEÇAS
	//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
	for (var xx = 0; xx < ds_w; xx++) {
		for (var yy = 0; yy < ds_h; yy++) {
			switch ds_g[# xx,yy] {
				
				#region CASA VAZIA DURANTE
				case -1:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
					}
					
					if global.peca_mouse != -1 {
						if (xx >= xsacerdotisa-raio_sacerdotisa and yy >= ysacerdotisa-raio_sacerdotisa) {
							if (xx <= xsacerdotisa+raio_sacerdotisa and yy <= ysacerdotisa+raio_sacerdotisa) {
								c = make_color_rgb(100,255,100);
							}
						}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region AMBIENTAÇÃO DURANTE
				case IdPecas.Arvore:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprArvore,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				case IdPecas.Pedras:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprPedras,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				case IdPecas.Agua:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						
						if global.peca_mouse != -1 {mcheck = MOUSE_BLOQUEADO}
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_sprite_ext(sprPedras,0,x1,y1,escala,escala,0,c_white,1);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region SACERDOTISA DURANTE
				case IdPecas.Sacerdotisa:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					c = color;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
					}
					
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region PEÇAS DO PLAYER DURANTE
				case IdPecas.ChochinObake:
				case IdPecas.Dotaku:
				case IdPecas.KasaObake:
				case IdPecas.Kappa:
				case IdPecas.Tanuki:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						mcheck = MOUSE_INTERACT;
					}
					
					c = color;
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_text(x1,y1,ds_g[# xx,yy]);
					draw_set_alpha(1);
					break;
				#endregion
				
				#region PEÇAS DOS INIMIGOS DURANTE
				case IdPecas.Ashigaru:
				case IdPecas.Lanceiro:
				case IdPecas.Arqueiro:
				case IdPecas.Samurai:
				case IdPecas.Hatamoto:
					var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
					var x2 = x1+tamcell, y2 = y1+tamcell;
					alpha = max_alp;
					
					if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
						alpha = min_alp;
						mcheck = MOUSE_INTERACT;
					}
					
					c = color;
					draw_set_alpha(alpha);
					draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
					//draw_text(x1,y1,ds_g[# xx,yy]);
					draw_set_alpha(1);
					break;
				#endregion
				
			}
			
			//draw_text(xinicial+(xx*tamcell)+(xx*buff),yinicial+(yy*tamcell)+(yy*buff),ds_g[# xx,yy]);
		}
	}
	#endregion
	
}

global.mouse_check = mcheck;
//if global.turno == TURNO_JOGADOR {global.mouse_check = mcheck}