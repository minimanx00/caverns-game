enum CONSOLE {
	CORRECTION,
	EXECUTE
}



function console_setup(){
	consoletext = "";
	consoletimer = 0;
	consolehistory = [];
	consolecmdtemp = "";
	consoledelimeter = " ";
	consoletextchanged = false;
	
	consoletextcorrection = [];
	consoleonexecution = function(){}
}


function console_step(){
	// typing
	if(keyboard_check(vk_anykey)){
		consoletext = consoletext+string(keyboard_string);
		keyboard_string = "";
		consoletextchanged = true;
	
	}

	// deleting
	if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and consoletimer == 4){
		consoletext = string_delete(consoletext,string_length(consoletext),1);
		consoletimer = 0;
		keyboard_string = "";
		consoletextchanged = true;
	}

	if(keyboard_check_pressed(vk_backspace)){
		consoletext = string_delete(consoletext,string_length(consoletext),1);
		consoletimer = -12;
		keyboard_string = "";	
		consoletextchanged = true;
	}

	if(consoletimer != 4){
		consoletimer++;
	}
	
	// tabbing
	if(keyboard_check_pressed(vk_tab)){
		if(array_length(consoletextcorrection)>0){
			var _ss = string_split(consoletext,consoledelimeter,false);
			array_pop(_ss)
			consoletext = "";
			for(var i = 0; i<array_length(_ss); i++){
				consoletext += _ss[i] + consoledelimeter;
			}
			consoletext += consoletextcorrection[0] + " ";
			consoletextchanged = true;
		}
	}
	
	// temp console cmd
	var _ss = string_split(consoletext,consoledelimeter,false);
	if(array_length(_ss)>0 and _ss[0]!=consolecmdtemp){
		consolecmdtemp = _ss[0];	
	}
	
	if(consoletextchanged){
		
		if(array_length(_ss)<=1){
			// commands
			if(_ss[0]!=""){
			var _ret = struct_get_names(global.console_commands);
			consoletextcorrection = array_filter_name(_ret,_ss[0]);	
			}else{consoletextcorrection = []}
		
		}else{
			// inside of commands
			if(struct_exists(global.console_commands,consolecmdtemp)){
				var _s = struct_get(global.console_commands,consolecmdtemp);
				array_shift(_ss);
		
				var _ret = _s(CONSOLE.CORRECTION,_ss,array_length(_ss)-1);
		
				if(is_undefined(_ret)){consoletextcorrection=[];}else{
					consoletextcorrection = array_filter_name(_ret,_ss[array_length(_ss)-1]);	
				}
			}else{consoletextcorrection = []}
		}
		
		consoletextchanged = false;
	}
	
	
	// entering
	if(keyboard_check_pressed(vk_enter)){
		console_activate(consoletext,true,true);
		consoletext = "";
		consolecmdtemp = "";
		consoletextchanged = true;
		consoleonexecution();
	}
}


function console_activate(_cmnd,_remember=false,_log=false){
	if(is_string(_cmnd)){
	var _arr = string_split(_cmnd,consoledelimeter,false);
	}else{var _arr = _cmnd;}
	
	if(struct_exists(global.console_commands,_arr[0])){
	var _s = struct_get(global.console_commands,_arr[0]);
	array_shift(_arr);
	
	var _ret = _s(CONSOLE.EXECUTE,_arr);
	
	if(DEBUG and _log){console_response(string(_ret))}
	
	if(_log and is_string(_ret)){show_debug_message(_ret)}
	}
}

function console_cmd_add(_name,_function){
if(!variable_global_exists("console_commands")){
	global.console_commands = {
	}
}

struct_set(global.console_commands,_name,_function)

}

function array_filter_name(_array,_text){
	function passed_the_test(element, index)
	{
		return ( string_pos(_text,element) != 0 );
	}
	var _newarray = array_filter(_array,method({_text: _text},passed_the_test));
	
	return(_newarray);
}


function console_helloworld(type,array,index=0){
	switch(type){
		case CONSOLE.CORRECTION:
			switch(index){
				case 0:
				return(["Hello","World"])
				break;
			}
		break;
		case CONSOLE.EXECUTE:
			var str = array[0];
			show_debug_message(str);
			return("hello world executed");
		break;
	}
}

console_cmd_add("hello",console_helloworld)

function console_response (text) {
	with(o_program){
		debugconsole_text = text;
		debugconsole_time = room_speed;	
	}
}