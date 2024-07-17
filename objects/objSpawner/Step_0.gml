/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if round_count > 2 and spawn_count < spawn_limit {
	round_count = 0;
	spawn_count++;
	
	instance_create_layer(x,y,"Pecas",shoguns_array[next_shogun]);
	
	next_shogun = irandom_range(0, array_length(shoguns_array));
}