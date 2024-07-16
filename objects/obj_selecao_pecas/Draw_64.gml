/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var c = c_white, alpha = 1;
global.mouse_check = MOUSE_NEUTRO;
draw_set_font(fnt_hud_menu);

c = c_black;
draw_set_alpha(.5);
draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
draw_set_alpha(1);

c = c_red;
draw_rectangle_color(xtabela,ytabela,xtabela+wtabela,ytabela+htabela,c,c,c,c,false);

var xtxt = xtabela+wtabela/2, ytxt = ytabela - margin_tabela;
draw_set_valign(fa_middle)
draw_set_halign(fa_center);
draw_text(xtxt,ytxt,"Limite de Youkais: " + string(limite_pecas) + ".");
draw_set_valign(-1);
draw_set_halign(-1);

var slot_h = 0;
var slot_v = 0;
for (var i = 0; i < total_slots; i++) {
	
	var xslot = xslotinicial + (slot_h*tam_slot) + (slot_h*buff_slot);
	var yslot = yslotinicial + (slot_v*tam_slot) + (slot_v*buff_slot);
	
	c = c_orange;
	alpha = 1;
	
	c = c_white;
	if point_in_rectangle(mx,my,xslot,yslot,xslot+tam_slot,yslot+tam_slot) and peca_atual < limite_pecas {
		alpha = .6;
		c = c_gray;
		
		if mouse_check_button_pressed(mb_left) and i < array_length(pecas_youkais) {
			pecas_disponiveis[peca_atual] = ds_grid[# 0, i];
			peca_atual++;
		}
	}
	
	draw_rectangle_color(xslot,yslot,xslot+tam_slot,yslot+tam_slot,c,c,c,c,false);
	
	if i < array_length(pecas_youkais) {
		var id_peca = ds_grid[# 0, i];
		var array = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
		var spr = array[0];
		
		draw_sprite_ext(spr,0,xslot,yslot,global.escala_sprites,global.escala_sprites,0,c_white,alpha);
	}
	
	slot_h++
	if slot_h >= wslots {
		slot_h = 0;
		slot_v++
	}
}

if peca_atual > 0 {
	for (var i = 0; i < peca_atual; i++) {
		var id_peca = pecas_disponiveis[i];
		var array = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
		var spr = array[0];
		alpha = 1;
		
		var xslot = xtabela - margin_tabela - tam_slot;
		var yslot = (ytabela+htabela/2) - (((array_length(pecas_disponiveis))/2)*buff_slot) - (((array_length(pecas_disponiveis))/2)*tam_slot) + ((i)*tam_slot) + ((i)*buff_slot);
		
		if point_in_rectangle(mx,my,xslot,yslot,xslot+tam_slot,yslot+tam_slot) {
			if mouse_check_button_pressed(mb_left) {
				array_delete(pecas_disponiveis,i,1);
				peca_atual--;
			}
		}
		
		draw_sprite_ext(spr,0,xslot,yslot,global.escala_sprites,global.escala_sprites,0,c_white,alpha);
		
		if peca_atual >= limite_pecas {
			var margquad = 200;
			var wquad = 100;
			var hquad = 50;
			var xquad = gw-margquad-wquad;
			var yquad = (gh/2)-(hquad/2);
			c = c_white;
			
			if point_in_rectangle(mx,my,xquad,yquad,xquad+wquad,yquad+hquad) {
				c = c_dkgray;
				
				if mouse_check_button_pressed(mb_left) {
					instance_create_layer(x,y,"AbaPecas",obj_aba_pecas,{
						pecas_disponiveis: other.pecas_disponiveis
					})
					
					global.selecao_pecas = false;
					instance_destroy();
					exit;
				}
			}
			
			draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
			
			draw_set_valign(fa_middle)
			draw_set_halign(fa_center);
			draw_set_color(c_red);
			draw_text(xquad+(wquad/2),gh/2,"PRONTO");
			draw_set_color(c_white);
			draw_set_valign(-1);
			draw_set_halign(-1);
		}
	}
}

draw_set_font(-1);