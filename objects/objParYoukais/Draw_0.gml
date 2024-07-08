/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var tamcell = global.tamanho_cell;
var c = c_yellow;

if hover {
	for (var xx = 0; xx < ((array_moves[estado]*2)+1); xx++) {
		var x1 = x + ((array_moves[estado]*tamcell)+(array_moves[estado]*buff)) - (xx*tamcell) - (xx*buff), y1 = y;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) {
			c = c_red;
		}
		
		draw_set_alpha(.4);
		draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
		draw_set_alpha(1);
	}
	
	for (var xx = 0; xx < ((array_moves[estado]*2)+1); xx++) {
		var x1 = x, y1 = y + ((array_moves[estado]*tamcell)+(array_moves[estado]*buff)) - (xx*tamcell) - (xx*buff);
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		c = c_yellow;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,true) {
			c = c_red;
		}
		
		draw_set_alpha(.4);
		draw_rectangle_color(x1,y1,x2,y2,c,c,c,c,false);
		draw_set_alpha(1);
	}
}

draw_self();