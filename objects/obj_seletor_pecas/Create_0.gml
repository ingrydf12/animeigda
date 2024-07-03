/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
randomize();

tamcell = global.tamanho_cell;
wcell = 1;		//QUANTIDADE DE CÉLULAS NA LARGURA DO SELETOR
hcell = global.hcell;		//QUANTIDADE DE CÉLULAS NA ALTURA DO SELETOR
ds_seletor = ds_grid_create(wcell,hcell);
ds_grid_set_region(ds_seletor,0,0,wcell,hcell,-1);

//LOOP PARA PASSAR POR TODAS AS CÉLULAS DA GRID
for (var xx = 0; xx < ds_grid_width(ds_seletor); xx++) {
	for (var yy = 0; yy < array_length(pecas_disponiveis); yy++) {
		ds_seletor[# xx,yy] = pecas_disponiveis[yy];
		//ds_seletor[# xx,yy] = irandom_range(IdPecas.ChochinObake,IdPecas.AlturaPlayers-1);
	}
}