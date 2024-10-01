randomize()

// console

console_setup();
console_on = false;
consoleonexecution = function(){console_on = false;}
debugconsole_text = "";
debugconsole_time = room_speed;


// camera

camera_basics_create();

getitems = function(){
global.items = {};
global.items_csv = load_csv("items.csv");
	
	var hh = ds_grid_height(global.items_csv);
	var ww = ds_grid_width(global.items_csv);

	
	for ( var i = 1; i < hh; i++){
		var _data = {};
		for(var j = 0; j<ww; j++){
			_data[$ global.items_csv[# j, 0]] = global.items_csv[# j, i]
		}
		struct_set(global.items,global.items_csv[# 0, i], new Item(_data));
		
	}
	
	show_debug_message(global.items)
	
	
}
getitems();
if(DEBUG){
	global.googleSheet.getManager();
	global.googleSheet.downloadFile(GOOGLESHEETDOWNLOADURL,"items.csv",
	function(result){
		show_debug_message("ITEMS MADE FROM EXCEL")
		ds_grid_destroy(global.items_csv);
		getitems()
		global.googleSheet = undefined;
		},function(err){show_debug_message("ERROR: couldn't load localisation file")show_debug_message(err)})	
}


room_goto_next()

