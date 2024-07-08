/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

hover = false;

if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	hover = true;
}

if instance_exists(obj_controle_turno) {
	if !global.primeiro_turno {
		visible = true;
	}
}