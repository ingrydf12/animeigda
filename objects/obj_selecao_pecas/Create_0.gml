/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

switch room {
	case rm_mapa1:
		limite_pecas = 3;
		break;
	case rm_mapa2:
		limite_pecas = 4;
		break;
	case rm_mapa3:
		limite_pecas = 4;
		break;
	case rm_mapa4:
		limite_pecas = 5;
		break;
	case rm_mapa5:
		limite_pecas = 6;
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

var i = 0; repeat(IdPecas.AlturaPlayers) {
	ds_grid[# 0, i] = i;
	
	i++;
}