function file_save_json(_filename,_json,_prettify=false){
	var str = json_stringify(_json,_prettify)
	file_save_string(_filename,str);
}