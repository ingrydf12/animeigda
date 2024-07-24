/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

#region Youkais

#region ENUMS YOUKAIS
enum DadosYoukais {
	Nome,				//NOME
	Estado,				//ESTADO ATUAL
	Vida,				//STATUS DE VIDA
	Dano,				//STATUS DE DANO
	Sprite,				//SPRITE
	Moves,				//LIMITE DE MOVIMENTOS
	Habilidade,			//AÇÕES DISPONÍVEIS
	Passiva,			//PASSIVA
	Altura
}
#endregion

global.grid_pecas_youkais = ds_grid_create(DadosYoukais.Altura,0);

#region Chochin-Obake
ds_grid_add_youkai(
	global.grid_pecas_youkais,		//GRID
	"Chochin-Obake",				//NOME
	0,								//ESTADO ATUAL
	1,								//STATUS DE VIDA
	[0,2],							//STATUS DE DANO
	[sprLampiao,sprChochinObake],	//SPRITE
	[2,1],							//LIMITE DE MOVIMENTOS
	[noone,[atkDistancia,1,2]],		//AÇÕES DISPONÍVEIS
	[youkaiDisfarce,noone]			//PASSIVA
);
#endregion

#region Dotaku
ds_grid_add_youkai(
	global.grid_pecas_youkais,		//GRID
	"Dotaku",						//NOME
	0,								//ESTADO ATUAL
	3,								//STATUS DE VIDA
	[2,3],							//STATUS DE DANO
	[sprSinoBronzeado,sprDotaku],	//SPRITE
	[1,1],							//LIMITE DE MOVIMENTOS
	[[atkPerto,1,1],[atkArea,1,3]],	//AÇÕES DISPONÍVEIS
	[youkaiDisfarce,noone]			//PASSIVA
);
#endregion

#region Kasa-Obake
ds_grid_add_youkai(
	global.grid_pecas_youkais,		//GRID
	"Kasa-Obake",					//NOME
	0,								//ESTADO ATUAL
	2,								//STATUS DE VIDA
	[0,2],							//STATUS DE DANO
	[sprMiniSombra,sprKasaObake],	//SPRITE
	[1,2],							//LIMITE DE MOVIMENTOS
	[noone,[atkPerto,1,1]],				//AÇÕES DISPONÍVEIS
	[youkaiDisfarce,noone]			//PASSIVA
);
#endregion

#region Kappa
ds_grid_add_youkai(
	global.grid_pecas_youkais,		//GRID
	"Kappa",						//NOME
	0,								//ESTADO ATUAL
	4,								//STATUS DE VIDA
	[0,3],							//STATUS DE DANO
	[sprTartagira,sprKappa],		//SPRITE
	[1,3],							//LIMITE DE MOVIMENTOS
	[noone,[atkPerto,1,1]],				//AÇÕES DISPONÍVEIS
	[youkaiDisfarce,noone]			//PASSIVA
);
#endregion

#region Tanuki
ds_grid_add_youkai(
	global.grid_pecas_youkais,			//GRID
	"Tanuki",							//NOME
	0,									//ESTADO ATUAL
	1,									//STATUS DE VIDA
	[0,3,0],							//STATUS DE DANO
	[sprGuaxinim,sprGuaxinim,sprTanuki],//SPRITE
	[1,0,3],							//LIMITE DE MOVIMENTOS
	[noone,[atkArmadilha,1,1],noone],	//AÇÕES DISPONÍVEIS
	[youkaiMetamorfose,noone,noone]		//PASSIVA
);
#endregion

#endregion

#region Shoguns

#region ENUMS SHOGUNS
enum DadosShoguns {
	Nome,				//NOME
	Estado,				//ESTADO ATUAL
	Vida,				//STATUS DE VIDA
	Dano,				//STATUS DE DANO
	Sprite,				//SPRITE
	Moves,				//LIMITE DE MOVIMENTOS
	Acao,				//AÇOES DISPONÍVEIS
	Passiva,			//PASSIVA
	Altura
}
#endregion

global.grid_pecas_shoguns = ds_grid_create(DadosShoguns.Altura,0);

#region Ashigaru
ds_grid_add_shogun(
	global.grid_pecas_shoguns,			//GRID
	"Ashigaru",							//NOME
	0,									//ESTADO ATUAL
	4,									//STATUS DE VIDA
	1,									//STATUS DE DANO
	sprSoldado,							//SPRITE
	2,									//LIMITE DE MOVIMENTOS
	[inimigoAvancar,[atkPertoInimigo,1,1]],	//AÇÕES DISPONÍVEIS
	noone								//PASSIVA
);
#endregion

#region Lanceiro
ds_grid_add_shogun(
	global.grid_pecas_shoguns,						//GRID
	"Lanceiro",										//NOME
	0,												//ESTADO ATUAL
	4,												//STATUS DE VIDA
	2,												//STATUS DE DANO
	sprLanceiro,									//SPRITE
	1,												//LIMITE DE MOVIMENTOS
	[inimigoAvancar,[atkDistanciaInimigo,1,2]],		//AÇÕES DISPONÍVEIS
	noone											//PASSIVA
);
#endregion

#region Arqueiro
ds_grid_add_shogun(
	global.grid_pecas_shoguns,						//GRID
	"Arqueiro",										//NOME
	0,												//ESTADO ATUAL
	2,												//STATUS DE VIDA
	2,												//STATUS DE DANO
	sprArqueiro,									//SPRITE
	2,												//LIMITE DE MOVIMENTOS
	[inimigoAvancar,[atkDistanciaInimigo,2,2]],		//AÇÕES DISPONÍVEIS
	noone											//PASSIVA
);
#endregion

#region Samurai
ds_grid_add_shogun(
	global.grid_pecas_shoguns,			//GRID
	"Samurai",							//NOME
	0,									//ESTADO ATUAL
	6,									//STATUS DE VIDA
	4,									//STATUS DE DANO
	sprSamurai,							//SPRITE
	1,									//LIMITE DE MOVIMENTOS
	[inimigoAvancar,[atkPertoInimigo,1,1]],	//AÇÕES DISPONÍVEIS
	imunidadeFrontal					//PASSIVA
);
#endregion

#region Hatamoto
ds_grid_add_shogun(
	global.grid_pecas_shoguns,			//GRID
	"Hatamoto",							//NOME
	0,									//ESTADO ATUAL
	8,									//STATUS DE VIDA
	5,									//STATUS DE DANO
	sprGeneral,							//SPRITE
	3,									//LIMITE DE MOVIMENTOS
	[inimigoAvancar,[atkPertoInimigo,1,1]],	//AÇÕES DISPONÍVEIS
	noone								//PASSIVA
);
#endregion

#endregion