/*
	Author: GuzzenVonLidl
	Gives the unit the radios from his role in Gear handlern

	Usage:
	[this, 500, 1] spawn GW_Radios_fnc_Jammer;

	Arguments:
	0: Object <OBJECT>
	1: Jammer Distance <NUMBER>
	2: Jamming Interference <NUMBER>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params ["_object","_distance","_interference"];

_object setVariable [QGVAR(Distance), _distance];
_object setVariable [QGVAR(_interference), _interference];

//_getDistance = _object getVariable [QGVAR(Distance), 1];
//_getStrength = _object getVariable [QGVAR(_strength), 1];

while {alive _object} do {

	{
		_currentDistance = (_x distance _object);
		_lerpDistance = (_currentDistance/_distance);
		_radioLoss = [0, 1, _lerpDistance, 1] call BIS_fnc_lerp;
		_radioLossReceiving = [0, (_x getVariable QGVAR(receiving)), _lerpDistance, 1] call BIS_fnc_lerp;
		_radioLossSending = [0, (_x getVariable QGVAR(sending)), _lerpDistance, 1] call BIS_fnc_lerp;

		[QGVAR(setRadioLoss), [_x, _radioLossReceiving, _radioLossSending], _x] call CBA_fnc_targetEvent;
	} forEach (allPlayers inAreaArray [(getPos _object), _distance, _distance, 0, false, _distance]);

	sleep 5;
};
