#include "scriptComponent.hpp"

if !(hasInterface) exitWith {false};

[{
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};
	[] call FUNC(setGroupColor);
}, [], 1] call CBA_fnc_waitAndExecute;

/*
	player setUnitTrait ["camouflageCoef", 0.8];
	ACE_Medical_playerDamageThreshold = 2;
	ACE_Medical_bleedingCoefficient = 0.1;
*/
