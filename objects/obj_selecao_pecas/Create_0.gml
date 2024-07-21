/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

switch room {
	case rm_mapa1:
		limite_pecas = 3;
		pecas_youkais = [IdPecas.ChochinObake, IdPecas.KasaObake];
		break;
	case rm_mapa2:
		limite_pecas = 4;
		pecas_youkais = [IdPecas.ChochinObake, IdPecas.KasaObake];
		break;
	case rm_mapa3:
		limite_pecas = 5;
		pecas_youkais = [IdPecas.ChochinObake, IdPecas.KasaObake, IdPecas.Dotaku];
		break;
	case rm_mapa4:
		limite_pecas = 0;
		pecas_youkais = [IdPecas.ChochinObake, IdPecas.Kappa, IdPecas.Dotaku, IdPecas.Tanuki];
		break;
	case rm_mapa5:
		limite_pecas = 10;
		pecas_youkais = [IdPecas.ChochinObake, IdPecas.KasaObake, IdPecas.Kappa, IdPecas.Dotaku, IdPecas.Tanuki];
		break;
}

pecas_disponiveis = [];
peca_atual = 0;

tam_slot = global.tamanho_cell;
wslots = 4;
hslots = 2;
total_slots = wslots*hslots;
buff_slot = 10;

margin_tabela = 20;
wtabela = (wslots*tam_slot)+(margin_tabela*2)+(buff_slot*(wslots-1));
htabela = (hslots*tam_slot)+(margin_tabela*2)+(buff_slot*(hslots-1));
xtabela = global.view_w/2 - wtabela/2 - margin_tabela;
ytabela = global.view_h/2 - htabela/2 - margin_tabela;

xslotinicial = xtabela + margin_tabela;
yslotinicial = ytabela + margin_tabela;

ds_grid = ds_grid_create(1,total_slots);

var i = 0; repeat(array_length(pecas_youkais)) {
	ds_grid[# 0, i] = i;
	
	i++;
}

if limite_pecas <= 0 {
	instance_create_layer(x,y,"AbaPecas",obj_aba_pecas,{
		pecas_disponiveis: other.pecas_disponiveis
	});
					
	global.selecao_pecas = false;
	instance_destroy();
}