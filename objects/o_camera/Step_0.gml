/// @description Insert description here
// You can write your code in this editor

var cvw = camera_get_view_x(view_camera[0]);


layer_x(layer5, lerp(0,cvw,1))

layer_x(layer4, lerp(0,cvw,0.5))
layer_x(layer3, lerp(0,cvw,0.7))
layer_x(layer2, lerp(0,cvw,0.8))

layer_x(layer1, lerp(0,cvw,1))