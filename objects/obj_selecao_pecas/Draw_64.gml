/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var c = c_white, alpha = 1;
global.mouse_check = MOUSE_NEUTRO;

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
	var id_peca = ds_grid[# 0, i];
	var array = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
	var spr = array[0];
	
	c = c_white;
	if point_in_rectangle(mx,my,xslot,yslot,xslot+tam_slot,yslot+tam_slot) {
		alpha = .6;
		c = c_gray;
		
		if mouse_check_button_pressed(mb_left) and i < IdPecas.AlturaPlayers {
			pecas_disponiveis[peca_atual] = ds_grid[# 0, i];
			peca_atual++;
			
			if peca_atual >= limite_pecas {
				instance_create_layer(x,y,"Pecas",obj_aba_pecas,{
					pecas_disponiveis: other.pecas_disponiveis
				})
				
				global.selecao_pecas = false;
				instance_destroy();
			}
		}
	}
	draw_rectangle_color(xslot,yslot,xslot+tam_slot,yslot+tam_slot,c,c,c,c,false);
	
	if i < IdPecas.AlturaPlayers {
		draw_sprite_ext(spr,0,xslot,yslot,global.escala_sprites,global.escala_sprites,0,c_white,alpha);
	}
	
	slot_h++
	if slot_h >= wslots {
		slot_h = 0;
		slot_v++
	}
}

if peca_atual > 0 {
	for (var i = 0; i < array_length(pecas_disponiveis); i++) {
		var id_peca = pecas_disponiveis[i];
		var array = global.grid_pecas_youkais[# DadosYoukais.Sprite, id_peca];
		var spr = array[0];
		alpha = 1;
		
		var xslot = xtabela - margin_tabela - tam_slot;
		var yslot = ytabela + ((i)*tam_slot) + ((i)*buff_slot);
		
		draw_sprite_ext(spr,0,xslot,yslot,global.escala_sprites,global.escala_sprites,0,c_white,alpha);
	}
}