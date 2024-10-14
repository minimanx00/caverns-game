function file_load_string(_filename){
	var f = file_text_open_read(_filename)
	var str = "";
	while (!file_text_eof(f)){
		str += file_text_read_string(f);
		file_text_readln(f);
	}
	file_text_close(f)
	return (str)	
}