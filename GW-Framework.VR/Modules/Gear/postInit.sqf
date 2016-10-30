#include "scriptComponent.hpp"

if !(hasInterface) exitWith {false};

/*
[{time >= 0.3}, {
	[player, (player getVariable [QGVAR(Loadout), ""])] call FUNC(Handler);
}, []] call CBA_fnc_waitUntilAndExecute;
*/

[{
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};
}, [], 1] call CBA_fnc_waitAndExecute;
