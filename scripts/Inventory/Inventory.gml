function Inventory(_maxcount = 10) constructor{
	inventory = [];
	maxcount = _maxcount;
	rowcount = 5;
	
	static additem = function(_resource){
		
		var l = array_length(inventory);
		for(var i = 0; i<l; i++){
			if(inventory[i].name==_resource.name and inventory[i].count<inventory[i].stack){
				var c = inventory[i].stack - inventory[i].count;
				var o = _resource.count - c;
				
				if(o<=0){
					inventory[i].count +=  _resource.count;
					return(true)
				}else{
					inventory[i].count +=  c;	
					_resource.count -= c;
					array_push(inventory,_resource)
					return(true)
				}
			}
		}
		array_push(inventory,_resource)
	}
	
	static draw = function(xx,yy) {
		var l = array_length(inventory);
		var z = 0.5;
		var sw = sprite_get_width(s_tile)*z;
		for(var i = 0; i<maxcount; i++){
			var xi = i mod rowcount;
			var yi = i div rowcount;
			draw_sprite_ext(s_tile,0,xx+xi*sw,yy+yi*sw,z,z,0,c_white,1);
			if(i<l){
				inventory[i].draw(xx+xi*sw,yy+yi*sw,z);
			}
		}
	}
}