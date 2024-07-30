/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var ds_grid = menu_pages[page], ds_h = ds_grid_height(ds_grid);
var gw = global.view_w, gh = global.view_h;
var escala = global.escala_sprites;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_opcoes_menu);
var c = non_option_color, scale = sprite_get_width(menu)/gw;
var xbuff = 16, ybuff = 56 * escala;
var xinicial = 96, yinicial = gh/2;

//FUNDO
switch page {
	case MenuPage.Settings:
		xinicial = 320 * escala; yinicial = (gh/2)-(96 * escala);
		break;
}

//PARTE ESQUERDA
var lx_txt = xinicial, ly_txt, xoff;
switch page {
	default:
		for (var i = 0; i < ds_h; i++) {
			ly_txt = yinicial + (i*ybuff);
			c = non_option_color;
			xoff = 0;
			
			if menu_option[page] == i {
				//xoff = xbuff/2;
				c = input_color;
			}
			//draw_text_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],c,c,c,c,1);
			draw_text_transformed_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],scale,scale,0,c,c,c,c,1);
		}
		break;
	case MenuPage.MapLevel:
		for (var i = 0; i < ds_h; i++) {
			ly_txt = yinicial + (i*ybuff);
			c = non_option_color;
			xoff = 0;
			
			if menu_option[page] == i {
				//xoff = xbuff/2;
				c = input_color;
			}
			//draw_text_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],c,c,c,c,1);
			draw_text_transformed_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],scale,scale,0,c,c,c,c,1);
		}
		break;
}

//LINHA DO MEIO
var xlinha = gw/2;
c = input_color;
switch page {
	case MenuPage.Settings:
		draw_line_width_color(xlinha,yinicial-ybuff,xlinha,ly_txt+ybuff,4,c,c);
		break;
}

//PARTE DIREITA
draw_set_halign(fa_left);

var rx_txt = xlinha + (3*xbuff), ry_txt;
for (var i = 0; i < ds_h; i++) {
	ry_txt = yinicial + (i*ybuff);
	
	switch (ds_grid[# 1, i]) {
		case MenuElementType.Slider:
			var len = 128 * escala;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var dot_pos = (current_value-current_array[0]) / (current_array[1]-current_array[0]);
			
			c = non_option_color;
			draw_line_width_color(rx_txt,ry_txt,rx_txt+len,ry_txt,8,c,c);
			//if (inputting and i == menu_option[page]) {
			//	c = non_option_color;
			//	draw_circle_color(rx_txt+(dot_pos*len),ry_txt,16,c,c,false);
			//}
			c = input_color;
			draw_circle_color(rx_txt+(dot_pos*len),ry_txt,12,c,c,false);
			draw_text_color(rx_txt+(len*1.2),ry_txt,string(floor(dot_pos*100))+"%",c,c,c,c,1);
			break;
		case MenuElementType.Toggle:
			var buff = 64 * escala;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var c1, c2;
			
			//if (inputting and i == menu_option[page]) {
			//	var sc = 1.3;
			//	c = non_option_color;
			//	if current_value == 0 {
			//		draw_text_transformed_color(rx_txt-2,ry_txt,current_array[0],sc,sc,0,c,c,c,c,1);
			//	} else {
			//		draw_text_transformed_color(rx_txt+buff-2,ry_txt,current_array[1],sc,sc,0,c,c,c,c,1);
			//	}
			//}
			
			c = input_color;
			if current_value = 0 {
				c1 = c;
				c2 = non_option_color;
			} else {
				c1 = non_option_color;
				c2 = c;
			}
			
			draw_set_halign(fa_left);
			draw_text_color(rx_txt,ry_txt,current_array[0],c1,c1,c1,c1,1);
			draw_text_color(rx_txt+buff,ry_txt,current_array[1],c2,c2,c2,c2,1);
			break;
	}
}

//RESET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);