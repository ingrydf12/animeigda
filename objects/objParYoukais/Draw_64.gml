/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

var gw = display_get_gui_width(), gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 50;
var c = c_gray, alpha = 1;
draw_set_font(fnt_hud_menu)

if global.informacoes_peca {
	if global.informacoes_peca_inst == self {
		var wquad = 150, hquad = 200;
		var xquad = margin, yquad = gh-margin-hquad;
		
		draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
		
		var buff_quad = 8;
		var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
		var winfo = 134, hinfo = 184;
		c = c_orange;
		draw_rectangle_color(xinfo,yinfo,xinfo+winfo,yinfo+hinfo,c,c,c,c,false);
		
		var buff_dados = 4;
		var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
		//NOME
		draw_set_halign(fa_middle);
		draw_text(xnome,ynome,nome);
		
		
		var xvida = xnome, yvida = ynome+buff_quad+string_height(nome);
		var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
		//VIDA
		draw_text(xvida,yvida,str_hp);
		
		var xpassiva = xinfo+buff_dados, ypassiva = yvida+buff_quad+string_height(str_hp);
		var wpassiva = 126, hpassiva = 30;
		//DISFARCE
		alpha = 1;
		if estado == 0 {
			c = c_green;
			if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
				alpha = .7;
				
				if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR {
					estado = 1;
					
					sprite = array_sprites[estado];
					sprite_index = sprite;
				}
			}
		} else {
			c = c_dkgray;
		}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva,c,c,c,c,false);
		draw_set_alpha(1);
		draw_set_valign(fa_middle);
		draw_text(xpassiva+(wpassiva/2),ypassiva+(hpassiva/2),"DISFARCE");
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);