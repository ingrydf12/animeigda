/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var c = c_white, alpha = 1;
global.mouse_check = MOUSE_NEUTRO;
draw_set_font(fnt_opcoes_menu);
var last_peca_atual = peca_atual;

//FUNDO
draw_sprite_stretched(sprMenuTropas,0,0,0,gw,gh);
draw_sprite_stretched(sprSelecaoTropas,0,0,0,gw,gh);

//BOTÃO DE VOLTAR
var xbuff = 168*escala, ybuff = 56 * escala;
var xbtnvoltar = xbuff*.7, ybtnvoltar = ybuff*.8;

if point_in_rectangle(mx,my,xbtnvoltar,ybtnvoltar,xbtnvoltar+(sprite_get_width(sprVoltarMenuHover)*2*escala),ybtnvoltar+(sprite_get_height(sprVoltarMenuHover)*2*escala)) {
	draw_sprite_ext(sprVoltarMenuHover,0,xbtnvoltar,ybtnvoltar,escala*2,escala*2,0,c_white,1);
	
	if mouse_check_button_pressed(mb_left) {
		game_restart();
	}
} else {
	draw_sprite_ext(sprVoltarMenu,0,xbtnvoltar,ybtnvoltar,escala*2,escala*2,0,c_white,1);
}

var slot_h = 0;
var slot_v = 0;
for (var i = 0; i < total_slots; i++) {
	
	var xslot = xslotinicial + (slot_h*wtam_slot) + (slot_h*buff_slot);
	var yslot = yslotinicial + (slot_v*htam_slot) + (slot_v*buff_slot);
	//c = c_black; alpha = .2;
	
	//draw_set_alpha(alpha);
	//draw_rectangle_color(xslot,yslot,xslot+wtam_slot,yslot+htam_slot,c,c,c,c,false);
	//draw_set_alpha(1);
	c = c_black; alpha = .6;
	
	if i < array_length(pecas_youkais) {
		var id_peca = ds_grid[# 0, i];
		var array_spr = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
		var spr = array_spr[1];
		var n = 0;
		for (var j = 0; j < ds_list_size(pecas_disponiveis); j++) {
			if ds_list_find_value(pecas_disponiveis,j) == id_peca {
				n++;
			}
		}
		
		if n > 0 {
			alpha = .8;
			
			draw_set_alpha(alpha);
			draw_rectangle_color(xslot,yslot,xslot+wtam_slot,yslot+htam_slot,c,c,c,c,false);
			draw_set_alpha(1);
			
			//QUANTIDADE DO YOUKAI SELECIONADO
			var xnum_y = xslot+wtam_slot/2, ynum_y = yslot+htam_slot/4-margin_tabela;
			
			c = c_white;
			draw_set_valign(fa_top);
			draw_set_halign(fa_center);
			draw_sprite_ext(sprNumeracao,n,xnum_y,ynum_y,escala,escala,0,c_white,1);
			//draw_text_transformed_color(xnum_y,ynum_y,string(n),escala,escala,0,c,c,c,c,1);
			draw_set_valign(-1);
			draw_set_halign(-1);
			
			//SPRITE DO YOUKAI
			draw_sprite_ext(spr,0,xslot,yslot+htam_slot/4,3.5*escala,3.5*escala,0,c_white,1);
		
			var wseta = (sprite_get_width(sprSeta))*escala, hseta = (sprite_get_height(sprSeta))*escala;
			var xseta = xslot+margin_tabela+wseta/2, yseta = ynum_y;
			c = c_black;
			
			//DIMINUIR PEÇA
			//draw_rectangle_color(xseta,yseta,xseta+wseta,yseta+hseta,c,c,c,c,false);
			draw_sprite_ext(sprSeta,0,xseta,yseta,escala,escala,90,c_white,1);
			
			if point_in_rectangle(mx,my,xseta-wseta/2,yseta-hseta/2,xseta+wseta/2,yseta+hseta/2) {
				if ds_list_size(pecas_disponiveis) > 0 {
					for (var j = 0; j < ds_list_size(pecas_disponiveis); j++) {
						var id_peca = ds_list_find_value(pecas_disponiveis,j);
						var array = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
						
						var peca_slot_id = ds_grid[# 0, i];
						
						if mouse_check_button_pressed(mb_left) and id_peca == peca_slot_id and last_peca_atual == peca_atual {
							audio_play_sound(snd_anime_sfx_ui_hover,2,false);
							//array_delete(pecas_disponiveis,j,1);
							//array_sort(pecas_disponiveis, true);
							ds_list_delete(pecas_disponiveis,j);
							//ds_list_sort(pecas_disponiveis,true);
							
							peca_atual--;
						}
					}
				}
			}
			
			//AUMENTAR PEÇA
			xseta = xslot+wtam_slot-margin_tabela-wseta/2;
			//draw_rectangle_color(xseta,yseta,xseta+wseta,yseta+hseta,c,c,c,c,false);
			draw_sprite_ext(sprSeta,0,xseta,yseta,escala,escala,270,c_white,1);
			
			if point_in_rectangle(mx,my,xseta-wseta/2,yseta-hseta/2,xseta+wseta/2,yseta+hseta/2) {
				if mouse_check_button_pressed(mb_left) and i < array_length(pecas_youkais) and last_peca_atual == peca_atual and ds_list_size(pecas_disponiveis) < limite_pecas {
					audio_play_sound(snd_anime_sfx_ui_hover,2,false);
					//array_push(pecas_disponiveis,ds_grid[# 0,i]);
					//array_sort(pecas_disponiveis, true);
					
					ds_list_add(pecas_disponiveis,ds_grid[# 0,i]);
					ds_list_sort(pecas_disponiveis,true);
					
					peca_atual++;
				}
			}
		} else {
			if point_in_rectangle(mx,my,xslot,yslot,xslot+wtam_slot,yslot+htam_slot) {
				alpha = .8;
				
				draw_set_alpha(alpha);
				draw_rectangle_color(xslot,yslot,xslot+wtam_slot,yslot+htam_slot,c,c,c,c,false);
				draw_set_alpha(1);
				
				if mouse_check_button_pressed(mb_left) and i < array_length(pecas_youkais) and last_peca_atual == peca_atual and ds_list_size(pecas_disponiveis) < limite_pecas {
					audio_play_sound(snd_anime_sfx_ui_hover,2,false);
					//array_push(pecas_disponiveis,ds_grid[# 0,i]);
					//array_sort(pecas_disponiveis, true);
					
					ds_list_add(pecas_disponiveis,ds_grid[# 0,i]);
					ds_list_sort(pecas_disponiveis,true);
					
					peca_atual++;
				}
			}
		}
	} else {
		//NÃO PODE SELECIONAR
		draw_set_alpha(alpha);
		draw_rectangle_color(xslot,yslot,xslot+wtam_slot,yslot+htam_slot,c,c,c,c,false);
		draw_set_alpha(1);
	}
	
	slot_h++
	if slot_h >= wslots {
		slot_h = 0;
		slot_v++
	}
}

if peca_atual >= limite_pecas {
	var margquad = 200*escala;
	var wquad = 140*escala;
	var hquad = 80*escala;
	var xquad = gw/2-wquad/2;
	var yquad = gh-hquad-margin_tabela;
	c = c_white;
	
	if point_in_rectangle(mx,my,xquad,yquad,xquad+wquad,yquad+hquad) {
		c = c_dkgray;
		
		if mouse_check_button_pressed(mb_left) {
			audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false);
			
			instance_create_layer(x,y,"AbaPecas",obj_aba_pecas,{
				pecas_disponiveis: other.pecas_disponiveis,
				pecas_youkais: other.pecas_youkais
			})
			
			global.selecao_pecas = false;
			instance_destroy();
			exit;
		}
	}
	
	draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
	
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center);
	c = c_red;
	draw_text_transformed_color(xquad+(wquad/2),yquad+hquad/2,"PRONTO",escala,escala,0,c,c,c,c,1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}

//draw_text(20,10,ds_list_size(pecas_disponiveis));
//draw_text(20,40,peca_atual);

draw_set_font(-1);