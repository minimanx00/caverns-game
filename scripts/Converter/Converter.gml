function Converter(_recipes=[]) constructor {
	recipes = _recipes;
	checks = [];
	
	// makes an array of the recipes and if they could be converted
	static convertcheck = function (_inventory){
		checks = [];	
		var l = array_length(recipes);
		for(var i = 0; i<l; i++){
			checks[i] = _inventory.containsrecipe(recipes[i])
		}
	}
	
	static convert = function (_recipe,_inventoryfrom,_inventoryto = _inventoryfrom) {
		convertcheck(_inventoryfrom)
		
		// get recipe
		if(is_string(_recipe)){
			var l = array_length(recipes);
			for(var i = 0; i<l; i++){
				if(recipes[i].result==_recipe){_recipe = i; break;} // if recipe is a string, that means its the result item
			}
		}
		
		// check if you can make recipe
		if(!checks[_recipe]){return(false)}
		
		// delete recipe resources
		var getrecipe = recipes[_recipe];
		getrecipe.takerecipe(_inventoryfrom)
		
		// gain recipe results
		getrecipe.giveresult(_inventoryto)
		
		// on converting function
		onconvert()
		
		return(true)
	}
	
	static onconvert = function () {
		
	}
}