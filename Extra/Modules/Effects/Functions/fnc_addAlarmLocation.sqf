/*
	Author: GuzzenVonLidl
	Stores location of speaker to be used later on

	Usage:
	[this] call GW_Effects_Fnc_addAlarmLocation;

	Arguments:
	0: Object <OBJECT>

	Return Value: BOOL

	Public: No

*/
#include "script_Component.hpp"

params ["_location"];

GVAR(AlarmLocations) pushBack _location;

true
