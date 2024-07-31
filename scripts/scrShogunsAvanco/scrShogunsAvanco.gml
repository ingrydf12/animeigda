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
	///@arg range_min
	///@arg range_max
	///@arg xshogun
	///@arg yshogun
	
	var r_min = argument[0], r_max = argument[1];
	var buff = 6, tamcell = global.tamanho_cell;
	var xshogun = argument[2], yshogun = argument[3];
	var lado;
	var inst = instance_nearest(xshogun,yshogun,objParShoguns);
	
	//EIXO X:
	var i = 0; repeat((r_max*2)+1) {
		var x1 = xshogun - ((r_max*tamcell) + (r_max*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if x1 < xshogun {
			lado = (-1);
		} else if x1 > xshogun {
			lado = 1;
		}
		
		var xmin = xshogun + ( lado * ((r_min*tamcell) + (r_min*buff)) ), ymin = yshogun;
		var xmax = xshogun + ( lado * ((r_max*tamcell) + (r_max*buff)) ), ymax = yshogun;
		
		if (x1 >= xmin and x1 <= xmax) {
			if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {
				inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
				return true
			}
		}
		
		i++;
	}
	
	//EIXO Y:
	i = 0; repeat((r_max*2)+1) {
		var x1 = xshogun, y1 = yshogun - ((r_max*tamcell) + (r_max*buff)) + ((i*tamcell) + (i*buff));
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if y1 < yshogun {
			lado = (-1);
		} else if y1 > yshogun {
			lado = 1;
		}
		
		var xmin = xshogun, ymin = yshogun + ( lado * ((r_min*tamcell) + (r_min*buff)) );
		var xmax = xshogun, ymax = yshogun + ( lado * ((r_max*tamcell) + (r_max*buff)) );
		
		if (y1 >= ymin and y1 <= ymax) {
			if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {
				var inst = instance_nearest(xshogun,yshogun,objParShoguns);
				inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
				return true;
			}
		}
		
		i++;
	}
	
	return false;
}

function youkaiProximo() {
	///@arg range_min
	///@arg range_max
	///@arg xshogun
	///@arg yshogun
	
	var r_min = argument[0], r_max = argument[1];
	var buff = 6, tamcell = global.tamanho_cell;
	var xshogun = argument[2], yshogun = argument[3];
	var lado;
	
	//EIXO X:
	var i = 0; repeat((r_max*2)+1) {
		var x1 = xshogun - ((r_max*tamcell) + (r_max*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if x1 < xshogun {
			lado = (-1);
		} else if x1 > xshogun {
			lado = 1;
		}
		
		var xmin = xshogun + ( lado * ((r_min*tamcell) + (r_min*buff)) ), ymin = yshogun;
		var xmax = xshogun + ( lado * ((r_max*tamcell) + (r_max*buff)) ), ymax = yshogun;
		
		if (x1 >= xmin and x1 <= xmax) {
			var youkai = collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false)
			if youkai != noone {
				var inst = instance_nearest(xshogun,yshogun,objParShoguns);
				inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
				
				switch youkai.peca_id {
					default:
						if youkai.estado == 1 {
							//show_message("Achô");
							return true;
						}
						break;
					case IdPecas.Tanuki:
						if youkai.estado == 2 {
							return true;
						}
						break;
				}
			}
		}
		
		i++;
	}
	
	//EIXO Y:
	i = 0; repeat((r_max*2)+1) {
		var x1 = xshogun, y1 = yshogun - ((r_max*tamcell) + (r_max*buff)) + ((i*tamcell) + (i*buff));
		var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
		if y1 < yshogun {
			lado = (-1);
		} else if y1 > yshogun {
			lado = 1;
		}
		
		var xmin = xshogun, ymin = yshogun + ( lado * ((r_min*tamcell) + (r_min*buff)) );
		var xmax = xshogun, ymax = yshogun + ( lado * ((r_max*tamcell) + (r_max*buff)) );
		
		if (y1 >= ymin and y1 <= ymax) {
			var youkai = collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false)
			if youkai != noone {
				var inst = instance_nearest(xshogun,yshogun,objParShoguns);
				inst.direcao_peca = floor(point_direction(inst.x,inst.y,x1,y1)/90);
				
				switch youkai.peca_id {
					default:
						if youkai.estado == 1 {
							//show_message("Achô");
							return true;
						}
						break;
					case IdPecas.Tanuki:
						if youkai.estado == 2 {
							return true;
						}
						break;
				}
			}
		}
		
		i++;
	}
	
	return false;
}