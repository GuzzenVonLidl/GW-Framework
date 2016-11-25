#include "scriptComponent.hpp"

if !(hasInterface) exitWith {false};

[{
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};
}, [], 1] call CBA_fnc_waitAndExecute;
