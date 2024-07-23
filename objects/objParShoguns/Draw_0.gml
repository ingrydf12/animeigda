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


draw_self();
//draw_text(x,y,estado);

draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+tamcell/2,image_xscale,image_yscale,direcao_peca*90,c_white,1);