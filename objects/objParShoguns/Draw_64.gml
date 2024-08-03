/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
if global.selecao_pecas or (global.derrota or global.vitoria) or global.pause {exit}

var gw = global.view_w, gh = global.view_h;
var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var margin = 64*escala, str_h = string_height("I")*escala;
var input_color = make_color_rgb(83,14,16), non_option_color = make_color_rgb(94,82,77);
var c = input_color, c2 = non_option_color, alpha = 1;
draw_set_font(fnt_ingame);

if informacoes {
	var wquad = 240*escala, hquad = 220*escala;
	var xquad = margin, yquad = gh-margin-hquad;
	
	var buff_quad = 24*escala;
	var xinfo = xquad+buff_quad, yinfo = yquad+buff_quad;
	var winfo = wquad-(buff_quad*2), hinfo = hquad-(buff_quad*2);
	draw_sprite_stretched(sprCardsPecas,0,0,0,gw,gh);
	
	
	var buff_dados = 4*escala;
	var xnome = xinfo+(winfo/2), ynome = yinfo+buff_dados;
	//NOME
	draw_set_halign(fa_middle);
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