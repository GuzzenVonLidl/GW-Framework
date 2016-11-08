#include "..\scriptComponent.hpp"

params ["_unit"];

_unit addEventHandler ["Fired",{
	_this spawn FUNC(FiredEH);
}];

_unit addEventHandler ["Hit",{
	params ["_unit"];
	_unit setVariable [QGVAR(Check),false];
	[_unit,objNull] spawn FUNC(Behaviour);
}];
