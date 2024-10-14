/// @description Insert description here
// You can write your code in this editor
invx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5;
invy = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])*0.5;
inv1x = invx - inventory.width - 4;
inv2x = invx + 4;

scr_camera_moveto(x,y);

midy = bbox_top + (bbox_bottom - bbox_top)*0.5;

var hsp = input_check("right")-input_check("left");


if(hsp!=0){
hspd = approach(hspd,hsp*spd,acc);
}else{
hspd = approach(hspd,0,acc*2);	
}

if(place_meeting(x+hspd,y,o_rock)){
	var sig = sign(hspd);
	while(!place_meeting(x+sig,y,o_rock)){
	x += sig;
	}
	hspd = 0;
}


x += hspd;

if(input_check_pressed("accept")){
showinventory = !showinventory
}

inventory2 = -1;

if(place_meeting(x+hspd,y,o_furnace)){
	inventory2 = o_furnace.inventory;
	if(input_check_pressed("accept")){
		//o_furnace.on = !o_furnace.on;
	}
}


if(hspd!=0){
	image_xscale = sign(hspd);
}


mine_wait = approach(mine_wait,0,1);
mine_angle = lerp(mine_angle,mine_angle_max,0.2);
if(mine_wait<=0 and input_check("mine") and !showinventory){
	mine_angle = -mine_angle_max;
	mine_wait = 20;
	var pm = instance_place(x+image_xscale*128,y,o_rock)
	if(instance_exists(pm) and pm!=noone){
		with(pm){
			shake = 10;	
			var drop = scr_choose(drops);
			var count = 1;
			instance_create_layer(x+image_xscale*54,y-270,"Front",o_item_fall,{item:drop,amount:count,direction:point_direction(x,40,o_player.x,0)})
		}
	}
}

inventory.selected_slot = inventory.checkslot(mouse_x,mouse_y,inv1x,invy);
if(is_struct(inventory2)){
	inventory2.selected_slot = inventory2.checkslot(mouse_x,mouse_y,inv2x,invy);
}

if(showinventory){
if(input_check_pressed("mine")){
	// move stuff
	if(is_struct(inventory2)){
		if(inventory.selected_slot!=-1){
			if(inventory2.input_tag==-1 or inventory2.input_tag.contains(inventory.inventory[inventory.selected_slot].name)){ inventory2.additem(inventory.inventory[inventory.selected_slot]); inventory.deleteindex(inventory.selected_slot)}
			}else
		if(inventory2.selected_slot!=-1){
			if(inventory.output_tag==-1 or inventory.output_tag.contains(inventory2.inventory[inventory2.selected_slot].name)){ inventory.additem(inventory2.inventory[inventory2.selected_slot]); inventory2.deleteindex(inventory2.selected_slot)}
			}
	}
}
	
}