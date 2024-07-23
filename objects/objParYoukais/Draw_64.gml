/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

var gw = display_get_gui_width(), gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 50, str_h = string_height("I");
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
		
		//NOME
		var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
		draw_set_halign(fa_middle);
		draw_text(xnome,ynome,nome);
		
		
		//VIDA
		var xvida = xnome, yvida = ynome+buff_quad+str_h;
		var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
		draw_text(xvida,yvida,str_hp);
		
		//DANO
		var xdano = xvida, ydano = yvida+buff_dados+str_h;
		var str_dano = "Dano: " + string(dano);
		
		draw_text(xdano,ydano,str_dano);
		
		//DISFARCE
		var xpassiva = xinfo+buff_dados, ypassiva = ydano+buff_quad+str_h;
		var wpassiva = 126, hpassiva = 30;
		
		alpha = 1;
		if estado == 0 {
			c = c_green;
			if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
				alpha = .7;
				
				if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR and !global.primeiro_turno {
					estado = 1;
					disfarce_round_timer = 0;
					can_attack = false;
					modo_exposicao = TILE_MOVE;
					tile_mode = noone;
					
					dano = array_dano[estado];
					sprite = array_sprites[estado];
					sprite_index = sprite;
				}
			}
		} else {
			c = c_dkgray;
			
			if disfarce_round_timer > disfarce_rounds {
				c = c_red;
				
				if point_in_rectangle(mx,my,xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva) {
					alpha = .7;
				
					if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR and !global.primeiro_turno {
						estado = 0;
						can_attack = false;
						modo_exposicao = TILE_MOVE;
						tile_mode = noone;
						
						dano = array_dano[estado];
						sprite = array_sprites[estado];
						sprite_index = sprite;
					}
				}
			}
		}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xpassiva,ypassiva,xpassiva+wpassiva,ypassiva+hpassiva,c,c,c,c,false);
		draw_set_alpha(1);
		draw_set_valign(fa_middle);
		draw_text(xpassiva+(wpassiva/2),ypassiva+(hpassiva/2),"DISFARCE");
		
		//ATAQUE
		var xataque = xpassiva, yataque = ypassiva+buff_quad+hpassiva;
		var wataque = wpassiva, hataque = hpassiva;
		
		alpha = 1;
		c = c_green;
		var exc = "!";
		if can_attack {
			c = c_gray;
			exc = "";
		}
		
		if point_in_rectangle(mx,my,xataque,yataque,xataque+wataque,yataque+hataque) {
			alpha = .7;
				
			if mouse_check_button_pressed(mb_left) and global.turno == TURNO_JOGADOR and array_ataques[estado] != noone and !global.primeiro_turno and !attacked {
				//can_move = false;
				can_attack = !can_attack;
				
				if can_attack {
					modo_exposicao = TILE_ATTACK;
					tile_mode = modo_exposicao;
				} else {
					modo_exposicao = TILE_MOVE;
					tile_mode = noone;
				}
			}
		}
		
		draw_set_alpha(alpha);
		draw_rectangle_color(xataque,yataque,xataque+wataque,yataque+hataque,c,c,c,c,false);
		draw_set_alpha(1);
		draw_text(xataque+(wataque/2),yataque+(hataque/2),"ATACAR"+exc);
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);