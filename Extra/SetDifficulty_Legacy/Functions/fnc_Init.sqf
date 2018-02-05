#include "script_Component.hpp"

params [
	["_unit", objNull, [objNull]]
];

if (isPlayer _unit) then {
	_unit setUnitTrait ["camouflageCoef", [GVAR(playerDetection), 0.1] call BIS_fnc_roundNum];
} else {
	if (isServer && !(GVAR(difficulty) isEqualTo 0)) then {
		_unit setskill 1;
		{
			_unit setskill [_x ,(call FUNC(get) select 0)];
		} forEach ["aimingAccuracy","aimingShake","aimingSpeed"];

		{
			_unit setskill [_x ,(call FUNC(get) select 1)];
		} forEach ["general","commanding","endurance","courage","reloadSpeed"];

		{
			_unit setskill [_x ,(call FUNC(get) select 2)];
		} forEach ["spotTime","spotDistance"];

		TRACE_3("Init", _unit, (_unit skill "aimingAccuracy"), (_unit skill "general"));
	};
};
