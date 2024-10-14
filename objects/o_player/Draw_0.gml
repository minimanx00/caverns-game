/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(s_pickaxe,0,x,y-48,1,image_xscale,90 +mine_angle*image_xscale,c_white,1);
draw_self()


if(showinventory){
	inventory.draw(inv1x,invy);
	if(is_struct(inventory2)){
	inventory2.draw(inv2x,invy)	
	}
}