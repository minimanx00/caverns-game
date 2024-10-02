/// @description Insert description here
// You can write your code in this editor

var xs = image_xscale + lerp(0,wave(0,0.1,1,0),on_lerp); var ys = image_yscale +  lerp(0,wave(0.1,0,1,0),on_lerp);
if(on){
draw_sprite_ext(s_furnace_fire,0,x,y,xs+wave(0,0.2,1,0.6834),ys+wave(0,0.2,1,0.5820),image_angle,merge_color(image_blend,c_yellow,wave(0,1,1,0.257)),1);	
draw_sprite_ext(s_furnace_on,0,x,y,xs,ys,image_angle,image_blend,image_alpha);	
}else{
draw_sprite_ext(s_furnace_off,0,x,y,xs,ys,image_angle,image_blend,image_alpha);	
}

inventory.draw(x,y-128*3);