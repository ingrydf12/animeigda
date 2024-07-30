/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var ds_g = global.grid_tabuleiro;
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var tamcell = global.tamanho_cell;
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var c = c_yellow;
var move = moves;


var sc = image_xscale+.5;
draw_sprite_ext(sprite_index,image_index,x-((tamcell/2)*(sc-image_xscale)),y-((tamcell*.8)*(sc-image_xscale)),sc,sc,0,c_white,1);
//draw_self();

if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

if informacoes {
	c = c_red;
	draw_rectangle_color(x,y,x+tamcell,y+tamcell,c,c,c,c,true);
}

draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+tamcell/2,image_xscale,image_yscale,direcao_peca*90,c_white,1);
