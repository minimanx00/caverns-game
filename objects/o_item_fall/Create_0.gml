
if(item!=""){
	var _item = global.items[$ item];
	sprite_index = _item.sprite;
	
}

image_xscale = random_range(0.5,1); image_yscale = image_xscale;
speed = random_range(15,25);
friction=0.5;
gravity=1;
image_angle=irandom(360);

time_spend = 0;