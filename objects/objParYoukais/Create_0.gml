/// Insta: @jlgamedesign
/// Site: https://linktr.ee/
//

randomize();

//DADOS
nome = global.grid_pecas_youkais[# DadosYoukais.Nome, peca_id];
estado = global.grid_pecas_youkais[# DadosYoukais.Estado, peca_id];
vida_max = global.grid_pecas_youkais[# DadosYoukais.Vida, peca_id];
vida_atual = vida_max;
array_dano = global.grid_pecas_youkais[# DadosYoukais.Dano, peca_id];
array_moves = global.grid_pecas_youkais[# DadosYoukais.Moves, peca_id];
array_sprites = global.grid_pecas_youkais[# DadosYoukais.Sprite, peca_id];
sprite_atk = global.grid_pecas_youkais[# DadosYoukais.SpriteAtaque, peca_id];
array_ataques = global.grid_pecas_youkais[# DadosYoukais.Habilidade, peca_id];
array_passivas = global.grid_pecas_youkais[# DadosYoukais.Passiva, peca_id];

sprite = array_sprites[estado];
dano = array_dano[estado];

sprite_index = sprite;
image_index = irandom_range(0,image_number-1);
image_xscale = global.escala_sprites;
image_yscale = global.escala_sprites;
//----------------------------

//VARIÁVEIS
modo_exposicao = TILE_MOVE;
tile_mode = noone;		//VARIÁVEL RESPONS[AVEL POR DIZER QUAIS CÉLULAS DEVEM SER DESENHADAS
clicado = false;		//PODER MOVER DURANTE AS POSIÇÕES DE PEÇAS
//hover = false;			//APARECER AS CÉLULAS POSSÍVEIS PARA SE MOVIMENTAR AO PASSAR O MOUSE POR CIMA
can_move = false;		//ESTADO DE CLIQUE (ESQUERDO) INDICANDO QUE AQUELA PEÇA IRÁ SE MOVER
//can_move_to = false;	//VARIÁVEL INDICANDO QUE AQUELA CÉLULA ESTÁ LIVRE PARA O JOGADOR MOVER A PEÇA
moving = false;
moved = false;			//JÁ MOVEU ESSA PEÇA
can_attack = false;		//ESTADO DE CLIQUE (ESQUERDO) APÓS ATIVAR O MODO DE ATAQUE DAQUELA PEÇA
can_attack_to = false;	//VARIÁVEL INDICANDO QUE AQUELA CÉLULA ESTÁ LIVRE PARA PODER ATACAR
attacked = false;
attacking = false;
hit = false;
hit_frames = 6;
selecionado = false;
direcao_peca = 2;
disfarce_rounds = 2;
disfarce_round_timer = 0;
imune = false;
armadilha = false;
armadilha_timer_limit = 1;
armadilha_timer = 0;