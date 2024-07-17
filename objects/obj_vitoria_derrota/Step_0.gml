/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

if room == rm_menu {exit}

if (global.primeiro_turno or global.selecao_pecas) {exit}

if (global.derrota or global.vitoria) {exit}

var inst_n = instance_number(objParYoukais);
if (inst_n <= 0 or global.sacerdotisa_vida <= 0) {
	global.derrota = true;
}

inst_n = instance_number(objParShoguns);
if (inst_n <= 0) {
	global.vitoria = true;
}

if keyboard_check_pressed(vk_backspace) {global.derrota = true}

if keyboard_check_pressed(vk_tab) {global.vitoria = true}