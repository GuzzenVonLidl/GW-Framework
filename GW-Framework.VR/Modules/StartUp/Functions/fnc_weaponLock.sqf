/*
	Author: GuzzenVonLidl
	Toggle removal of all damage for player and bullets fired

	Usage:
	true call GW_StartUp_Fnc_WeaponLock;

	Arguments:
	0: Enable weaponlock <BOOL>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"
#define CURRENT_WEAPONS player, currentWeapon player, currentMuzzle player

if !(hasInterface) exitWith {false};
if ((player getVariable [QGVAR(weaponLock), false]) isEqualTo (_this)) exitWith {false};

switch (_this) do {
	case true: {
		player setCaptive true;
		player allowDamage false;
		player setVariable [QGVAR(weaponLock), true];
		GVAR(Lock) = player addEventHandler ["Fired", {
			[_this select 6] call ACE_FRAG_Fnc_addBlackList;
			deleteVehicle (_this select 6);
		}];
		if (GVARMAIN(mod_ACE3)) then {
			player setVariable ["ACE_Medical_AllowDamage", false];
			if ((currentWeapon player) in (player getVariable ["ACE_SafeMode_safedWeapons", []])) then {
				[CURRENT_WEAPONS] call ACE_SafeMode_fnc_lockSafety;
			};
		};
	};

	default {
		player setCaptive false;
		player allowDamage true;
		player setVariable [QGVAR(weaponLock), false];
		if (!isnil QGVAR(Lock)) then {
			player removeEventHandler ["Fired", GVAR(Lock)];
		};
		if (GVARMAIN(mod_ACE3)) then {
			player setVariable ["ACE_Medical_AllowDamage", true];
			if ((currentWeapon player) in (player getVariable ["ACE_SafeMode_safedWeapons", []])) then {
				[CURRENT_WEAPONS] call ACE_SafeMode_fnc_unlockSafety;
			};
		};
	};
};
