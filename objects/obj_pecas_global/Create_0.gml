/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

enum DadosYoukais {
	Nome,				//NOME
	Estado,				//ESTADO ATUAL
	Vida,Dano,			//STATUS DE VIDA E DANO
	Sprite,				//SPRITE
	Moves,				//LIMITE DE MOVIMENTOS
	Habilidade,			//AÇÕES DISPONÍVEIS
	Passiva,			//PASSIVA
	Altura
}

global.grid_pecas_youkais = ds_grid_create(DadosYoukais.Altura,0);

enum DadosShoguns {
	Nome,				//NOME
	Vida,				//STATUS DE VIDA
	Estado,				//ESTADO ATUAL
	Dano,				//STATUS DE DANO
	Sprite,				//SPRITE
	Moves,				//LIMITE DE MOVIMENTOS
	Acao,				//AÇOES DISPONÍVEIS
	Passiva,			//PASSIVA
	Altura
}

global.grid_pecas_shoguns = ds_grid_create(DadosShoguns.Altura,0);