/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//if instance_exists(obj_controle_turno) {
//	if !global.primeiro_turno {
//		visible = true;
//	}
//}

if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	if mouse_check_button_pressed(mb_right) {
		if informacoes {
			informacoes = false;
		} else {
			var inst_n = instance_number(objParShoguns);
			if inst_n > 0 {
				for (var i = 0; i < inst_n; i++) {
					var other_insts = instance_find(objParShoguns,i);
				
					other_insts.informacoes = false;
				}
			}
			
			informacoes = true;
		}
	}
}

if vida_atual <= 0 {
	global.grid_tabuleiro[# xtabuleiro, ytabuleiro] = NADA;
	instance_destroy()
}

if reset_state_timer >= reset_state_round {
	reset_state_timer = 0;
	estado = 0;
}

if !instance_exists(objSacerdotisa) {estado = 1}

if moving and !moved {
	x = lerp(x, xdest, .15);
	y = lerp(y, ydest, .15);
	
	if place_meeting(x,y,objParYoukais) {
		var nearest_youkai = instance_nearest(x,y,objParYoukais);
		
		if nearest_youkai.estado == 0 {
			//global.grid_tabuleiro[# nearest_youkai.xtabuleiro, nearest_youkai.ytabuleiro] = NADA;
			
			instance_destroy(nearest_youkai);
		}
	}
	
	if point_distance(x,y,xdest,ydest) <= 1 {
		moving = false;
		moved = true;
		
		//if instance_exists(obj_shogun_controlador) {obj_shogun_controlador.num_inst++}
	}
}