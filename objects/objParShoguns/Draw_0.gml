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
var c = c_yellow;
var move = moves;

var xsc = image_xscale+.5, ysc = image_xscale+.5;
var xx = x-((tamcell/2)*(xsc-image_xscale)), yy = y-((tamcell*.8)*(ysc-image_xscale))

switch direcao_peca {
	case 2:
		xx = x+((tamcell/2)*(xsc+image_xscale));
		xsc = -xsc;
		break;
}

if hit {
	gpu_set_fog(true,c_white,0,0);
	draw_sprite_ext(sprite_index,image_index,xx,yy,xsc,ysc,0,c_white,1);
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_sprite_ext(sprite_index,image_index,xx,yy,xsc,ysc,0,c_white,1);
}

//draw_self();

if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

if informacoes {
	c = c_red;
	draw_set_alpha(.6);
	draw_rectangle_color(x,y,x+tamcell,y+tamcell,c,c,c,c,true);
	draw_rectangle_color(x+1,y+1,x+tamcell-1,y+tamcell-1,c,c,c,c,true);
	draw_set_alpha(1);
}

switch direcao_peca {
	default:
		draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+(tamcell/2)+12,image_xscale,image_yscale,direcao_peca*90,c_white,1);
		break;
	case 2:
		draw_sprite_ext(sprDirecaoPeca,0,x+tamcell/2,y+(tamcell/2)+12,image_xscale,-(image_yscale),direcao_peca*90,c_white,1);
		break;
	case 1:
	case 3:
		draw_sprite_ext(sprDirecaoPeca,0,x+(tamcell/2)+14,y+tamcell/2,image_xscale,image_yscale,direcao_peca*90,c_white,1);
		break;
}