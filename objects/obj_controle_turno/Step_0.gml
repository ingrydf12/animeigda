/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if position_meeting(mouse_x,mouse_y,self) {
	if global.turno == TURNO_JOGADOR {
		image_index = 1;
		
		if mouse_check_button_pressed(mb_left) {
			global.turno = TURNO_ININIGO;
			
			if instance_exists(obj_aba_pecas) {instance_destroy(obj_aba_pecas)}
		}
	}
} else {
	if global.turno == TURNO_JOGADOR {
		image_index = 0;
	} else {
		image_index = 1;
	}
}