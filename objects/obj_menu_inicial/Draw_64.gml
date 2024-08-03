/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

//VARIÁVEIS
var ds_grid = menu_pages[page], ds_h = ds_grid_height(ds_grid);
var gw = global.view_w, gh = global.view_h;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_opcoes_menu);
var c = non_option_color;
var xbuff = 168*escala, ybuff = 56 * escala;
var xinicial = 96*escala, yinicial = gh/2;

//FUNDO
switch page {
	case MenuPage.MapLevel:
		draw_sprite_stretched(sprMenuPergaminho,0,0,0,gw,gh);
		draw_sprite_stretched(sprIlustracaoMapaBloqueado,0,0,0,gw,gh);
		break;
	case MenuPage.Settings:
		xinicial = 400 * escala; yinicial = (360*escala)-(72*escala);
		draw_sprite_stretched(sprMenuPergaminho,0,0,0,gw,gh);
		break;
	case MenuPage.Main:
		draw_sprite_stretched(sprIlustracaoMenuInicial,0,0,0,gw,gh);
		break;
	case MenuPage.Credits:
		xinicial = xbuff*.7; yinicial = ybuff*.35;
		draw_sprite_stretched(sprMenuCreditos,0,0,0,gw,gh);
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
			
			draw_text_transformed_color(lx_txt+xoff,ly_txt,ds_grid[# 0, i],escala,escala,0,c,c,c,c,1);
		}
		break;
	case MenuPage.Credits:
		draw_sprite_ext(sprVoltarMenuHover,0,xinicial,yinicial,escala*2,escala*2,0,c_white,1);
		break;
	case MenuPage.MapLevel:
		
		for (var i = 0; i < ds_h; i++) {
			
			if file_exists("save.sav") {
				ini_open("save.sav");
				
				var save = ini_read_real("mapas_liberados","Mapa "+string(i+1),false);
						
				ini_close();
						
				if save {
					switch i {
						default:
							draw_sprite_stretched(sprIlustracaoMapa01,0,0,0,gw,gh);
							break;
						case 1:
							draw_sprite_stretched(sprIlustracaoMapa02,0,0,0,gw,gh);
							break;
						case 2:
							draw_sprite_stretched(sprIlustracaoMapa03,0,0,0,gw,gh);
							break;
						case 3:
							draw_sprite_stretched(sprIlustracaoMapa04,0,0,0,gw,gh);
							break;
						case 4:
							draw_sprite_stretched(sprIlustracaoMapa05,0,0,0,gw,gh);
							break;
					}
					
				}
			} else {
				draw_sprite_stretched(sprIlustracaoMapa01,0,0,0,gw,gh);
			}
			
			if menu_option[page] == (ds_h-1) {
				draw_sprite_ext(sprVoltarMenuHover,0,xbuff*.7,ybuff*.35,escala*2,escala*2,0,c_white,1);
			} else {
				if menu_option[page] == i {
					draw_sprite_ext(sprVoltarMenu,0,xbuff*.7,ybuff*.35,escala*2,escala*2,0,c_white,1);
					
					switch i {
						default:
							draw_sprite_ext(sprSelecaoMapa,0,495*escala,345*escala,escala*2,escala*2,0,c_white,1);
							break;
						case 1:
							draw_sprite_ext(sprSelecaoMapa,0,585*escala,475*escala,escala*2,escala*2,0,c_white,1);
							break;
						case 2:
							draw_sprite_ext(sprSelecaoMapa,0,720*escala,380*escala,escala*2,escala*2,0,c_white,1);
							break;
						case 3:
							draw_sprite_ext(sprSelecaoMapa,0,920*escala,460*escala,escala*2,escala*2,0,c_white,1);
							break;
						case 4:
							draw_sprite_ext(sprSelecaoMapa,0,1020*escala,315*escala,escala*2,escala*2,315,c_white,1);
							break;
					}
				}
			}
			
		}
		break;
}

//LINHA DO MEIO
var xlinha = xinicial + 2*xbuff;
c = input_color;
switch page {
	case MenuPage.Settings:
		draw_line_width_color(xlinha,yinicial-ybuff,xlinha,ly_txt+ybuff,4*escala,c,c);
		break;
}

//PARTE DIREITA
draw_set_halign(fa_left);

var rx_txt = xlinha + xbuff/2, ry_txt;
for (var i = 0; i < ds_h; i++) {
	ry_txt = yinicial + (i*ybuff);
	
	switch (ds_grid[# 1, i]) {
		case MenuElementType.Slider:
			var len = 128 * escala;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var dot_pos = (current_value-current_array[0]) / (current_array[1]-current_array[0]);
			
			c = non_option_color;
			draw_line_width_color(rx_txt,ry_txt,rx_txt+len,ry_txt,8*escala,c,c);
			//if (inputting and i == menu_option[page]) {
			//	c = non_option_color;
			//	draw_circle_color(rx_txt+(dot_pos*len),ry_txt,16,c,c,false);
			//}
			c = input_color;
			draw_circle_color(rx_txt+(dot_pos*len),ry_txt,12*escala,c,c,false);
			draw_text_transformed_color(rx_txt+(len*1.2),ry_txt,string(floor(dot_pos*100))+"%",escala,escala,0,c,c,c,c,1);
			break;
		case MenuElementType.Toggle:
			var buff = 64 * escala;
			var current_value = ds_grid[# 3, i];
			var current_array = ds_grid[# 4, i];
			var c1, c2;
			
			c = input_color;
			if current_value = 0 {
				c1 = c;
				c2 = non_option_color;
			} else {
				c1 = non_option_color;
				c2 = c;
			}
			
			draw_set_halign(fa_left);
			draw_text_transformed_color(rx_txt,ry_txt,current_array[0],escala,escala,0,c1,c1,c1,c1,1);
			draw_text_transformed_color(rx_txt+buff,ry_txt,current_array[1],escala,escala,0,c2,c2,c2,c2,1);
			break;
	}
}

//RESET
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);