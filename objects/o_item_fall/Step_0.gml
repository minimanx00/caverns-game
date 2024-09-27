/// @description Insert description here
// You can write your code in this editor
time_spend++;
if(time_spend>20){
	speed = lerp(speed,0,0.1);
	gravity = lerp(gravity,0,0.1);	
	friction = lerp(friction,0,0.1);	
	move_towards_point(o_player.x,o_player.midy,lerp(0,point_distance(x,y,o_player.x,o_player.midy),0.1))
	if(place_meeting(x,y,o_player)){
		scr_item_add(item,amount)
		instance_destroy();	
	}
}