/*
	Author: GuzzenVonLidl
	Applies the correct team color for the unit
	Value is grabbed from the unit name

	Usage:
	[player] call GW_Common_Fnc_setGroupColor;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: YES
*/
#include "script_Component.hpp"
#define	TrimString [format ["%1", _unit], 3] call BIS_fnc_trimString
#define	TrimString1st [format ["%1", _unit], 1] call BIS_fnc_trimString

private ["_color"];
params ["_unit"];

switch (True) do {
	case ((TrimString) in ["1"]): {
		_color = "Green";
	};
	case ((TrimString) in ["2","3"]): {
		_color = "Red";
	};
	case ((TrimString) in ["4","5"]): {
		_color = "Blue";
	};
	case ((TrimString1st) in ["fac","echo2","echo3","echo4","echo5","echo6"]): {
		_color = "Blue";
	};
	default {
		if ((TrimString1st) in ["pl","sl","echo1"]) then {
			_color = "Green";
		} else {
			_color = "White";
		};
	};
};

if !((_unit getVariable [QGVAR(GroupColor), "White"]) isEqualTo _color) then {
	_unit setVariable [QGVAR(GroupColor), _color];
	_unit assignTeam _color;
};
