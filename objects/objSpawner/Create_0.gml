/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//

randomize();

spawn_limit = 4;
spawn_count = 0;

round_count_cooldown = 2;
round_count = 0;

shoguns_array = [
	[objAshigaru,IdPecas.Ashigaru],
	[objArqueiro,IdPecas.Arqueiro],
	[objLanceiro,IdPecas.Lanceiro],
	[objSamurai,IdPecas.Samurai],
	[objHatamoto,IdPecas.Samurai]
]

next_shogun = irandom_range(0, array_length(shoguns_array)-1);