/*
	Author: GuzzenVonLidl
	Applies gear to aa soldier automaticly appon spawning it.
	Players are not affected by this
	Disable autogear by setting it to false

	Usage:
	[this, "sl"] call GW_Gear_Fnc_Init;

	Arguments:
	0: Unit <OBJECT>
	1: Role <STRING>	NOTE: THIS PARAM IS OPTIONAL AND SHOULD ONLY BE USED IF YOU WANT TO FORCE A ROLE

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params [
	["_unit", objNull, [objNull]],
	["_role", "", ["",[]]]
];

private _mainScope = true;

if ((_unit isKindOf "HeadlessClient_F") || !(local _unit)) exitWith {false};
if (_unit getVariable [QGVAR(blackList), false]) exitWith {false};

if (_unit isKindOf "CAManBase") then {
	if (GVAR(Auto_Assign) isEqualTo 0) then {	// Disable AI Gear
		if !(isPlayer _unit) then {
			_mainScope = false;
		};
	};
	if ((time > 5) && (GVAR(Auto_Assign) isEqualTo 2)) then {	// GW Spawned units only
		if !((_unit getVariable [QEGVAR(Common,isSpawned), false]) || (isPlayer _unit)) then {
			_mainScope = false;
		};
	};

	if (isNil {(_unit getVariable QGVAR(Loadout))}) then {
		_role = "r";
		private _groupType = ((group _unit) getVariable [QGVAR(Loadout_Type), false]);
		private _displayName = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");

		if ((isPlayer _unit) || !(GVAR(randomGear))) then {
			_role = [_unit] call FUNC(getLoadoutClass);
		} else {
			_role = selectRandom ["r","mat","amat","g","ag","ar","mmg","ammg"];	// Random role
		};
	} else {	// Disable
		_role = (_unit getVariable [QGVAR(Loadout), "r"]);	// Specific role assigned
	};
} else {
	if (_unit isKindOf "Car") then {
		_role = "car";
	} else {
		if (_unit isKindOf "Tank") then {
			_role = "tank";
		} else {
			if (_unit isKindOf "Helicopter") then {
				_role = "heli";
			} else {
				if (_unit isKindOf "Plane") then {
					_role = "plane";
				};
			};
		};
	};
	if ((GETSIDE(_unit) isEqualTo 3) && !(_unit isKindOf "ReammoBox_F")) then {
		_mainScope = false;
		ClearWeaponCargoGlobal _unit;
		ClearMagazineCargoGlobal _unit;
		ClearItemCargoGlobal _unit;
		ClearBackpackCargoGlobal _unit;
	};
};

if (_mainScope) then {
	[{
		_this call FUNC(Handler);
	}, [_unit, _role], 0.5] call CBA_fnc_waitAndExecute;
};
