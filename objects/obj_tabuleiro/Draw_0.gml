/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro, ds_youkais = global.grid_pecas_youkais, ds_shoguns = global.grid_pecas_shoguns;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
//var xinicial = rw/2-(((ds_w/2)-1)*tamcell)-(((ds_w/2)-1)*xbuff), yinicial = rh/2-(((ds_h/2)-1)*tamcell)-(((ds_h/2)-1)*ybuff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var color = global.color_roof, c = color, alpha = 1, escala = global.escala_sprites;
var mcheck = MOUSE_NEUTRO;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_w; xx++) {
	for (var yy = 0; yy < ds_h; yy++) {
		//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
		switch ds_g[# xx,yy] {
			//CASA VAZIA
			case -1:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = color;
				draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					draw_set_alpha(.7);
					mcheck = MOUSE_BLOQUEADO;
					
					if xx >= 2 and yy >= 2 {
						if xx <= wcell - 3 and yy <= hcell - 3 {
							mcheck = MOUSE_CHECKADO;
							
							if mouse_check_button_pressed(mb_left) {
								if global.peca_mouse != -1 {
									ds_g[# xx,yy] = global.peca_mouse;
									global.peca_mouse = -1;
								}
							}
						}
					}
				}
				
				if global.peca_mouse != -1 {
					if xx >= 2 and yy >= 2 {
						if xx <= wcell - 3 and yy <= hcell - 3 {
							c = make_color_rgb(100,255,100);
						}
					}
				}
				
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_set_alpha(1);
				break;
			//PEÇAS DO PLAYER
			case IdPecas.ChochinObake:
			case IdPecas.Dotaku:
			case IdPecas.KasaObake:
			case IdPecas.Kappa:
			case IdPecas.Tanuki:
				var peca = ds_g[# xx,yy];
				var spr = ds_youkais[# DadosYoukais.Sprite, peca][ds_youkais[# DadosYoukais.Estado, peca]];
				
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				alpha = 1;
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					mcheck = MOUSE_SWITCH;
					alpha = .8;
				
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse == -1 {
							global.peca_mouse = ds_g[# xx,yy];
							ds_g[# xx,yy] = -1;
						} else {
							var cell_mouse = global.peca_mouse;
							global.peca_mouse = ds_g[# xx,yy];
							ds_g[# xx,yy] = cell_mouse;
						}
					}
				}
				
				c = color;
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_sprite_ext(spr,0,x1,y1,escala,escala,0,c_white,alpha);
				break;
			case IdPecas.Arvore:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = color;
				alpha = 1;
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					mcheck = MOUSE_BLOQUEADO;
				}
				
				if global.peca_mouse != -1 {
					c = c_red;
				}
				
				draw_set_alpha(1);
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_sprite_ext(sprArvore,0,x1,y1,escala,escala,0,c_white,alpha);
				draw_set_alpha(1);
				break;
			case IdPecas.Pedras:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = color;
				alpha = 1;
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					mcheck = MOUSE_BLOQUEADO;
				}
				
				if global.peca_mouse != -1 {
					c = c_red;
				}
				
				draw_set_alpha(1);
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_sprite_ext(sprPedras,0,x1,y1,escala,escala,0,c_white,alpha);
				draw_set_alpha(1);
				break;
		}
	}
}

if global.peca_mouse != -1 {
	global.mouse_check = mcheck;
} else {
	global.mouse_check = MOUSE_NEUTRO;
}