/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var i = 0, arr_leng = array_length(menu_pages);
repeat (arr_leng) {
	ds_grid_destroy(menu_pages[i]);
	i++;
}