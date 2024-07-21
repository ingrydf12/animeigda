/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
function inimigoAvancar(){
	///@arg moves_max
	///@arg xdest
	///@arg ydest
	
	var mov = argument[0];
	var xdest = argument[1], ydest = argument[2];
}

function sacerdotisaProxima() {
	///@arg moves_max
	///@arg xshogun
	///@arg yshogun
	
	var mov = argument[0];
	var buff = 6, tamcell = global.tamanho_cell;
	var xshogun = argument[1], yshogun = argument[2];
	
	//EIXO X:
	var i = 0; repeat((mov*2)+1) {
	//for (var yy = 0; yy < ((mov*2)+1); yy++) {
		var x1 = xshogun - ((mov*tamcell) + (mov*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {return true}
		
		i++;
	}
	
	//EIXO Y:
	i = 0; repeat((mov*2)+1) {
	//for (var yy = 0; yy < ((mov*2)+1); yy++) {
		var x1 = xshogun, y1 = yshogun - ((mov*tamcell) + (mov*buff)) + ((i*tamcell) + (i*buff));
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {return true}
		
		i++;
	}
	
	return false;
}

function youkaiProximo() {
	///@arg moves_max
	///@arg xshogun
	///@arg yshogun
	
	var mov = argument[0];
	var buff = 6, tamcell = global.tamanho_cell;
	var xshogun = argument[1], yshogun = argument[2];
	
	//EIXO X:
	var i = 0; repeat((mov*2)+1) {
	//for (var yy = 0; yy < ((mov*2)+1); yy++) {
		var x1 = xshogun - ((mov*tamcell) + (mov*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false) {return true}
		
		i++;
	}
	
	//EIXO Y:
	i = 0; repeat((mov*2)+1) {
	//for (var yy = 0; yy < ((mov*2)+1); yy++) {
		var x1 = xshogun, y1 = yshogun - ((mov*tamcell) + (mov*buff)) + ((i*tamcell) + (i*buff));
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false) {return true}
		
		i++;
	}
	
	return false;
}