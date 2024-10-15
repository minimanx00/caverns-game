function GameConverter(_recipes=[]) : Converter(_recipes) constructor {
	scale = 0.5;
	spritewidth = sprite_get_width(s_tile)*scale;
	selected_slot = -1;
	//width = rowcount*spritewidth;
	static draw = function(xx,yy){
		var l = array_length(recipes);
		for(var i = 0; i<l; i++){
			var elm = recipes[i];
			var res = global.items[$ elm.result];
			var spr = res.sprite;
			
			var xi = xx;
			var yi = yy+i*(spritewidth+2);
			draw_sprite_ext(s_tile,i==selected_slot,xi,yi,scale,scale,0,c_white,1);
			draw_sprite_ext(spr,0,xi,yi,scale,scale,0,c_white,1);
			
			var struc = elm.recipe;
			var arr = struct_get_names(struc);
			var jl = array_length(arr);
			for(var j = 0; j<jl; j++){
				var ss = 0.8;
				var sc = scale*ss; var sw = spritewidth*ss;
				var xj = xi + spritewidth*1.5 + (j - jl*0.5)*sw;
				var yj = yi //+ //(j - jl*0.5)*(spritewidth*sc)
				var sprj = global.items[$ arr[j] ].sprite;
				draw_sprite_ext(s_tile,0,xj,yj,sc,sc,0,c_white,1);
				draw_sprite_ext(sprj,0,xj,yj,sc,sc,0,c_white,1);
				var c = struc[$ arr[j]];
				if(c>1){draw_set_halign(fa_right);draw_set_valign(fa_bottom)  draw_text(xj+sw*0.5,yj+sw*0.5,string(c))}
			}
		}
	}
	static checkslot = function(mx,my,xx,yy) {
		var l = array_length(recipes);
		var sw = spritewidth;
		for(var i = 0; i<l; i++){
			var xi = xx;
			var yi = yy+i*(spritewidth+2);
			if( 
			mx>=xi - sw*0.5 and mx<= xi + sw*0.5 and
			my>=yi - sw*0.5 and my<= yi + sw*0.5 
			){return(i)}		
		}
		return(-1)
	}

	static onconvert = function () {
		
	}
}