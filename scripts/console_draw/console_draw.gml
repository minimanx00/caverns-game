// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function console_draw(){
	var _xx = 0;
	var _yy = display_get_gui_height()*0.6;
	draw_set_halign(fa_left); draw_set_valign(fa_bottom);
	var string_h = string_height("II");
	var _wrote_text = false;
	
	if(debugconsole_time>0 or (console_on and array_length(consoletextcorrection)<=0)){
		if(debugconsole_text!=""){
			draw_set_color(c_gray);
			draw_text(_xx,_yy-string_h,debugconsole_text);
			_wrote_text = true;
		}

	}
	
	draw_set_color(c_white)
	
	if(console_on){
		var _txt = consoletext;
		var string_w = string_width(_txt);
	

		if(wave(-1,1,2,0)<0){_txt+="|"}
		draw_text(_xx+2,_yy,_txt);
	 
		var l = array_length(consoletextcorrection);
		var _y = 0;
		if(l>0){
			for(var i = 0; i < l; i++){
				var sww = string_width(consoletextcorrection[i]);
				var shh = string_height(consoletextcorrection[i]);
				draw_text(_xx+16,_yy-string_h-_y,consoletextcorrection[i]);
				_y += shh;
			}
		}else{
			if(!_wrote_text){
				draw_text(_xx,_yy-string_h,"type here:");	
			}
		}
	}
}