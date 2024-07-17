/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var gh = display_get_gui_height(), gw =display_get_gui_width();
var c = c_white, scale = 1;
var ybuff = 64;
draw_set_font(fnt_hud_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if global.derrota {
	c = c_black;
	draw_set_alpha(.6);
	draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
	draw_set_alpha(1);
	
	c = c_white;
	draw_text_transformed_color(gw/2,gh/2-ybuff,"DERROTA",scale,scale,0,c,c,c,c,1);
	var c1 = c, c2 = c_black;
	
	var wbtn = 128, hbtn = 64;
	var xbtn = (gw/2)-(wbtn/2), ybtn = (gh/2)-(hbtn/2)+ybuff;
	
	if point_in_rectangle(mx,my,xbtn,ybtn,xbtn+wbtn,ybtn+hbtn) {
		c1 = c_black; c2 = c;
		
		if mouse_check_button_pressed(mb_left) {game_restart()}
	}
	
	draw_rectangle_color(xbtn,ybtn,xbtn+wbtn,ybtn+hbtn,c1,c1,c1,c1,false);
	draw_text_transformed_color(xbtn+wbtn/2,ybtn+hbtn/2,"RESETAR",scale,scale,0,c2,c2,c2,c2,1);
}

if global.vitoria {
	c = c_black;
	draw_set_alpha(.6);
	draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
	draw_set_alpha(1);
	
	c = c_white;
	draw_text_transformed_color(gw/2,gh/2-ybuff,"VITÓRIA",scale,scale,0,c,c,c,c,1);
	var c1 = c, c2 = c_black;
	
	var wbtn = 128, hbtn = 64;
	var xbtn = (gw/2)-(wbtn/2), ybtn = (gh/2)-(hbtn/2)+ybuff;
	
	if point_in_rectangle(mx,my,xbtn,ybtn,xbtn+wbtn,ybtn+hbtn) {
		c1 = c_black; c2 = c;
		
		if mouse_check_button_pressed(mb_left) {
			
			ini_open("save.sav");
			
			ini_write_real("mapas_liberados",global.proximo_mapa,true);
			
			ini_close();
			
			game_restart();
		}
	}
	
	draw_rectangle_color(xbtn,ybtn,xbtn+wbtn,ybtn+hbtn,c1,c1,c1,c1,false);
	draw_text_transformed_color(xbtn+wbtn/2,ybtn+hbtn/2,"MENU",scale,scale,0,c2,c2,c2,c2,1);
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);