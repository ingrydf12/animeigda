/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if (global.derrota or global.vitoria or global.pause) {exit}

#region VARIÁVEIS LOCAIS
var ds_g = global.grid_tabuleiro;	//FORMA SIMPLIFICADA PARA SE REFERENCIAR ÀS GRIDS
var ds_h = ds_grid_height(ds_g),  ds_w = ds_grid_width(ds_g);	//ALTURA E LARGURA DA GRID DE FORMA SIMPLIFICADA
var rh = room_height, rw = room_width;		//LARGURA E ALTURA DA SALA ATUAL
var buff = 6, tamcell = global.tamanho_cell;		//ESPAÇAMENTOS ENTRE AS CÉLULAS
var xinicial = rw/2-((ds_w/2)*tamcell)-((ds_w/2)*buff), yinicial = rh/2-((ds_h/2)*tamcell)-((ds_h/2)*buff);	//PONTO INICIAL ('X' E 'Y') DO TABULEIRO
#endregion

//ATUALIZAR DADOS CONFORME O ESTADO ATUAL DA PEÇA
dano = array_dano[estado];
sprite = array_sprites[estado];
sprite_index = sprite;

if !no_tabuleiro {
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
	
		if mouse_check_button_pressed(mb_left) {
			if !clicado and global.peca_mouse == -1 {
				clicado = true;
				
				if instance_exists(obj_aba_pecas) {obj_aba_pecas.quantia_pecas--}
			
				global.peca_mouse = peca_id;
			}
		}
	}
	
	if clicado {
		x = mouse_x-sprite_width/2;
		y = mouse_y-sprite_height/2;
	}
} else {
	
	if !can_attack and !can_move {tile_mode = noone}
	
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+global.tamanho_cell,y+global.tamanho_cell) {
		if mouse_check_button_pressed(mb_right) {
			var inst_n = instance_number(objParYoukais);
			if inst_n > 0 {
				for (var i = 0; i < inst_n; i++) {
					var other_insts = instance_find(objParYoukais,i);
									
					//if other_insts != self {
					other_insts.tile_mode = noone;
					other_insts.can_move = false;
					other_insts.can_attack = false;
					other_insts.selecionado = false;
					other_insts.modo_exposicao = TILE_MOVE;
					//}
				}
			}
			
			if global.informacoes_peca_inst == self {
				global.informacoes_peca = !global.informacoes_peca;
				
				if global.informacoes_peca {
					selecionado = true;
					can_move = true;
					can_attack = false;
					tile_mode = TILE_MOVE;
				} else {
					selecionado = false;
					can_move = false;
					can_attack = false;
					tile_mode = noone;
				}
				
			} else {
				global.informacoes_peca_inst = self;
				global.informacoes_peca = true;
			
				if global.informacoes_peca {
					selecionado = true;
					can_move = true;
					can_attack = false;
					tile_mode = TILE_MOVE;
				}
			}
			
		}
		
		if !global.informacoes_peca {tile_mode = modo_exposicao}
	}
	
	if global.informacoes_peca {
		if global.informacoes_peca_inst == self {
			tile_mode = modo_exposicao;
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

if attacking {
	sprite = sprite_atk;
	sprite_index = sprite;
	
	if animation_end() {
		sprite = array_sprites[estado];
		
		sprite_index = sprite;
		attacking = false;
	}
}

if armadilha and armadilha_timer >= armadilha_timer_limit {
	estado = 2;
	armadilha = false;
	armadilha_timer = 0;
	
	//MUDAR O CAMPO VISUAL (TILES DE MOVIMENTO) DA PEÇA PARA O MODO DE MOVIMENTAÇÃO
	tile_mode = noone;
}

var arr = array_ataques[estado];
if arr != noone {
	var atk = arr[0];
}