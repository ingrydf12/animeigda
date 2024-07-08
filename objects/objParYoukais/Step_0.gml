/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if !no_tabuleiro {
	if position_meeting(mouse_x,mouse_y,self) {
	
		if mouse_check_button_pressed(mb_left) {
			if !clicado and global.peca_mouse == -1 {
				clicado = true;
				
				if instance_exists(obj_aba_pecas) {array_delete(obj_aba_pecas.pecas_disponiveis,0,1)}
			
				global.peca_mouse = peca_id;
			}
		}
	}
}

if clicado {
	x = mouse_x-sprite_width/2;
	y = mouse_y-sprite_height/2;
}