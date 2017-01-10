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
			if (((_container isKindOf "CAManBase") && !(_container getVariable ["GW_Gear_isPlayer", false])) || ((_secondaryContainer isKindOf "CAManBase") && (_secondaryContainer getVariable ["GW_Gear_isPlayer", false]))) then {
				true
			};
		} else {
			false
		};
	}];
}, [], 1] call CBA_fnc_waitAndExecute;

//	systemChat format ["%1", [time, (_container isKindOf "CAManBase"), (alive _container), (_container getVariable ["GW_Gear_isPlayer", false])]];
//	systemChat format ["%1",[(_secondaryContainer isEqualTo objNull), (_secondaryContainer isKindOf "CAManBase"), (alive _secondaryContainer), (_secondaryContainer getVariable ["GW_Gear_isPlayer", false])]];
