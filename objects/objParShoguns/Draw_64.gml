/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
if global.selecao_pecas or (global.derrota or global.vitoria) {exit}

var gw = display_get_gui_width(), gh = display_get_gui_height();
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 50, str_h = string_height("I");
var c = c_gray, alpha = 1;
draw_set_font(fnt_hud_menu)

if informacoes {
	var wquad = 150, hquad = 200;
	var xquad = gw-margin-wquad, yquad = gh-margin-hquad;
	
	draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
	
	var buff_quad = 8;
	var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
	var winfo = 134, hinfo = 184;
	c = c_orange;
	draw_rectangle_color(xinfo,yinfo,xinfo+winfo,yinfo+hinfo,c,c,c,c,false);
	
	var buff_dados = 4;
	var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
	//NOME
	draw_set_halign(fa_middle);
	draw_text(xnome,ynome,nome);
	
	
	var xvida = xnome, yvida = ynome+buff_quad+str_h;
	var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
	//VIDA
	draw_text(xvida,yvida,str_hp);
	
	
	//DANO
	var xdano = xvida, ydano = yvida+buff_dados+str_h;
	var str_dano = "Dano: " + string(dano);
	
	draw_text(xdano,ydano,str_dano);
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);