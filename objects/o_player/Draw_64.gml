var n = struct_get_names(items)
var l = array_length(n)
var j = 0;
var width = 128;
for(var i = 0; i<l; i++){
	var gitem = global.items[$ n[i]];
	var amount = items[$ n[i]];
	if(gitem.sprite!=-1){
		draw_sprite(gitem.sprite,0,width*.5,width*.5+j*width)
		draw_text(width,width*.5+j*width,string(amount))
		j++;
	}
}