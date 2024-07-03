/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS LOCAIS
var ds_youkais = global.grid_pecas_youkais, ds_shoguns = global.grid_pecas_shoguns;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_seletor),  ds_w = ds_grid_width(ds_seletor);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var ds_tab_h = ds_grid_height(global.grid_tabuleiro), ds_tab_w = ds_grid_width(global.grid_tabuleiro);
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-(((ds_tab_w/2)+1)*tamcell)-((ds_tab_w+1)*buff), yinicial = rh/2-((ds_tab_h/2)*tamcell)-((ds_tab_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
//var xinicial = rw/2-(((ds_w/2)-1)*tamcell)-(((ds_w/2)-1)*xbuff), yinicial = rh/2-(((ds_h/2)-1)*tamcell)-(((ds_h/2)-1)*ybuff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
var c = c_dkgray, alpha = 1, escala = global.escala_sprites;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID DO SELETOR
for (var xx = 0; xx < ds_w; xx++) {
	for (var yy = 0; yy < ds_h; yy++) {
		//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
		switch ds_seletor[# xx,yy] {
			//-1 -> NÃO EXISTE ALGO NAQUELA CÉLULA
			case -1:
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_dkgray;
				draw_set_alpha(1);
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					draw_set_alpha(.8);
					
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse != -1 {
							ds_seletor[# xx,yy] = global.peca_mouse;
							 global.peca_mouse = -1;
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
				var peca = ds_seletor[# xx,yy];
				var spr = ds_youkais[# DadosYoukais.Sprite, peca][ds_youkais[# DadosYoukais.Estado, peca]];
				
				var x1 = xinicial+(xx*tamcell)+(xx*buff), y1 = yinicial+(yy*tamcell)+(yy*buff);
				var x2 = x1+tamcell, y2 = y1+tamcell;
				c = c_dkgray;
				alpha = 1;
				
				if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
					c = c_gray;
					
					if mouse_check_button_pressed(mb_left) {
						if global.peca_mouse == -1 {
							global.peca_mouse = ds_seletor[# xx,yy];
							ds_seletor[# xx,yy] = -1;
						} else {
							var cell_mouse = global.peca_mouse;
							global.peca_mouse = ds_seletor[# xx,yy];
							ds_seletor[# xx,yy] = cell_mouse;
						}
					}
				}
				
				draw_rectangle_color(x1,y1,x2,y2, c,c,c,c,false);
				draw_sprite_ext(spr,0,x1,y1,escala,escala,0,c_white,alpha);
				break;
		}
	}
}

if global.peca_mouse != -1 {
	var peca = global.peca_mouse;
	var spr = ds_youkais[# DadosYoukais.Sprite, peca][ds_youkais[# DadosYoukais.Estado, peca]];
	
	draw_sprite_ext(spr,0,mouse_x,mouse_y,escala,escala,0,c_white,1);
}

var sca = .3;
var xsimb = mouse_x-((sprite_get_width(spr_teste)/2)*sca);
var ysimb = mouse_y-((sprite_get_height(spr_teste)/2)*sca);
switch global.mouse_check {
	case MOUSE_NEUTRO:
		draw_sprite_ext(sprNeutro,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_BLOQUEADO:
		draw_sprite_ext(sprBloqueio,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_CHECKADO:
		draw_sprite_ext(sprCheck,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_SWITCH:
		draw_sprite_ext(sprSwitch,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
}