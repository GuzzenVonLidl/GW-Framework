/*
	Author: GuzzenVonLidl
	Sets player detection Coef

	Usage:
	[this, 2] call GW_SetDifficulty_fnc_setDetectionCoef;

	Arguments:
	0: Unit <OBJECT>

	Return Value: <BOOL>

	Public: No
*/
#include "script_Component.hpp"

params [
	["_unit", objNull, [objNull]]
];

if !(isPlayer _unit) exitWith {false};

(getArray(missionConfigFile >> "GW_FRAMEWORK" >> "Behaviour" >> (GVAR(names) select GVAR(unitTraining)) >> "playerCamoCoef")) params ["_min","_mid","_max"];
private _value = _mid;

if (GVAR(randomSkill)) then {
	_value = (random [_min, _mid, _max]);
	_value = (parseNumber (_value toFixed 3));
};

_unit setUnitTrait ["camouflageCoef", _value];

true
