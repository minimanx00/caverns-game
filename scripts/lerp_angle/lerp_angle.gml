function lerp_angle(_a,_b,_amount){
	return (_a - (angle_difference(_a,_b) * _amount));
}