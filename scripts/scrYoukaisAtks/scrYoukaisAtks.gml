/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

function atkPerto(){
	///@arg x1
	///@arg y1
	
	var x1 = argument[0], y1 = argument[1];
	attacked = true;
	can_attack = false;
	can_move = true;
	modo_exposicao = TILE_MOVE;
	tile_mode = TILE_MOVE;
	
	var inst = instance_nearest(x1,y1,objParShoguns);
	var dir = floor(point_direction(x,y,inst.x,inst.y)/90);
	if dir == 4 {dir = 0}
	
	attacking = true;
	image_index = 0;
	
	switch inst.shogun_id {
		default:
			inst.vida_atual-=dano;
			inst.estado = 1;
			inst.reset_state_timer = 0;
			inst.hit = true;
			
			audio_play_sound(snd_anime_sfx_ataque_yokai,6,false,1*global.sfx_volume);
			break;
		case IdPecas.Samurai:
			var dir_shogun = inst.direcao_peca;
			if dir_shogun == 4 {dir_shogun = 0}
			
			//show_message("Direção do Shogun: " + string(dir_shogun) + "| Direção do Y-S: " + string(dir));
			
			if abs(dir - dir_shogun) != 2 {
				inst.vida_atual-=dano;
				inst.estado = 1;
				inst.reset_state_timer = 0;
				inst.hit = true;
				
				audio_play_sound(snd_anime_sfx_ataque_yokai,6,false,1*global.sfx_volume);
			}
			break;
	}
}

function atkDistancia(){
	///@arg DistanciaMinina
	///@arg DistanciaMaxima
	
	var x1 = argument[0], y1 = argument[1];
	attacked = true;
	can_attack = false;
	can_move = true;
	modo_exposicao = TILE_MOVE;
	tile_mode = TILE_MOVE;
	
	var inst = instance_nearest(x1,y1,objParShoguns);
	var dir = floor(point_direction(x,y,inst.x,inst.y)/90);
	if dir == 4 {dir = 0}
	
	attacking = true;
	image_index = 0;
	
	switch inst.shogun_id {
		default:
			inst.vida_atual-=dano;
			inst.estado = 1;
			inst.reset_state_timer = 0;
			inst.hit = true;
			
			audio_play_sound(snd_anime_sfx_ataque_yokai,6,false,1*global.sfx_volume);
			break;
		case IdPecas.Samurai:
			var dir_shogun = inst.direcao_peca;
			if dir_shogun == 4 {dir_shogun = 0}
			
			//show_message("Direção do Shogun: " + string(dir_shogun) + "| Direção do Y-S: " + string(dir));
			
			if abs(dir - dir_shogun) != 2 {
				inst.vida_atual-=dano;
				inst.estado = 1;
				inst.reset_state_timer = 0;
				inst.hit = true;
				
				audio_play_sound(snd_anime_sfx_ataque_yokai,6,false,1*global.sfx_volume);
			}
			break;
	}
	
	//direcao_peca = dir;
}

function atkArea() {
	///@arg list_shoguns
	///@arg qnt_shoguns
	
	var inst_list = argument[0], inst_n = argument[1];
	
	attacked = true;
	can_attack = false;
	can_move = true;
	modo_exposicao = TILE_MOVE;
	tile_mode = TILE_MOVE;
	
	attacking = true;
	image_index = 0;
	
	for (var i = 0; i < inst_n; i++) {
		var inst = ds_list_find_value(inst_list, i);
		inst.estado = 1;
		inst.vida_atual-=dano;
		inst.reset_state_timer = 0;
		inst.hit = true;
	}
	
	audio_play_sound(snd_anime_sfx_ataque_yokai,6,false,1*global.sfx_volume);
	
	ds_list_destroy(inst_list);
}