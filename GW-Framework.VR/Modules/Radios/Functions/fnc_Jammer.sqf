/*
	Author: GuzzenVonLidl

	Usage:
	[this, 500, 1] spawn GW_Radios_fnc_Jammer;

	Arguments:
	0: Object <OBJECT>
	1: Jammer Max Distance <NUMBER>
	2: Jamming Interference Full Effect <NUMBER>

	Return Value: NO

	Public: NO
*/
#include "script_Component.hpp"

params ["_object","_distance","_interference"];

if !(hasInterface) exitWith {false};
if !(canSuspend) exitWith {
	_this spawn FUNC(Jammer);
};

//private _radius = (_distance / 2);
private _unit = player;

while {alive _object} do {
	if (_unit inArea [(getPos _object), _distance, _distance, 0, false, _distance]) then {
		_currentDistance = (_unit distance _object);
		_lerpDistance = (_currentDistance/_distance);
		_radioLossReceiving = [0, (_unit getVariable QGVAR(receiving)), _lerpDistance, 1] call BIS_fnc_lerp;
		_radioLossSending = [0, (_unit getVariable QGVAR(sending)), _lerpDistance, 1] call BIS_fnc_lerp;
		if (_currentDistance < _interference) then {
			[QGVAR(setRadioLoss), [_unit, 0, 0]] call CBA_fnc_localEvent;
		} else {
			if (_currentDistance > _distance) then {	// Reset if teleported
				[QGVAR(setRadioLoss), [_unit, (_unit getVariable QGVAR(receiving)), (_unit getVariable QGVAR(sending))]] call CBA_fnc_localEvent;
			} else {
				[QGVAR(setRadioLoss), [_unit, _radioLossReceiving, _radioLossSending]] call CBA_fnc_localEvent;
			};
		};
	};
	sleep 1;
};

// Reset on destroyed
[QGVAR(setRadioLoss), [_unit, (_unit getVariable QGVAR(receiving)), (_unit getVariable QGVAR(sending))]] call CBA_fnc_localEvent;
