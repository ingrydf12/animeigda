/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

function youkaiAvancar() {
	//@arg x1
	//@arg y1
	
	var x1 = argument[0], y1 = argument[1];
	var ds_g = global.grid_tabuleiro;
	
	moved = true;
	direcao_peca = floor((point_direction(x,y,x1,y1))/90);
	
	ds_g[# xtabuleiro, ytabuleiro] = NADA;
	xtabuleiro += (xx-move);
	ds_g[# xtabuleiro, ytabuleiro] = peca_id;
								
	x = x1;
	y = y1;
}

function youkaiDisfarce(){
	
}

function youkaiMetamorfose() {
	
}