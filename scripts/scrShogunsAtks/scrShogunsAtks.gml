/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//
function atkPertoInimigo(shogun, alvo){
	shogun.attacking = true;
	shogun.image_index = 0;
	
	if shogun.estado == 0 {
		global.sacerdotisa_vida-=shogun.dano;
		shogun.direcao_peca = floor(point_direction(shogun.x,shogun.y,objSacerdotisa.x,objSacerdotisa.y)/90);
	} else {
		switch alvo.peca_id {
			default:
				if alvo.estado == 1 {
					shogun.direcao_peca = floor(point_direction(shogun.x,shogun.y,alvo.x,alvo.y)/90);
					
					alvo.vida_atual-=shogun.dano;
					alvo.hit = true;				}
				break;
			case IdPecas.Tanuki:
				if alvo.estado == 2 {
					shogun.direcao_peca = floor(point_direction(shogun.x,shogun.y,alvo.x,alvo.y)/90);
					
					alvo.vida_atual-=shogun.dano;
					alvo.hit = true;
				}
				break;
		}
		
		
	}
}

function atkDistanciaInimigo() {
	///@arg Shogun
	///@arg Alvo
	///@arg DistanciaMinina
	///@arg DistanciaMaxima
	
	var shogun = argument[0], alvo = argument[1];
	var d_min = argument[2], d_max = argument[3];
	var xshogun = shogun.x, yshogun = shogun.y;
	var buff = 6, tamcell = global.tamanho_cell;
	var lado;
	shogun.attacking = true;
	shogun.image_index = 0;
	
	if shogun.estado == 0 {
		//EIXO X:
		var i = 0; repeat((d_max*2)+1) {
			var x1 = xshogun - ((d_max*tamcell) + (d_max*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
			var x2 = x1 + tamcell, y2 = y1 + tamcell;
			
			if x1 < xshogun {
				lado = (-1);
			} else if x1 > xshogun {
				lado = 1;
			}
		
			var xmin = xshogun + ( lado * ((d_min*tamcell) + (d_min*buff)) ), ymin = yshogun;
			var xmax = xshogun + ( lado * ((d_max*tamcell) + (d_max*buff)) ), ymax = yshogun;
		
			if (x1 >= xmin and x1 <= xmax) {
				if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {
					shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
					
					global.sacerdotisa_vida-=shogun.dano;
				}
			}
		
			i++;
		}
	
		//EIXO Y:
		i = 0; repeat((d_max*2)+1) {
			var x1 = xshogun, y1 = yshogun - ((d_max*tamcell) + (d_max*buff)) + ((i*tamcell) + (i*buff));
			var x2 = x1 + tamcell, y2 = y1 + tamcell;
		
			if y1 < yshogun {
				lado = (-1);
			} else if y1 > yshogun {
				lado = 1;
			}
		
			var xmin = xshogun, ymin = yshogun + ( lado * ((d_min*tamcell) + (d_min*buff)) );
			var xmax = xshogun, ymax = yshogun + ( lado * ((d_max*tamcell) + (d_max*buff)) );
		
			if (y1 >= ymin and y1 <= ymax) {
				if collision_rectangle(x1,y1,x2,y2,objSacerdotisa,false,false) {
					shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
					
					global.sacerdotisa_vida-=shogun.dano;
				}
			}
		
			i++;
		}
	} else {
		//EIXO X:
		var i = 0; repeat((d_max*2)+1) {
			var x1 = xshogun - ((d_max*tamcell) + (d_max*buff)) + ((i*tamcell) + (i*buff)), y1 = yshogun;
			var x2 = x1 + tamcell, y2 = y1 + tamcell;
			
			if x1 < xshogun {
				lado = (-1);
			} else if x1 > xshogun {
				lado = 1;
			}
		
			var xmin = xshogun + ( lado * ((d_min*tamcell) + (d_min*buff)) ), ymin = yshogun;
			var xmax = xshogun + ( lado * ((d_max*tamcell) + (d_max*buff)) ), ymax = yshogun;
		
			if (x1 >= xmin and x1 <= xmax) {
				if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false) {
					with(alvo) {
						switch peca_id {
							default:
								if estado == 1 {
									//show_message("Achô");
									shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
									
									vida_atual-=shogun.dano;
									alvo.hit = true;
								}
								break;
							case IdPecas.Tanuki:
								if estado == 2 {
									shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
									
									vida_atual-=shogun.dano;
									alvo.hit = true;
								}
								break;
						}
					}
				}
			}
			
			i++;
		}
		
		//EIXO Y:
		i = 0; repeat((d_max*2)+1) {
			var x1 = xshogun, y1 = yshogun - ((d_max*tamcell) + (d_max*buff)) + ((i*tamcell) + (i*buff));
			var x2 = x1 + tamcell, y2 = y1 + tamcell;
			
			if y1 < yshogun {
				lado = (-1);
			} else if y1 > yshogun {
				lado = 1;
			}
			
			var xmin = xshogun, ymin = yshogun + ( lado * ((d_min*tamcell) + (d_min*buff)) );
			var xmax = xshogun, ymax = yshogun + ( lado * ((d_max*tamcell) + (d_max*buff)) );
			
			if (y1 >= ymin and y1 <= ymax) {
				if collision_rectangle(x1,y1,x2,y2,objParYoukais,false,false) {
					with(alvo) {
						switch peca_id {
							default:
								if estado == 1 {
									//show_message("Achô");
									shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
									
									vida_atual-=shogun.dano;
									alvo.hit = true;
								}
								break;
							case IdPecas.Tanuki:
								if estado == 2 {
									shogun.direcao_peca = floor(point_direction(xshogun,yshogun,x1,y1)/90);
									
									vida_atual-=shogun.dano;
									alvo.hit = true;
								}
								break;
						}
					}
				}
			}
			
			i++;
		}
	}
}