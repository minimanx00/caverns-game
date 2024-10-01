function Resource(_itemname,_count) constructor {
	name = _itemname;
	count = _count;
	
	stack = global.items[$ name].stack;
	
	static draw = function(xx,yy){
		var gitem = global.items[$ name];
		draw_sprite(gitem.sprite,0,xx,yy)
		draw_text(xx,yy,string(count))
	}
}