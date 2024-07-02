/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR A GRID DO TABULEIRO
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
//var xinicial = rw/2-(((ds_w/2)-1)*tamcell)-(((ds_w/2)-1)*xbuff), yinicial = rh/2-(((ds_h/2)-1)*tamcell)-(((ds_h/2)-1)*ybuff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var c = c_white, alpha = 1;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_w; xx++) {
	for (var yy = 0; yy < ds_h; yy++) {
		//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
		switch ds_g[# xx,yy] {
			//CASA VAZIA
			case -1:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_white;
				draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					//c = c_gray;
					draw_set_alpha(.7);
				
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse != -1 {
							ds_g[# xx,yy] = global.peca_mouse;
							global.peca_mouse = -1;
						}
					}
				}
				
				//draw_set_alpha(.8);
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_set_alpha(1);
				break;
			//PEÇAS DO PLAYER
			case IdPecas.ChochinObake:
				//id_peca = IdPecas.ChochinObake;
			case IdPecas.Dotaku:
				//id_peca = IdPecas.Dotaku;
			case IdPecas.KasaObake:
				//id_peca = IdPecas.KasaObake;
			case IdPecas.Kappa:
				//id_peca = IdPecas.Kappa;
			case IdPecas.Tanuki:
				//id_peca = IdPecas.Tanuki;
				id_peca = ds_g[# xx,yy];
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_dkgray;
				alpha = 1;
				//draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					//c = c_gray;
					alpha = .8;
					//draw_set_alpha(.7);
				
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
				
				draw_sprite_ext(spr_teste,ds_g[# xx,yy],x1,y1,.5,.5,0,c_white,alpha);
				draw_text(x1,y1,ds_g[# xx,yy]);
				//draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				//draw_set_alpha(1);
				break;
		}
	}
}