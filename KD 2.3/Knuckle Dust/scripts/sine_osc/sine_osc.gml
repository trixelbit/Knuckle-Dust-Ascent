/// @description sine_osc(Amplitude, Period, Y-offset) Sine Value Oscillation 
/// @param Amplitude
/// @param Period-Multiplier ( 2 * pi ) / Period 
/// @param Y-Offset
function sine_osc(argument0, argument1, argument2) {

	var AMPLITUDE = argument0;
	var P_MULT = argument1;
	var Y_OFFSET = argument2;

	return AMPLITUDE * sin(current_time mod(2 * pi * P_MULT) / P_MULT) + Y_OFFSET;


}
