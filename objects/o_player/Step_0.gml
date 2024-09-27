/// @description Insert description here
// You can write your code in this editor
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

if(place_meeting(x+hspd,y,o_furnace)){
	if(input_check_pressed("accept")){
		o_furnace.on = !o_furnace.on;
	}
}


if(hspd!=0){
	image_xscale = sign(hspd);
}


mine_wait = approach(mine_wait,0,1);
mine_angle = lerp(mine_angle,mine_angle_max,0.2);
if(mine_wait<=0 and input_check("mine")){
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