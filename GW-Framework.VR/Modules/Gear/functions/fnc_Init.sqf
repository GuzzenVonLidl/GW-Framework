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
			_mainScope = false;
			[{	// Auto detect
				params ["_unit"];
				private _role = "r";
				private _groupType = ((group _unit) getVariable [QGVAR(Loadout_Type), false]);
				private _displayName = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");

				if ((isPlayer _unit) || (!GVAR(randomZeusGear) && !(([format ["%1", typeOf _unit], 2] call BIS_fnc_trimString) isEqualTo "engineer_F"))) then {
					switch (true) do {
						case (_displayName isEqualTo "Squad Leader"): {
							_role = "sl";
						};
						case (_displayName isEqualTo "Team Leader"): {
							_role = "ftl";
						};
						case (_displayName isEqualTo "Rifleman"): {
							if (_groupType) then {
								_role = "mat";
							};
						};
						case (_displayName isEqualTo "Grenadier"): {
							if (_groupType) then {
								_role = "amat";
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
							_role = selectRandom ["r","mat","amat","g","ag","ar","mmg","ammg"];	// Random role
						};
					};
				} else {
					_role = selectRandom ["r","mat","amat","g","ag","ar","mmg","ammg"];	// Random role
				};
				[_unit, _role] call FUNC(Handler);
			}, [_unit], 0.1] call CBA_fnc_waitAndExecute;
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
	[{
		_this call FUNC(Handler);
	}, [_unit, _role], 0.5] call CBA_fnc_waitAndExecute;
};
