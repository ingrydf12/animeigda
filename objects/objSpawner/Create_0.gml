/// Insta: @jlgamedesign
/// Site: https://linktr.ee/luruska
//


spawn_limit = 4;
spawn_count = 0;

round_count = 0;

shoguns_array = [
	objAshigaru,
	objArqueiro,
	objLanceiro,
	objSamurai,
	objHatamoto
]

next_shogun = irandom_range(0, array_length(shoguns_array));