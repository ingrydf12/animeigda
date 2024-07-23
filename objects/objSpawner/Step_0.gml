/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if round_count >= round_count_cooldown and spawn_count < spawn_limit {
	var arr = shoguns_array[next_shogun];
	var obj = arr[0];
	var peca = arr[1];
	
	round_count = 0;
	spawn_count++;
	
	instance_create_layer(x,y,"Pecas",obj,{
		xtabuleiro : xtab,
		ytabuleiro : ytab,
		shogun_id : peca
	});
	
	global.grid_tabuleiro[# xtab, ytab] = peca;
	
	next_shogun = irandom_range(0, array_length(shoguns_array)-1);
} else if spawn_count > spawn_limit {
	global.vitoria = true;
}