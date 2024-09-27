function scr_item_add(_name,_amount,_inventory=o_player){
	with(_inventory){
		if(!struct_exists(items,_name)){
			struct_set(items,_name,_amount);	
		}else{
			items[$ _name] = clamp(items[$ _name] + _amount,0,global.items[$ _name].stack)	
		}
	}
}

