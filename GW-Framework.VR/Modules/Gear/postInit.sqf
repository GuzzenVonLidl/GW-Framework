#include "scriptComponent.hpp"

if !(hasInterface) exitWith {false};

[{
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};

	player addEventHandler ["InventoryOpened", {
		params ["_unit","_container","_secondaryContainer"];
		if (GVAR(BlockAIGear)) then {
			if (((_container isKindOf "CAManBase") && !(isPlayer _container)) || ((_secondaryContainer isKindOf "CAManBase") && !(isPlayer _secondaryContainer))) then {
				true
			};
		} else {
			false
		};
	}];
}, [], 1] call CBA_fnc_waitAndExecute;

//			systemChat format ["%1, %2", [time, (_container isKindOf "CAManBase"), (alive _container), !(isPlayer _container)], ([(_secondaryContainer isEqualTo objNull), (_secondaryContainer isKindOf "CAManBase"), (alive _secondaryContainer), !(isPlayer _secondaryContainer)])];
