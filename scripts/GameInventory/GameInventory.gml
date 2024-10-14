function GameInventory(_maxcount = 10) : Inventory(_maxcount)  constructor {
	scale = 0.5;
	spritewidth = sprite_get_width(s_tile)*scale;
	selected_slot = -1;
	width = rowcount*spritewidth;
	
	input_tag = -1;
	output_tag = -1;
	static draw = function(xx,yy) {
		var l = array_length(inventory);
		var z = scale;
		var sw = spritewidth;
		for(var i = 0; i<maxcount; i++){
			var xi = i mod rowcount;
			var yi = i div rowcount;
			draw_sprite_ext(s_tile,i==selected_slot,xx+xi*sw,yy+yi*sw,z,z,0,c_white,1);
			if(i<l){
				inventory[i].draw(xx+xi*sw,yy+yi*sw,z);
			}
		}
	}
	
	// gets information from slot index
	static getslot = function(slot){
		if(slot>=maxcount or slot<0){return(-1)}
		
		return(inventory[slot])
	}
	
	static checkslot = function(mx,my,xx,yy){
		var l = array_length(inventory);
		var z = scale;
		var sw = spritewidth;		
		for(var i = 0; i<maxcount; i++){
			var xi = i mod rowcount;
			var yi = i div rowcount;
			if( 
			i<l and
			mx>=xx+xi*sw - sw*0.5 and mx<= xx+xi*sw + sw*0.5 and
			my>=yy+yi*sw - sw*0.5 and my<= yy+yi*sw + sw*0.5 
			){return(i)}
		}
		return(-1)
	}
}


// tags
show_debug_message("LOADING TAGS...")
var g = file_load_json("tags.json"); var n = struct_get_names(g); var l = array_length(n);
global.tags = {};
for(var i = 0; i<l; i++){
	var elm = g[$ n[i]];
	if(is_array(elm)){
		global.tags[$ n[i]] = new Tag( elm );
	}
}
for(var i = 0; i<l; i++){
	var _name = n[i];
	var elm = g[$ n[i]];
	if(is_string(elm)){
		var split = string_split(elm,"+"); var l = array_length(split);
		var arr = [];
		for(var j = 0; j<l; j++){
			arr = array_concat(arr,g[$ split[j] ]);
		}
		global.tags[$ _name] = new Tag( arr );
	}
}


var n = struct_get_names(global.tags); var l = array_length(n);

for(var i = 0; i<l; i++){
	show_debug_message(global.tags[$ n[i]])
}

// recipes
show_debug_message("LOADING RECIPES...")
var g = file_load_json("recipes.json"); var n = struct_get_names(g); var l = array_length(n);
global.recipes = {};
for(var i = 0; i<l; i++){
	global.recipes[$ n[i]] = new Recipe(n[i],g[$ n[i]]);
}