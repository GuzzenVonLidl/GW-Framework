/*
	Author: GuzzenVonLidl
	Starts the alarm and keeps it running until it is turned off with (GW_Effects_Fnc_stopAlarm)

	Usage:
	[0, 200] call GW_Effects_Fnc_startAlarm;

	Arguments:
	0: Alarm Type <NUMBER>
	1: Distance <NUMBER>

	Return Value: NO

	Public: No

	0 - Alarm 1
	1 - Alarm 1 - Longer Delay
	2 - Alarm 2
	3 - Alarm 2 - Longer Delay
	4 - Alarm 3
	5 - Alarm 3 - High Pitch
	6 - Alarm 4
	7 - Alarm 4 - Longer Delay

	Example:
		[loudspeaker_1] call GW_Effects_fnc_addAlarmPoint;	// Speaker location 1
		[loudspeaker_2] call GW_Effects_fnc_addAlarmPoint;	// Speaker location 2
		[loudspeaker_3] call GW_Effects_fnc_addAlarmPoint;	// Speaker location 3

		[2, 200] spawn GW_Effects_Fnc_startAlarm;	// Start alarm

		sleep 60;

		[false] call GW_Effects_Fnc_stopAlarm;	// Stop alarm after 60 seconds
*/
#include "script_Component.hpp"

params ["_alarmType","_distance"];
if !(canSuspend) exitWith {
	_this spawn FUNC(startAlarm);
};

GVAR(Alarm) = true;
([_alarmType] call FUNC(getAlarm)) params ["_soundFile","_soundVolume","_soundPitch","_soundLength"];

while {GVAR(Alarm)} do {
	{
		playSound3D [_soundFile, _x, false, ([_x] call EFUNC(Common,getPosASL)), _soundVolume, _soundPitch, _distance];
	} forEach GVAR(AlarmLocations);

	sleep _soundLength;
};
