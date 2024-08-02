/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
if global.selecao_pecas or (global.derrota or global.vitoria) or global.pause {exit}

var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 50*escala, str_h = string_height("I")*escala;
var c = c_gray, alpha = 1;
draw_set_font(fnt_ingame);

if informacoes {
	var wquad = 250*escala, hquad = 200*escala;
	var xquad = gw-margin-wquad, yquad = gh-margin-hquad;
	
	draw_rectangle_color(xquad,yquad,xquad+wquad,yquad+hquad,c,c,c,c,false);
	
	var buff_quad = 8*escala;
	var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
	var winfo = wquad-(buff_quad*2), hinfo = 184*escala;
	c = c_orange;
	draw_rectangle_color(xinfo,yinfo,xinfo+winfo,yinfo+hinfo,c,c,c,c,false);
	
	var buff_dados = 4*escala;
	var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
	//NOME
	draw_set_halign(fa_middle);
	c = c_white;
	draw_text_transformed_color(xnome,ynome,nome,escala,escala,0,c,c,c,c,1);
	
	
	var xvida = xnome, yvida = ynome+buff_quad+str_h;
	var str_hp = "HP: "+string(vida_atual)+"/"+string(vida_max);
	//VIDA
	draw_text_transformed_color(xvida,yvida,str_hp,escala,escala,0,c,c,c,c,1);
	
	
	//DANO
	var xdano = xvida, ydano = yvida+buff_dados+str_h;
	var str_dano = "Dano: " + string(dano);
	
	draw_text_transformed_color(xdano,ydano,str_dano,escala,escala,0,c,c,c,c,1);
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);