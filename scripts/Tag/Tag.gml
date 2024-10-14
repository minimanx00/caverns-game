function Tag(_items = []) constructor {
	items = _items;
	
	static additem = function(_item) {
		array_push(items,_item)
	}
	
	static contains = function(_item) {
		return(array_contains(items,_item));	
	}
}