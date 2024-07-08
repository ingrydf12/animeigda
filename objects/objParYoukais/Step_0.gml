/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

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
} else {
	hover = false;
	
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
		hover = true;
		//if mouse_check_button_pressed(mb_right) {
		//	if global.informacoes_peca_inst == self {
		//		global.informacoes_peca = !global.informacoes_peca;
				
		//		if global.informacoes_peca {
		//			global.informacoes_peca_inst = self;
					
		//			global.informacoes_peca_id = peca_id;
		//		}
		//	} else {
		//		global.informacoes_peca = true;
				
		//		if global.informacoes_peca {
		//			global.informacoes_peca_inst = self;
					
		//			global.informacoes_peca_id = peca_id;
		//		}
		//	}
		//}
	}
}

if clicado {
	x = mouse_x-sprite_width/2;
	y = mouse_y-sprite_height/2;
	
	hover = false;
}