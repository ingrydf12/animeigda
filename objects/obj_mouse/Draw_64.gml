/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var sca = .3;
var xsimb = mx-((sprite_get_width(spr_teste)/2)*sca);
var ysimb = my-((sprite_get_height(spr_teste)/2)*sca);
switch global.mouse_check {
	case MOUSE_NEUTRO:
		draw_sprite_ext(sprNeutro,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_BLOQUEADO:
		draw_sprite_ext(sprBloqueio,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_CHECKADO:
		draw_sprite_ext(sprCheck,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
	case MOUSE_SWITCH:
		draw_sprite_ext(sprSwitch,0,xsimb,ysimb,sca,sca,0,c_white,1);
		break
}