/*
	Author: GuzzenVonLidl
	Force clear all dead units and vehicles if condition is meet
	Timelimit and player distance

	Usage:
	[] call GW_Performance_Fnc_clearObjects;

	Arguments: NO

	Return Value: NO

	Public: NO

*/
#include "..\scriptComponent.hpp"

{
	private ["_object","_timer","_distance"];
	_object = _x;
	if (vehicleVarName _object isEqualTo "") then {
		if (isNil {_object getVariable QGVAR(ObjectRemovalTimer)}) then {
			if (_object isKindOf "AllVehicles") then {
				if (_object isKindOf "CAManBase") then {
					_timer = 15;
				} else {
					_timer = 20;
				};
			} else {
				_timer = 5;
			};
			_object setVariable [QGVAR(ObjectRemovalTimer), _timer];
		} else {
			if (_object getVariable QGVAR(ObjectRemovalTimer) > 0) then {
				TRACE_1("Time remaining until object will be removed", (_object getVariable QGVAR(ObjectRemovalTimer)));
				_object setVariable [QGVAR(ObjectRemovalTimer), (_object getVariable QGVAR(ObjectRemovalTimer)) - 1];
			} else {
				if (_object getVariable QGVAR(ObjectRemovalTimer) <= 0) then {
					if (_object isKindOf "AllVehicles") then {
						if (_object isKindOf "CAManBase") then {
							_distance = 100;
						} else {
							_distance = 300;
						};
					} else {
						_distance = 20;
					};
					if ({((_x distance2D _object) < _distance) && !(_x getVariable [QEGVAR(Respawn,isSpectating), false])} count allplayers == 0) then {
						TRACE_2("Deleting", _x, getPosATL _x);
						deleteVehicle _object;
					};
				};
			};
		};
	};
} forEach (allDead + (allMissionObjects "WeaponHolder") + (allMissionObjects "GroundWeaponHoder") + (allMissionObjects "WeaponHolderSimulated") + (allMissionObjects "Ruins"));
