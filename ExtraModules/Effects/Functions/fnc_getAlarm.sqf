/*
	Author: GuzzenVonLidl
	gets alarm settings depending on players preference and returns the values in a array

	Usage:
	[0] call GW_Effects_Fnc_getAlarm;

	Arguments:
	0: Alarm Type <NUMBER>

	Return Value: ARRAY

	Public: No

	0 - Alarm 1
	1 - Alarm 1 - Longer Delay
	2 - Alarm 2
	3 - Alarm 2 - Longer Delay
	4 - Alarm 3
	5 - Alarm 3 - High Pitch
	6 - Alarm 4
	7 - Alarm 4 - Longer Delay
*/
#include "script_Component.hpp"

params [["_sound", 0, [0]]];

private _soundVolume = 2;

private _soundFile = "A3\Sounds_F\sfx\alarm.wss";	// Alarm 1
private _soundPitch = 1;
private _soundLength = 2;

switch (_sound) do {
	case 1: {	// Alarm 1 - Longer Delay
		_soundFile = "A3\Sounds_F\sfx\alarm.wss";
		_soundPitch = 1;
		_soundLength = 4;
	};
	case 2: {	// Alarm 2
		_soundFile = "A3\Sounds_F\sfx\alarm_3.wss";
		_soundLength = 4;
	};
	case 3: {	// Alarm 2 - Longer Delay
		_soundFile = "A3\Sounds_F\sfx\alarm_3.wss";
		_soundLength = 5;
	};
	case 4: {	// Alarm 3
		_soundFile = "A3\Sounds_F\sfx\alarm_OPFOR.wss";
		_soundLength = 6.5;
	};
	case 5: {	// Alarm 3 - High Pitch
		_soundFile = "A3\Sounds_F\sfx\alarm_OPFOR.wss";
		_soundPitch = 2;
		_soundLength = 4;
	};
	case 6: {	// Alarm 4
		_soundFile = "A3\Sounds_F\sfx\siren.wss";
		_soundPitch = 1;
		_soundLength = 2;
	};
	case 7: {	// Alarm 4 - Longer Delay
		_soundFile = "A3\Sounds_F\sfx\siren.wss";
		_soundPitch = 1;
		_soundLength = 3;
	};
};

[_soundFile,_soundVolume,_soundPitch,_soundLength]
