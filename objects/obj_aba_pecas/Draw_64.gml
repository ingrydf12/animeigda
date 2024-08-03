/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//


var ds_youkais = global.grid_pecas_youkais, ds_shoguns = global.grid_pecas_shoguns;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = hcell,  ds_w = wcell;
var gh = global.view_h, gw = global.view_w;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var scale = escala*1.2;
var buff = 8*escala, margin = 48*escala;
var margin_inv = 0*escala;
var tamcell = global.tamanho_cell*escala;
var winv = 168*escala, hinv = 364*escala;
var xinv = 98*escala, yinv = 120*escala;
var xslot_inicial = xinv + (200*escala) - margin, yslot_inicial = (yinv+hinv/2) - (((hcell/2)+1)*tamcell) + (((hcell/2)+1)*buff);
var c = c_dkgray, alpha = 1;

draw_sprite_stretched(sprInvAbertoTropasIngame,0,0,0,gw,gh);
//draw_set_alpha(.6);
//draw_rectangle(xinv,yinv,xinv+winv,yinv+hinv,false);
//draw_set_alpha(1)
var slot_h = 0;
var slot_v = 0;
//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID DO SELETOR
for (var yy = 0; yy < array_length(pecas_youkais); yy++) {
	//DESENHAR ALGO SE O VALOR DAQUELA CÉLULA FOR IGUAL A '0'
	var peca = pecas_youkais[yy];
	var spr = ds_youkais[# DadosYoukais.Sprite, peca][ds_youkais[# DadosYoukais.Estado, peca]];
	var n = 0;
	var x1 = xinv+margin_inv+(slot_h*tamcell)+(slot_h*buff), y1 = yinv+(slot_v*tamcell)+(slot_v*buff)+margin_inv;
	var x2 = x1+(global.tamanho_cell*scale), y2 = y1+(global.tamanho_cell*scale);
	
	for (var i = 0; i < ds_grid_height(ds_seletor); i++) {
		if ds_seletor[# 0, i] == peca {
			n++;
		}
		
		if n > 0 and ds_seletor[# 0, i] != NADA {
			if point_in_rectangle(mx,my,x1,y1,x2,y2) {
				if mouse_check_button_pressed(mb_left) and global.peca_mouse == NADA {
					global.peca_mouse = ds_seletor[# 0, i];
					
					var inst = instance_create_layer(x1,y1,"Pecas",objParYoukais,{
						peca_id : global.peca_mouse,
						xtabuleiro : 0,
						ytabuleiro : i
					});
					
					inst.clicado = true;
					quantia_pecas--;
					ds_seletor[# 0, i] = -1;
				}
			}
		}
	}
	
	
	draw_sprite_ext(spr,0,x1,y1,scale,scale,0,c_white,alpha);
	tamcell = global.tamanho_cell*scale;
	draw_sprite_ext(sprNumeracao,n,x1+(tamcell*.8),y1+(tamcell*.8),escala/2,escala/2,0,c_white,1);
	
	slot_v++;
	if slot_v >= hslots {
		slot_v = 0;
		slot_h++
	}
}