/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var c = c_white;

draw_set_font(fnt_opcoes_menu);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_color(640*escala,32*escala,"Turno de : " + global.turno,escala,escala,0,c,c,c,c,1);
draw_set_valign(-1);
draw_set_halign(-1);
draw_set_font(-1);