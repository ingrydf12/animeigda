/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if instance_exists(obj_controle_turno) {
	if !global.primeiro_turno {
		visible = true;
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
	
	if point_distance(x,y,xdest,ydest) <= 1 {
		moving = false;
		moved = true;
		
		//if instance_exists(obj_shogun_controlador) {obj_shogun_controlador.num_inst++}
	}
}