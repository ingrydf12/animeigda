/// Insta: @jlgamedesign
/// Site: https://linktr.ee/
//

//DADOS
nome = global.grid_pecas_youkais[# DadosYoukais.Nome, peca_id];
estado = global.grid_pecas_youkais[# DadosYoukais.Estado, peca_id];
vida_max = global.grid_pecas_youkais[# DadosYoukais.Vida, peca_id];
vida_atual = vida_max;
array_dano = global.grid_pecas_youkais[# DadosYoukais.Dano, peca_id];
array_moves = global.grid_pecas_youkais[# DadosYoukais.Moves, peca_id];
array_sprites = global.grid_pecas_youkais[# DadosYoukais.Sprite, peca_id];
array_ataques = global.grid_pecas_youkais[# DadosYoukais.Habilidade, peca_id];
array_passivas = global.grid_pecas_youkais[# DadosYoukais.Passiva, peca_id];

sprite = array_sprites[estado];
dano = array_dano[estado];

sprite_index = sprite;
image_xscale = global.escala_sprites;
image_yscale = global.escala_sprites;
//----------------------------

//VARIÁVEIS
clicado = false;
no_tabuleiro = false;
hover = false;