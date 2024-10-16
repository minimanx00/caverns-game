/// @description Insert description here
// You can write your code in this editor
on_lerp  = on;

var mytag = global.tags[$ "ores"];

inventory = new GameInventory();
inventory.input_tag = mytag;

items = [ global.recipes[$ "copper_pickaxe" ] , global.recipes[$ "cobalt_pickaxe" ] ]
converter = new GameConverter(items)

enum SMITHSTATE {
 ready,
 working,
 done
}
state = SMITHSTATE.ready;
working_time = 0;

converter.onconvert = function () {
	o_smith.working_time = room_speed*10;
}