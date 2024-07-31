/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
var sca = .6*global.escala_hud;
var xsimb = mx-((sprite_get_width(spr_teste)/2)*sca);
var ysimb = my-((sprite_get_height(spr_teste)/2)*sca);
switch global.mouse_check {
	default:
		sprite_index = sprNeutro;
		draw_sprite_ext(sprNeutro,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
		break;
	//case MOUSE_BLOQUEADO:
	//	draw_sprite_ext(sprBloqueio,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
	//	break;
	//case MOUSE_CHECKADO:
	//	draw_sprite_ext(sprCheck,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
	//	break;
	//case MOUSE_SWITCH:
	//	draw_sprite_ext(sprSwitch,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
	//	break;
	//case MOUSE_ATAQUE:
	//	draw_sprite_ext(sprAtk,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
	//	break;
	case MOUSE_INTERACT:
		sprite_index = sprInteract;
		draw_sprite_ext(sprInteract,image_index,xsimb,ysimb,sca,sca,0,c_white,1);
		break;
}