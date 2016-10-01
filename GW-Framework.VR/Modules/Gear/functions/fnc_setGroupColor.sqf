/*
	Author: GuzzenVonLidl
	Applies the correct team color for the unit
	Value is grabbed from the unit name

	Usage:
	[] call GW_Gear_Fnc_setGroupColor;

	Arguments: NO

	Return Value: NO

	Public: YES

*/
#include "..\scriptComponent.hpp"
#define	TrimString [format ["%1", player], 3] call BIS_fnc_trimString
#define	TrimString1st [format ["%1", player], 1] call BIS_fnc_trimString

private ["_color"];

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

if ((player getVariable [QGVAR(GroupColor), "White"]) != _color) then {
	player setVariable [QGVAR(GroupColor), _color];
};
