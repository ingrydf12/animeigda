/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if (global.derrota or global.vitoria) {exit}

if !no_tabuleiro {
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	
		if mouse_check_button_pressed(mb_left) {
			if !clicado and global.peca_mouse == -1 {
				clicado = true;
				
				if instance_exists(obj_aba_pecas) {array_delete(obj_aba_pecas.pecas_disponiveis,0,1)}
			
				global.peca_mouse = peca_id;
			}
		}
	}
	
	if clicado {
		x = mouse_x-sprite_width/2;
		y = mouse_y-sprite_height/2;
	}
} else {
	
	if !can_attack and !can_move {tile_mode = noone}
	
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
		if mouse_check_button_pressed(mb_right) {
			var inst_n = instance_number(objParYoukais);
			if inst_n > 0 {
				for (var i = 0; i < inst_n; i++) {
					var other_insts = instance_find(objParYoukais,i);
									
					//if other_insts != self {
					other_insts.tile_mode = noone;
					other_insts.can_move = false;
					other_insts.can_attack = false;
					other_insts.selecionado = false;
					//}
				}
			}
			
			if global.informacoes_peca_inst == self {
				global.informacoes_peca = !global.informacoes_peca;
			
				if global.informacoes_peca {
					selecionado = true;
					can_move = true;
					can_attack = false;
				} else {
					selecionado = false;
					can_move = false;
					can_attack = false;
					tile_mode = noone;
				}
				
			} else {
				global.informacoes_peca_inst = self;
			
				if global.informacoes_peca {
					selecionado = true;
					can_move = true;
					can_attack = false;
				}
			}
			
		}
		
		if !global.informacoes_peca {tile_mode = modo_exposicao}
	}
	
	if global.informacoes_peca {
		if global.informacoes_peca_inst == self {
			tile_mode = modo_exposicao;
		}
	}
}

if vida_atual <= 0 {
	global.grid_tabuleiro[# xtabuleiro, ytabuleiro] = NADA;
	instance_destroy()
}

		//if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
		//	tile_mode = TILE_MOVE;
		//	if mouse_check_button_pressed(mb_right) and global.peca_mouse == -1 {
		//		if global.informacoes_peca_inst == self {
		//			global.informacoes_peca = !global.informacoes_peca;
				
		//			if global.informacoes_peca {
		//				global.informacoes_peca_inst = self;
		//			}
		//		} else {
		//			global.informacoes_peca = true;
				
		//			if global.informacoes_peca {
		//				global.informacoes_peca_inst = self;
		//			}
		//		}
		//	}
		//}