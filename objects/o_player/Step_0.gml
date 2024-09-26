/// @description Insert description here
// You can write your code in this editor
scr_camera_moveto(x,y);


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
		}
	}
}