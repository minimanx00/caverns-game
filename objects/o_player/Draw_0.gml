/// @description Insert description here
// You can write your code in this editor

if(is_struct(equipped)){
	draw_sprite_ext(global.items[$ equipped.name].toolsprite,0,x,axe_lerp,1,image_xscale,90 +mine_angle*image_xscale,c_white,1);
}
draw_sprite_ext(sprite_index,image_index,x,y+bob_wave,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if(interact_text!=""){draw_set_halign(fa_left); draw_set_valign(fa_bottom); draw_text(inv1x,invy-70,"[E] "+interact_text)}
if(showinventory){
	inventory.draw(inv1x,invy);
	if(is_struct(converter2)){
	converter2.draw(inv2x,invy)		
	}else
	if(is_struct(inventory2)){
	inventory2.draw(inv2x,invy)	
	}
}