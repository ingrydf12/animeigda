/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if global.selecao_pecas or (global.derrota or global.vitoria) or global.pause {exit}

#region VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6, tamcell = global.tamanho_cell;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
#endregion


if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	if mouse_check_button_pressed(mb_right) {
		audio_play_sound(snd_anime_sfx_ui_clicknormal,2,false,1*global.sfx_volume);
		
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

if hit {
	hit_frames--;
	
	if hit_frames <= 0 {
		hit_frames = 6;
		hit = false;
	}
}

if vida_atual <= 0 {
	global.grid_tabuleiro[# xtabuleiro, ytabuleiro] = NADA;
	//effect_create_below(ef_explosion,x+tamcell/2,y+tamcell/2,.4,c_white);
	var sc = image_xscale+.5;
	var xx = x-((tamcell/2)*(sc-image_xscale)), yy = y-((tamcell*.8)*(sc-image_xscale))
	
	var inst = instance_create_layer(xx,yy,layer,objPecaMorta);
	inst.sprite_index = sprite;
	
	instance_destroy();
}

if reset_state_timer >= reset_state_round {
	reset_state_timer = 0;
	estado = 0;
}

if !instance_exists(objSacerdotisa) {estado = 1}

if attacking {
	sprite = array_sprite[1];
	sprite_index = sprite;
	
	if animation_end() {
		sprite = array_sprite[0];
		
		sprite_index = sprite;
		attacking = false;
	}
}

if moving and !moved {
	x = lerp(x, xdest, .18);
	y = lerp(y, ydest, .18);
	
	if point_distance(x,y,xdest,ydest) <= 1 {
		moving = false;
		moved = true;
	}
	
	var nearest_youkai = collision_rectangle(x,y,xdest+tamcell,ydest+tamcell,objParYoukais,false,false)
	
	if nearest_youkai != noone {
		switch nearest_youkai.peca_id {
			default: //TODAS AS PEÇAS
				if nearest_youkai.estado == 0 {
					effect_create_below(ef_explosion,nearest_youkai.x+tamcell/2,nearest_youkai.y+tamcell/2,.4,c_white);
					instance_destroy(nearest_youkai);
				}
				break;
			case IdPecas.Tanuki:
				if nearest_youkai.estado == 1 {
					var dir = floor(point_direction(nearest_youkai.x,nearest_youkai.y,lastx,lasty)/90);
					xtabuleiro += lengthdir_x(1,dir*90); ytabuleiro += lengthdir_y(1,dir*90);
					while (ds_g[# xtabuleiro, ytabuleiro] != NADA) {
						xtabuleiro += lengthdir_x(1,dir*90); ytabuleiro += lengthdir_y(1,dir*90);
					}
					direcao_peca = dir;
					
					var x1 = xinicial+(xtabuleiro*tamcell)+(xtabuleiro*buff), y1 = yinicial+(ytabuleiro*tamcell)+(ytabuleiro*buff);
					
					with (nearest_youkai) {
						other.vida_atual-=dano;
						sprite = sprite_atk;
						sprite_index = sprite;
	
						if animation_end() {
							sprite = array_sprites[estado];
		
							sprite_index = sprite;
							attacking = false;
						}
						estado = 2;
						armadilha = false;
						armadilha_timer = 0;
					}
					
					moving = true;
					moved = false;
					xdest = x1;
					ydest = y1;
					
					ds_g[# xtabuleiro, ytabuleiro] = shogun_id;
				}
				break;
		}
	}
}