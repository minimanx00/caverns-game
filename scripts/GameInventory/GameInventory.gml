function GameInventory(_maxcount = 10) : Inventory(_maxcount)  constructor {
	scale = 0.5;
	spritewidth = sprite_get_width(s_tile)*scale;
	selected_slot = -1;
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
			mx>=xx+xi*sw - sw*0.5 and mx<= xx+xi*sw + sw*0.5 and
			my>=yy+yi*sw - sw*0.5 and my<= yy+yi*sw + sw*0.5 
			){return(i)}
		}
		return(-1)
	}
}