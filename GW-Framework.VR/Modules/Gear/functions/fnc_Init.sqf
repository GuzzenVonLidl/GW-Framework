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

if (!GVAR(Auto_Assign) || !(local (_this select 0)) || ((_this select 0) isKindOf "HeadlessClient_F")) exitWith {false};

[{MISSIONLOADED}, {
	private _fastExit = false;
	params [
		["_unit", objNull, [objNull]],
		["_role", "", ["",[]]]
	];

	if (_unit isKindOf "CAManBase") then {
		if (isPlayer _unit) then {
			_role = _unit getVariable [QGVAR(Loadout), ""];
			(group _unit) setVariable [QGVAR(Loadout_Type), false];
		} else {
			_role = (_unit getVariable [QGVAR(Loadout), ""]);
			if (_role isEqualTo "") then {
				if (leader (group _unit) isEqualTo _unit) then {
					(group _unit) setVariable [QGVAR(Loadout_Type), (selectRandom [true, false])];
					_role = "ftl";
				} else {
					_fastExit = true;
					[{(!isNil {((group (_this select 0)) getVariable QGVAR(Loadout_Type))})}, {
						params ["_unit"];
						private _role = "r";
						private _vehicle = (vehicle _unit);
						private _type = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
						private _groupType = ((group _unit) getVariable QGVAR(Loadout_Type));

						if ((_vehicle != _unit) && !(_vehicle isKindOf "Car_F")) then {
							if (_vehicle isKindOf "Air") then {
								_role = "p";
							} else {
								_role = "crew";
							};
						} else {
							switch (true) do {
								case (_type isEqualTo "Rifleman (AT)"): {
									_role = "hat";
								};
								case (_type isEqualTo "Grenadier"): {
									if (_groupType) then {
										_role = "ahat";
									} else {
										_role = "g";
									};
								};
								case (_type in ["Asst. Autorifleman","Combat Life Saver","Medic","Corpsman"]): {
									if (_groupType) then {
										_role = "ammg";
									} else {
										_role = "ag";
									};
								};
								case (_type in ["Autorifleman","Machinegunner"]): {
									if (_groupType) then {
										_role = "mmg";
									} else {
										_role = "ar";
									};
								};
								case (_type isEqualTo "Crewman"): {
									_role = "crew";
								};
								case (_type in ["Helicopter Pilot","Pilot"]): {
									_role = "p";
								};
								default {
									_role = "r";
								};
							};
						};

						[_unit, _role] call FUNC(Handler);
					}, [_unit]] call CBA_fnc_waitUntilAndExecute;
				};
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
	};

	if !(_fastExit) then {
		[{ _this call FUNC(Handler) }, [_unit, _role]] call CBA_fnc_execNextFrame;
	};
}, _this] call CBA_fnc_waitUntilAndExecute;
