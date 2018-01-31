#include "script_Component.hpp"

[{
	params [
		["_unit", objNull, [objNull]]
	];

	if (isPlayer _unit) then {
		_unit setUnitTrait ["camouflageCoef", [GVAR(playerDetection), 0.1] call BIS_fnc_roundNum];
	};
}, _this, 1] call CBA_fnc_waitAndExecute;
