#include "..\scriptComponent.hpp"

params ["_unit"];

_unit addEventHandler ["Fired",{
	_this call FUNC(handleFired);
}];
_unit setVariable [QGVAR(unitPos), (unitPos _unit)];

if ((_unit isKindOf "CaManBase") && !(isPlayer _unit)) then {
	_unit addEventHandler ["Hit",{
		params ["_unit"];
		_unit setVariable [QGVAR(Check),false];
		[_unit,objNull] spawn FUNC(Behaviour);
	}];

	_unit enableAI "SUPPRESSION";
	_unit setSuppression 0;

	_unit setVariable [QGVAR(isSuppresed), false];
	_unit setVariable [QGVAR(lastTime), time];
	_unit setVariable [QGVAR(lastTimeEvent), time];
	_unit setVariable [QGVAR(lastUnitStance), (Stance _unit)];
	_unit setVariable [QGVAR(progress), 0];
	_unit setVariable [QGVAR(running), false];
};
