// @ingryd" 
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

hsp = (direita - esquerda) * vel
vsp = (baixo - cima) * vel

//o x aumenta conforme o resultado do hsp e o y aumenta conforme o vsp
x+= hsp
y+=vsp

//escala de imagem teste
image_xscale = 3
image_yscale = 3