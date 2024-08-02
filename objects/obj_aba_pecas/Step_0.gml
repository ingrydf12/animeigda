/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if quantia_pecas <= 0 and global.peca_mouse == -1 and !instance_exists(obj_controle_turno) {
	instance_create_layer(room_width-32,room_height/2,"Tabuleiro",obj_controle_turno);
	
	instance_destroy();
}