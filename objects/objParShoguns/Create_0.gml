/// Insta: @jlgamedesign
/// Site: https://linktr.ee/
//

//DADOS
peca_id =			shogun_id-IdPecas.Ashigaru;
nome =				global.grid_pecas_shoguns[# DadosShoguns.Nome, peca_id];
estado =			global.grid_pecas_shoguns[# DadosShoguns.Estado, peca_id];
vida_max =			global.grid_pecas_shoguns[# DadosShoguns.Vida, peca_id];
vida_atual =		vida_max;
dano =				global.grid_pecas_shoguns[# DadosShoguns.Dano, peca_id];
moves =				global.grid_pecas_shoguns[# DadosShoguns.Moves, peca_id];
array_acoes =		global.grid_pecas_shoguns[# DadosShoguns.Acao, peca_id];
array_passivas =	global.grid_pecas_shoguns[# DadosShoguns.Passiva, peca_id];
sprite =			global.grid_pecas_shoguns[# DadosShoguns.Sprite, peca_id];

sprite_index = sprite;
image_xscale = global.escala_sprites;
image_yscale = global.escala_sprites;
//----------------------------

//VARIÁVEIS
clicado = false;
//no_tabuleiro = false;
hover = false;
attack = false;
was_attacked = false;