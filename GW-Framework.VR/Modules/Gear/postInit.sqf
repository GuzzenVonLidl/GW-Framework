#include "scriptComponent.hpp"

["AllVehicles", "init", {
	[{
		_this call FUNC(Init);
	}, _this] call CBA_Fnc_execNextFrame;
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "Killed", {
	params [["_unit", objNull, [objNull]]];
	if (!(isPlayer _unit) && !(local _unit)) exitWith {false};
	if (isMultiplayer) then {
	//	cutText ["","BLACK IN", 9999];	// delayed for safe reasons
		_unit setVariable [QGVAR(unitGear), (getUnitLoadout _unit)];
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "Respawn", {
	params [["_unit", objNull, [objNull]]];
	if (isPlayer _unit) then {
		[{
			params [["_unit", objNull, [objNull]]];
			if (!(isPlayer _unit) && !(local _unit)) exitWith {false};

			_unit setUnitLoadout (_unit getVariable QGVAR(unitGear));
			_unit selectWeapon (primaryWeapon _unit);
			[{
				[] call EFUNC(Common,setGroupColor);
			}, [_unit, (_unit getVariable QGVAR(Loadout))], 0.3] call CBA_fnc_waitAndExecute;

			[QGVAR(setPlayerStamina), []] call CBA_fnc_localEvent;
		}, _this, 0.1] call CBA_fnc_waitAndExecute;
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(setPlayerStamina), {
	if (GVAR(Stamina)) then {
		player setUnitTrait ["loadCoef", GVAR(StaminaCoef)];
		player setFatigue 0;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[QGVAR(setPlayerStamina), []] call CBA_fnc_localEvent;
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
