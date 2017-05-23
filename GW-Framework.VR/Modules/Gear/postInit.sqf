#include "scriptComponent.hpp"

["AllVehicles", "init", {
	params [
		"_unit"
	];
	if ((_unit isKindOf "CAManBase") && !(isPlayer _unit)) then {
		if (isNil {((group _unit) getVariable QGVAR(Loadout_Type))}) then {
			(group _unit) setVariable [QGVAR(Loadout_Type), false, true];
//			(group _unit) setVariable [QGVAR(Loadout_Type), (selectRandom [true, false]), true];
		};
	};

	[{
		_this call FUNC(Init);
	}, _this, 0.1] call CBA_fnc_waitAndExecute;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(setPlayerStamina), {
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[QGVAR(setPlayerStamina), []] call CBA_fnc_localEvent;

	["CAManBase", "Killed", {
		params [["_unit", objNull, [objNull]]];
		if (isPlayer _unit) then {
			_unit setVariable [QGVAR(unitGear), (getUnitLoadout _unit)];
		};
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	["CAManBase", "Respawn", {
		params [["_unit", objNull, [objNull]]];
		[{
			params [["_unit", objNull, [objNull]]];
			if !(local _unit) exitWith {false};

			_currentLoadout = (_unit getVariable QGVAR(unitGear));
			if !((_unit getVariable [QEGVAR(Menu,getUnitLoadout), nil]) isEqualTo nil) then {
				_currentLoadout set [5, (_unit getVariable QEGVAR(Menu,getUnitLoadout))];
				_unit setVariable [QEGVAR(Menu,getUnitLoadout), nil];
			};

			_unit setUnitLoadout (_unit getVariable QGVAR(unitGear));
			_unit selectWeapon (primaryWeapon _unit);
			[{
				[] call EFUNC(Common,setGroupColor);
			}, [_unit, (_unit getVariable QGVAR(Loadout))], 0.3] call CBA_fnc_waitAndExecute;

			[QGVAR(setPlayerStamina), []] call CBA_fnc_localEvent;
		}, _this, 0.1] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	player addEventHandler ["InventoryOpened", {
		params ["_unit","_container","_secondaryContainer"];
		if (GVAR(BlockAIGear)) then {
			if (((_container isKindOf "CAManBase") && !(_container getVariable [QGVAR(isPlayer), false])) || ((_secondaryContainer isKindOf "CAManBase") && (_secondaryContainer getVariable [QGVAR(isPlayer), false]))) then {
				true
			};
		} else {
			false
		};
	}];
}] call CBA_fnc_addEventHandler;
