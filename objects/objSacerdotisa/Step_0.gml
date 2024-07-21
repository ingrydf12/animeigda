/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.sacerdotisa_vida <= 0 {
	global.grid_tabuleiro[# obj_tabuleiro.xsacerdotisa, obj_tabuleiro.ysacerdotisa] = NADA;
	
	instance_destroy();
}