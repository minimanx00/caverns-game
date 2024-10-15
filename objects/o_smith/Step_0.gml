/// @description Insert description here
// You can write your code in this editor
if(working_time>0){
state = SMITHSTATE.working;	
}else
if(array_length(inventory.inventory)>0){
state = SMITHSTATE.done;	
}else{
state = SMITHSTATE.ready;	
}

switch(state){
case SMITHSTATE.working:
	sprite_index = s_smith_forge;
break;
default:
	sprite_index = s_smith;
break;
}

working_time = max(working_time-1,0);