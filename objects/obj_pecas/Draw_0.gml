/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS LOCAIS
var ds_g = ds_seletor;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR A GRID DO TABULEIRO
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var ds_tab_h = ds_grid_height(global.grid_tabuleiro), ds_tab_w = ds_grid_width(global.grid_tabuleiro);
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-(((ds_tab_w/2)+1)*tamcell)-((ds_tab_w+1)*buff), yinicial = rh/2-((ds_tab_h/2)*tamcell)-((ds_tab_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
//var xinicial = rw/2-(((ds_w/2)-1)*tamcell)-(((ds_w/2)-1)*xbuff), yinicial = rh/2-(((ds_h/2)-1)*tamcell)-(((ds_h/2)-1)*ybuff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var c = c_white, alpha = 1;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_w; xx++) {
	for (var yy = 0; yy < ds_h; yy++) {
		//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
		switch ds_g[# xx,yy] {
			//-1 -> NÃO EXISTE ALGO NAQUELA CÉLULA
			case -1:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_white;
				//alpha = 1;
				draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					c = c_red;
					//alpha = .8;
					draw_set_alpha(.8);
					
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse != -1 {
							ds_g[# xx,yy] = global.peca_mouse;
							 global.peca_mouse = -1;
						}
					}
				}
				
				//draw_sprite_ext(spr_teste,ds_g[# xx,yy],x1,y1,.5,.5,0,c_white,alpha);
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_set_alpha(1);
				break;
			//default -> EXISTE ALGO NAQUELA CÉLULA
			default:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_dkgray;
				alpha = 1;
				//draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					//c = c_gray;
					alpha = .8
					//draw_set_alpha(.8);
					
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse == -1 {
							global.peca_mouse = ds_g[# xx,yy];
							ds_g[# xx,yy] = -1;
						}
					}
				}
				
				draw_sprite_ext(spr_teste,ds_g[# xx,yy],x1,y1,.5,.5,0,c_white,alpha);
				//draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				//draw_set_alpha(1);
				break;
		}
	}
}

if global.peca_mouse != -1 {
	draw_sprite_ext(spr_teste,global.peca_mouse,mouse_x-(sprite_get_width(spr_teste)/2)*.5,mouse_y,.5,.5,0,c_white,1);
}