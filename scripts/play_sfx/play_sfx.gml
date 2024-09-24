function play_sfx(aud,pitch=1,vol=1){
	
	var snd = audio_play_sound(aud,1,false,vol,0,pitch);
	
	return(snd);
}

function play_sfx_r(aud,vol=1){
	play_sfx(aud,random_range(0.95,1.05),vol);
}