/// @description Insert description here
// You can write your code in this editor




spd = 6;
acc = 0.5;

hspd = 0;


mine_angle_max = 45;
mine_wait = 0;
mine_angle = mine_angle_max;
mine_anim = 0;

items = {}

midy = y;

inventory = new GameInventory();
//inventory.additem("stone_pickaxe");

bob_lerp = 0;
bob_wave = 0;
axe_lerp = y;

showinventory = false;
inventory2 = -1;
invx = 0; invy = 0;
inv1x = 0; inv2x = 0;

converter2 = -1;
interact_text = "";

interact_object = noone;


equipped = new Resource("stone_pickaxe",1)