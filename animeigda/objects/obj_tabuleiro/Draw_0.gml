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
var c = c_white;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_w; xx++) {
	for (var yy = 0; yy < ds_h; yy++) {
		//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
		if ds_g[# xx,yy] == 0 {
			var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
			var x2 = x1+tamcell, y2 = y1+tamcell;
			c = c_white;
			
			if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
				c = c_red;
				
				if mouse_check_button_pressed(mb_left) {
					ds_g[# xx,yy] = 1;
				}
			}
			
			draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
		} else if ds_g[# xx, yy] == 1 {
			var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
			var x2 = x1+tamcell, y2 = y1+tamcell;
			c = c_dkgray;
			
			if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
				c = c_gray;
				
				if mouse_check_button_pressed(mb_left) {
					ds_g[# xx,yy] = 0;
				}
			}
			
			draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
		}
	}
}