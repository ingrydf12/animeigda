/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
function ds_grid_add_row(){
	///@arg ds_grid
	
	var grid = argument[0];
	ds_grid_resize(grid, ds_grid_width(grid), ds_grid_height(grid) + 1);
	return(ds_grid_height(grid) - 1);
}

function ds_grid_add_youkai() {
	///@arg ds_grid
	
	var ds_g = argument[0];
	var yy = ds_grid_add_row(ds_g);
	
	for (var xx = 0; xx < ds_grid_width(ds_g); xx++) {
		ds_g[# xx, yy] = argument[xx+1];
	}
}

function ds_grid_add_shogun() {
	///@arg ds_grid
	
	var ds_g = argument[0];
	var yy = ds_grid_add_row(ds_g);
	
	for (var xx = 0; xx < ds_grid_width(ds_g); xx++) {
		ds_g[# xx, yy] = argument[xx];
	}
}