/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
randomize();

escala = global.escala_hud;
tamcell = global.tamanho_cell;
wcell = 1;		//QUANTIDADE DE CÉLULAS NA LARGURA DO SELETOR
hcell = ds_list_size(pecas_disponiveis);		//QUANTIDADE DE CÉLULAS NA ALTURA DO SELETOR
ds_seletor = ds_grid_create(wcell,hcell);
ds_grid_set_region(ds_seletor,0,0,wcell,hcell,-1);
wslots = 2;
hslots = 3;

quantia_pecas = hcell;

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < ds_list_size(pecas_disponiveis); yy++) {
		ds_seletor[# xx,yy] = ds_list_find_value(pecas_disponiveis,yy);
		//ds_seletor[# xx,yy] = irandom_range(IdPecas.ChochinObake,IdPecas.AlturaPlayers-1);
	}
}

ds_grid_sort(ds_seletor,0,true);