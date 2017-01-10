#include "..\scriptComponent.hpp"

params [["_unit", objNull, [objNull]]];

if (!(isPlayer _unit) && !(local _unit)) exitWith {false};

[{
	params [["_unit", objNull, [objNull]]];

	_unit setUnitLoadout (_unit getVariable QGVAR(unitGear));
	_unit selectWeapon (primaryWeapon _unit);
	[{
		[] call EFUNC(Roster,setGroupColor);
	}, [_unit, (_unit getVariable QEGVAR(Gear,Loadout))], 0.3] call CBA_fnc_waitAndExecute;

	if (EGVAR(Gear,Stamina)) then {
		_unit setUnitTrait ["loadCoef", EGVAR(Gear,StaminaCoef)];
		_unit setFatigue 0;
	};

	_unit addEventHandler ["InventoryOpened", {
		params ["_unit","_container","_secondaryContainer"];
		if (GVAR(BlockAIGear)) then {
			if (((_container isKindOf "CAManBase") && !(_container getVariable ["GW_Gear_isPlayer", false])) || ((_secondaryContainer isKindOf "CAManBase") && (_secondaryContainer getVariable ["GW_Gear_isPlayer", false]))) then {
				true
			};
		} else {
			false
		};
	}];

	if !(GVAR(Mode) isEqualTo 0) then {
		[QGVAR(Events), [_unit, "respawnServer"]] call CBA_fnc_serverEvent;
	};
	cutText ["","BLACK IN", 5];
}, _this, 0.1] call CBA_fnc_waitAndExecute;
