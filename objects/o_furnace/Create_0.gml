/// @description Insert description here
// You can write your code in this editor
on_lerp  = on;

var mytag = global.tags[$ "ores"];

inventory = new GameInventory();
inventory.input_tag = mytag;

time_till_smelt_full = room_speed*2;
time_till_smelt = time_till_smelt_full;

var refinetag = global.tags[$ "ingots"];
var s = [];
var l = array_length(refinetag.items);
for(var i = 0; i<l; i++){
	if(struct_exists(global.recipes,refinetag.items[i])){
		array_push(s,global.recipes[$ refinetag.items[i] ]);
	}
}
converter = new GameConverter(s)