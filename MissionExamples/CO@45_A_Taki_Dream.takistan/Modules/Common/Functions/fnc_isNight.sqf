/*
	Author: Unknown
	Calculates if its day or night

	Usage:
	[] call GW_Common_Fnc_isNight;

	Arguments: NO

	Return Value: BOOL

	Public: NO
*/
#include "..\scriptComponent.hpp"

private ["_lat","_day","_hour","_sunangle","_night"];

_night = false;
_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
_day = 360 * (dateToNumber date);
_hour = (daytime / 24) * 360;
_sunangle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));

If (_sunangle < 0) then {_night = true;};

_night
