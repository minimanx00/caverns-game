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
	
	static deleteitem = function(_resourcename,_amount=1){
		var l = array_length(inventory);
		for(var i = l-1; i>-1; i--){
			if(inventory[i].name==_resourcename){
				inventory[i].count -= min(inventory[i].count,_amount);
				if(inventory[i].count<=0){inventory[i] = -1;}
			}
			//show_debug_message("DELETED "+_resourcename+" "+string(_amount))
			if(_amount<=0){break;}
		}
		
		// replace inventory with cleaned version
		var na = [];
		for(var i = 0; i<l; i++){
			if(inventory[i]!=-1){array_push(na,inventory[i])}
		}
		inventory = na;
	}
	
	static containstag = function(_tag) {
		var l = array_length(inventory);
		for(var i = 0; i<l; i++){
			var ret = _tag.contains(inventory[i].name)
			if(ret){return(true)}
		}	
		return(false)
	}
	
	static gettagindex = function(_tag){
		var _f = function(_element, _index)
		{
		    return (_tag.contains(_element.name));
		}
		var _f = method({_tag},_f)
		var ind = array_find_index(inventory,_f);
		return(ind)
	}
	
	static containsrecipe = function(_recipe) {
		var list = _recipe.recipe; var n = struct_get_names(list); var l = array_length(n);
		for(var i = 0; i<l; i++){
			var name = n[i];
			var count = struct_get(list,n[i]);
			
			if(!containsitem(name,count)){return(false)}
		}
		return(true)
	}
	
	static containsitem = function(_itemname,_amount=1){
		var l = array_length(inventory);
		for(var i = 0; i<l; i++){
			var elm = inventory[i];
			
			if(elm.name==_itemname and elm.count>=_amount){return(true)}
		}
		return(false)
	}
	
	static deleteindex = function(_index){
		array_delete(inventory,_index,1)	
	}
	
	static draw = function(xx,yy) {
			
	}
}