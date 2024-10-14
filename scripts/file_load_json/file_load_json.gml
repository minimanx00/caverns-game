function file_load_json(_filename,_default=-1){
	if(!file_exists(_filename)){return(_default)}
	var str = file_load_string(_filename);
	var parsed = json_parse(str)
	return(parsed)
}