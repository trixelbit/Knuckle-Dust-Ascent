/// @description scr_decelerate
/// @param Value
/// @param Lerp_Rate
var VALUE = argument0;
var LERP_RATE = argument1;

if (hspeed != 0 and abs(hspeed) > .5)
{
	hspeed = lerp(hspeed, 0, LERP_RATE);
}
// resets lerp
else if (abs(hspeed) < .5)
{
	hspeed = 0;
}
if(!place_free(x + hspeed * 2, y))
{
	hspeed = 0;
}