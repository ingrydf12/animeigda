/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

switch room {
	case rm_mapa1:
		limite_pecas = 6;
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

pecas_disponiveis = ds_list_create();
peca_atual = 0;

escala = global.escala_hud;
wtam_slot = 212*escala;
htam_slot = 405*escala;
wslots = 5;
hslots = 1;
total_slots = wslots*hslots;
buff_slot = 2*escala;

margin_tabela = 20*escala;
wtabela = ((wslots*wtam_slot)+(margin_tabela*2)+(buff_slot*(wslots-1)))*escala;
htabela = ((hslots*htam_slot)+(margin_tabela*2)+(buff_slot*(hslots-1)))*escala;
xtabela = 83*escala;
ytabela = 178*escala;

xslotinicial = xtabela + margin_tabela;
yslotinicial = ytabela + margin_tabela;

ds_grid = ds_grid_create(1,total_slots);

var i = 0; repeat(array_length(pecas_youkais)) {
	ds_grid[# 0, i] = pecas_youkais[i];
	
	i++;
}

if limite_pecas <= 0 {
	instance_create_layer(x,y,"AbaPecas",obj_aba_pecas,{
		pecas_disponiveis: other.pecas_disponiveis,
		pecas_youkais: other.pecas_youkais
	});
					
	global.selecao_pecas = false;
	instance_destroy();
}