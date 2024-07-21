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