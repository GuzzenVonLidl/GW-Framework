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
	["_role", "autoDetect", ["",[]]]
];

if ((_unit isKindOf "HeadlessClient_F") || !(local _unit)) exitWith {false};
if (_unit getVariable [QGVAR(blackList), false]) exitWith {false};
if !((_unit isKindOf "ReammoBox_F") || (isPlayer _unit)) then {
	if !GVAR(Auto_Assign) exitWith {false};
};

private _mainScope = true;
private _vehicle = (vehicle _unit);

if (_unit isKindOf "CAManBase") then {
	if (isNil {((group _unit) getVariable QGVAR(Loadout_Type))}) then {
		if ((leader (group _unit) isEqualTo _unit) && !(isPlayer _unit)) then {
			(group _unit) setVariable [QGVAR(Loadout_Type), (selectRandom [true, false]), true];
		} else {
			(group _unit) setVariable [QGVAR(Loadout_Type), false, true];
		};
	};

	if ((_unit getVariable [QGVAR(Loadout), _role]) isEqualTo "") then {	// Disable
		_mainScope = false;
	} else {
		if !(isNil {(_unit getVariable QGVAR(Loadout))}) then {		// Specific role assigned
			_role = (_unit getVariable [QGVAR(Loadout), _role]);
		} else {
			[{(!isNil {((group (_this select 0)) getVariable QGVAR(Loadout_Type))})}, {	// Auto detect
				params ["_unit"];
				private _role = "r";
				private _groupType = ((group _unit) getVariable QGVAR(Loadout_Type));
				private _displayName = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");

				switch (true) do {
					case (_displayName isEqualTo "Squad Leader"): {
						_role = "sl";
					};
					case (_displayName isEqualTo "Team Leader"): {
						_role = "ftl";
					};
					case (_displayName isEqualTo "Rifleman"): {
						if (_groupType) then {
							_role = "hat";
						} else {
							if (isPlayer _unit) then {
								_role = "rat";
							};
						};
					};
					case (_displayName isEqualTo "Rifleman (AT)"): {
						_role = "hat";
					};
					case (_displayName isEqualTo "Grenadier"): {
						if (_groupType) then {
							_role = "ahat";
						} else {
							_role = "g";
						};
					};
					case (_displayName in ["Asst. Autorifleman","Combat Life Saver","Medic","Corpsman"]): {
						if (_groupType) then {
							_role = "ammg";
						} else {
							_role = "ag";
						};
					};
					case (_displayName in ["Autorifleman","Machinegunner"]): {
						if (_groupType) then {
							_role = "mmg";
						} else {
							_role = "ar";
						};
					};
					case (_displayName isEqualTo "Crewman"): {
						_role = "crew";
					};
					case (_displayName in ["Helicopter Pilot","Pilot"]): {
						_role = "p";
					};
					default {
						_role = selectRandom ["ftl","r","hat","ahat","g","ag","ar","mmg","ammg"];	// Random role
					};
				};
				[_unit, _role] call FUNC(Handler);
			}, [_unit]] call CBA_fnc_waitUntilAndExecute;
		};
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
	[{MISSIONLOADED}, {
		_this call FUNC(Handler);
	}, [_unit, _role]] call CBA_fnc_waitUntilAndExecute;
};
