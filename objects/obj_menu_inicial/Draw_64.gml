/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var ds_grid = menu_pages[page], ds_h = ds_grid_height(ds_grid);
var gw = global.view_w, gh = global.view_h;
var xbuff = 16, ybuff = 32;
var xinicial = xbuff*15, yinicial = (gh/2 + ybuff*5) - (((ds_h-1)/2)*ybuff);
var c = c_white;

//FUNDO
c = c_black;
draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);

//PARTE ESQUERDA
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(fnt_hud_menu);

var lx_txt = xinicial - xbuff, ly_txt, xoff;
for (var i = 0; i < ds_h; i++) {
	ly_txt = yinicial + (i*ybuff);
	c = c_white;
	xoff = 0;
	
	if menu_option[page] == i {
		xoff = -(xbuff/2);
		c = c_orange;
	}
	
	draw_text_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],c,c,c,c,1);
}

//LINHA DO MEIO
c = c_white;
switch page {
	case MenuPage.Video:
	case MenuPage.Audio:
		draw_line_color(xinicial,yinicial-ybuff,xinicial,ly_txt+ybuff,c,c);
		break;
}

//PARTE DIREITA
draw_set_halign(fa_left);

var rx_txt = xinicial + xbuff, ry_txt;
for (var i = 0; i < ds_h; i++) {
	ry_txt = yinicial + (i*ybuff);
	
	switch (ds_grid[# 1, i]) {
		case MenuElementType.Slider:
			var len = 64;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var dot_pos = (current_value-current_array[0]) / (current_array[1]-current_array[0]);
			c = c_white;
			
			draw_line_width_color(rx_txt,ry_txt,rx_txt+len,ry_txt,2,c,c);
			if (inputting and i == menu_option[page]) {c = c_yellow}
			draw_circle_color(rx_txt+(dot_pos*len),ry_txt,3,c,c,false);
			draw_text_color(rx_txt+(len*1.2),ry_txt,string(floor(dot_pos*100))+"%",c,c,c,c,1);
			break;
		case MenuElementType.Toggle:
			var buff = 64;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			c = c_white;
			var c1, c2;
			
			if (inputting and i == menu_option[page]) {c = c_yellow}
			if current_value = 0 {
				c1 = c;
				c2 = c_dkgray;
			} else {
				c1 = c_dkgray;
				c2 = c;
			}
			
			draw_text_color(rx_txt,ry_txt,current_array[0],c1,c1,c1,c1,1);
			draw_text_color(rx_txt+buff,ry_txt,current_array[1],c2,c2,c2,c2,1);
			break;
	}
}

//RESET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);