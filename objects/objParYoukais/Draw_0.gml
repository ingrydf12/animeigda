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

if hover or (global.informacoes_peca and global.informacoes_peca_inst == self and !global.primeiro_turno) {
	for (var xx = 0; xx < ((move*2)+1); xx++) {
		var x1 = x + ((move*tamcell)+(move*buff)) - (xx*tamcell) - (xx*buff), y1 = y;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) {
			c = c_red;
		}
		
		if x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 >= (xinicial) {
			draw_set_alpha(.4);
			draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
			draw_set_alpha(1);
		}
	}
	
	for (var xx = 0; xx < ((move*2)+1); xx++) {
		var x1 = x, y1 = y + ((move*tamcell)+(move*buff)) - (xx*tamcell) - (xx*buff);
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) {
			c = c_red;
		}
		
		if y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 >= (yinicial) {
			draw_set_alpha(.4);
			draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
			draw_set_alpha(1);
		}
	}
}

can_move_to = false;

if about_to_move {
	for (var xx = 0; xx < ((move*2)+1); xx++) {
		var x1 = x + ((move*tamcell)+(move*buff)) - (xx*tamcell) - (xx*buff), y1 = y;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) or collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,true) {
			c = c_red;
		}
		
		if x1 < (xinicial+(ds_w*tamcell)+(ds_w*buff)) and x1 >= (xinicial) {
			draw_set_alpha(.4);
			draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
			draw_set_alpha(1);
			
			if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
				can_move_to = true;
			}
		}
	}
	
	for (var xx = 0; xx < ((move*2)+1); xx++) {
		var x1 = x, y1 = y + ((move*tamcell)+(move*buff)) - (xx*tamcell) - (xx*buff);
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) {
			c = c_red;
		}
		
		if y1 < (yinicial+(ds_h*tamcell)+(ds_h*buff)) and y1 >= (yinicial) {
			draw_set_alpha(.4);
			draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
			draw_set_alpha(1);
			
			if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
				can_move_to = true;
			}
		}
	}
}

draw_self();