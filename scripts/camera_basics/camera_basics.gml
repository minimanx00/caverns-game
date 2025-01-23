function camera_basics_create(){
	camera_xto = 0;
	camera_yto = 0;
	camera_x = 0;
	camera_y = 0;
	
	global.game_view_scale = false;
	global.game_gui_scale = 1;
	global.game_width = 1280;
	global.game_height = 720;
	camera_basics_setup(global.game_width,global.game_height,global.game_view_scale,global.game_gui_scale)
	
	
}

function camera_basics_step(){
	var cw =camera_get_view_width(view_camera[0]);
	var ch =camera_get_view_height(view_camera[0]);
	camera_x = lerp(camera_x,camera_xto,0.25);
	camera_y = lerp(camera_y,camera_yto,0.25);
	var clx = clamp(camera_x-cw*0.5,0,room_width-cw);
	//var cly = clamp(camera_y-ch*0.5,ch*0.5,room_height-ch*0.5);
	camera_set_view_pos(view_camera[0],clx,0);
}

function camera_basics_afterframe(){
	window_center()
}


function camera_basics_setup(vw = 0, vh = 0,scale = false,guiscale = 2){
var cam = view_camera[0]

var dpw = display_get_width();
var dph = display_get_height();

/*
if(os_browser!=browser_not_a_browser){
	dpw = browser_width;
	dph = browser_height;
	scale = false;
}*/

aspect_ratio = dpw/dph;



view_width = vw;
view_height = vh;

if(vw==0){
view_width=round(view_height*aspect_ratio);
}
 

if(view_width & 1) view_width++;

if(view_height & 1) view_height++;



max_window_scale = min(floor(dpw/view_width),floor(dph/view_height));

if(view_height * max_window_scale == dph)

    max_window_scale--;

    

window_scale = max_window_scale;
if(os_browser!=browser_not_a_browser){window_scale = 1 }else{


	window_set_size(view_width*window_scale,view_height*window_scale);
	display_set_gui_size(view_width,view_height);

	alarm[0]=1;
	if(scale){
	surface_resize(application_surface,view_width*window_scale,view_height*window_scale);		
	}else{
	surface_resize(application_surface,view_width,view_height);
	}

}


}

function camera_basics_fullscreen() {
	window_set_fullscreen(!window_get_fullscreen());
	
	alarm[0]=2;
}