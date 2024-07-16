/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if position_meeting(mouse_x,mouse_y,self) and global.peca_mouse == -1 {
	if global.turno == TURNO_JOGADOR {
		image_index = 1;
		
		if mouse_check_button_pressed(mb_left) {
			global.turno = TURNO_INIMIGO;
			
			if global.primeiro_turno {
				global.primeiro_turno = false;
				
				object_set_visible(objParShoguns,true);
			}
			
			if instance_exists(obj_aba_pecas) {instance_destroy(obj_aba_pecas)}
			
			//global.turno = TURNO_JOGADOR;
		}
	}
} else {
	if global.turno == TURNO_JOGADOR and global.peca_mouse == -1 {
		image_index = 0;
	} else {
		image_index = 1;
	}
}