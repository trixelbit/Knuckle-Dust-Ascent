/// @description wrap(value, min, max)
/// @param value The value to wrap into the bounds
/// @param min Minimum bound, inclusive
/// @param max Maximum bound, inclusive

var VALUE = argument0;
var MIN = argument1;
var MAX = argument2;

VALUE = (VALUE - MIN) mod (MAX - MIN) + MIN;

return VALUE;