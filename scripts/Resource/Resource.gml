function Resource(_itemname,_count) constructor {
	name = _itemname;
	count = _count;
	
	stack = global.items[$ name].stack;
	
	static draw = function(xx,yy,scale=1){
		var gitem = global.items[$ name];
		draw_sprite_ext(gitem.sprite,0,xx,yy,scale,scale,0,c_white,1)
		draw_text(xx,yy,string(count))
	}
}