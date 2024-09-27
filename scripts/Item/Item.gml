function Item(_data = {}) constructor {
	original_data = _data;
	name = "item";
	sprite = s_item_cobalt_ingot;
	stack = 10;
	type = "resource";
	
	smeltable = false;
	smelttime = 10;
	smeltresult = "";
	
	if(struct_exists(_data,"item_name")){
		name = _data[$ "item_name"];	
	}
	
	if(struct_exists(_data,"item_sprite")){
		sprite = asset_get_index(_data[$ "item_sprite"]);	
	}
	
	if(struct_exists(_data,"item_stacksize")){
		stack = real( _data[$ "item_stacksize"])	
	}
	
	if(struct_exists(_data,"item_type")){
		type =  _data[$ "item_type"];
	}
	
	if(struct_exists(_data,"item_type")){
		type =  _data[$ "item_type"];
	}
	
	if(type == "resource" and struct_exists(_data,"item_smelt") and _data[$ "item_smelt"]!=""){
		smeltable = true;
		smeltresult	= _data[$ "item_smelt"];
		smelttime 	= _data[$ "item_smelttime"];
	}
	
}