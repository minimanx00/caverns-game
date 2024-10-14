function Recipe(_result,_recipe = {},_resultamount=1) constructor {
	result = _result; amount = _resultamount;
	recipe = _recipe;
	
	static additem = function(_item,_amount=1) {
		struct_set(recipe,_item,_amount)
	}
	
	static takerecipe = function(_inventory){
		var n = struct_get_names(recipe); var l = array_length(n);
		for(var i = 0; i<l; i++){
			_inventory.deleteitem(n[i],recipe[$ n[i]])
		}
	}
	
	static giveresult = function(_inventory){
		_inventory.additem( new Resource(result,amount) );
	}
	
	// checks if the item has this certain recipe item
	static hasitem = function(_itemname){
		var n = struct_get_names(recipe);
		return(array_contains(n,_itemname));
	}
}