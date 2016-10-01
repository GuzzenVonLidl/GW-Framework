#include "..\scriptComponent.hpp"

[{MISSIONLOADED}, {
	params [
		["_unit", objNull, [objNull]]
	];

	if (GVAR(enableSuppression)) then {
		if (isPlayer _unit) then {
			_unit addEventHandler ["Fired",{
				_this call FUNC(handleFired);
			}];
		} else {
			_unit enableAI "SUPPRESSION";
			_unit setSuppression 0;

			_unit setVariable [QGVAR(isSuppresed), false];
			_unit setVariable [QGVAR(lastTime), time];
			_unit setVariable [QGVAR(lastTimeEvent), time];
			_unit setVariable [QGVAR(lastUnitStance), (Stance _unit)];
			_unit setVariable [QGVAR(progress), 0];
			_unit setVariable [QGVAR(running), false];
		};
	};

	if !(GVAR(difficulty) isEqualTo 0) then {
		if ((isPlayer _unit) || !(local _unit) || ((side _unit) isEqualTo sideLogic)) exitWith {false};

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

}, _this] call CBA_fnc_waitUntilAndExecute;
