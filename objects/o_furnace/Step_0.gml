/// @description Insert description here
// You can write your code in this editor
on_lerp = lerp(on_lerp,on,0.2);
var tag = global.tags[$ "ores"];
on = inventory.containstag(tag)
if(!on){
time_till_smelt = time_till_smelt_full;
}else{
time_till_smelt--;
if(time_till_smelt<=0){
	var g = inventory.gettagindex(tag);
	var resource = inventory.inventory[g];
	var recipeindex = -1;
	var r = converter.recipes; var l = array_length(r);
	for( var i = 0; i<l; i++){
		if(r[i].hasitem(resource.name)){recipeindex=i; break;}
	}
	if(recipeindex!=-1){
		converter.convert(recipeindex,inventory)
	}
	
	time_till_smelt = time_till_smelt_full;
}
}
