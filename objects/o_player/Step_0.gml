/// @description Insert description here
// You can write your code in this editor
invx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5;
invy = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])*0.5;
inv1x = invx - inventory.width - 4;
inv2x = invx + 4;

scr_camera_moveto(x,y);

midy = bbox_top + (bbox_bottom - bbox_top)*0.5;

var hsp = input_check("right")-input_check("left");

axe_lerp = lerp(axe_lerp,y-48 + bob_wave,0.2);
bob_lerp = lerp(bob_lerp,hsp!=0,0.1);
bob_wave = wave(0,-10,0.5,0)*bob_lerp;

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
converter2 = -1;
interact_object = noone;
interact_text = "";

if(place_meeting(x+hspd,y,o_smith)){
	interact_object = o_smith.id;
	if(o_smith.state==SMITHSTATE.ready){
	converter2 = o_smith.converter;
	inventory2 = o_smith.inventory;	
	}else
	if(o_smith.state==SMITHSTATE.done){
	inventory2 = o_smith.inventory;	
	}
	if(!showinventory){interact_text = "Make Pickaxe"}
}else

if(place_meeting(x+hspd,y,o_furnace)){
	inventory2 = o_furnace.inventory;
	if(!showinventory){interact_text = "Forge Metals"}
}else

if(place_meeting(x+hspd,y,o_pickpile)){
	var tag = global.tags[$ "pickaxes"];
	if(!inventory.containstag(tag) and (equipped ==-1 or !tag.contains(equipped.name))){
		if(input_check_pressed("accept")){inventory.additem(new Resource("stone_pickaxe",1))}
		if(!showinventory){interact_text = "Get Pickaxe"}
	}
}



if(hspd!=0){
	image_xscale = sign(hspd);
}


mine_wait = approach(mine_wait,0,1);
mine_angle = lerp(mine_angle,mine_angle_max,0.2);
if(is_struct(equipped) and mine_wait<=0 and input_check("mine") and !showinventory){
	mine_angle = -mine_angle_max;
	mine_wait = 20;
	var pm = instance_place(x+image_xscale*128,y,o_rock)
	if(instance_exists(pm) and pm!=noone){
		equipped.durability --;
		with(pm){
			shake = 10;	
			var drop = scr_choose(drops);
			var count = 1;
			instance_create_layer(x+image_xscale*54,y-270,"Front",o_item_fall,{item:drop,amount:count,direction:point_direction(x,40,o_player.x,0)})
		}
		if(equipped.durability<=0){equipped = -1;}
	}
}

inventory.selected_slot = inventory.checkslot(mouse_x,mouse_y,inv1x,invy);
if(is_struct(inventory2)){
	inventory2.selected_slot = inventory2.checkslot(mouse_x,mouse_y,inv2x,invy);
}
if(is_struct(converter2)){
	converter2.selected_slot = converter2.checkslot(mouse_x,mouse_y,inv2x,invy);
	if(input_check_pressed("mine")){
		if(converter2.selected_slot!=-1){
			converter2.convert(converter2.selected_slot,inventory,interact_object.inventory)
		}
	}
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
	}else
	{
		if(inventory.selected_slot!=-1){
			var elm = inventory.inventory[inventory.selected_slot];
			if(global.items[$ elm.name ].type == "pickaxe"){
				var elm2 = equipped;
				array_delete(inventory.inventory,inventory.selected_slot,1);
				if(elm2!=-1){inventory.additem(elm2)}
				equipped = elm;
			}
		}
	}
}
	
}