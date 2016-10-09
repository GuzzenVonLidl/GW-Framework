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

private _deleteObjects = (allDead + (allMissionObjects "WeaponHolder") + (allMissionObjects "GroundWeaponHoder") + (allMissionObjects "WeaponHolderSimulated") + (allMissionObjects "Ruins"));
{
	private ["_object","_timer","_distance"];
	_object = _x;

	if (isNil {_object getVariable QGVAR(ObjectRemovalTimer)}) then {
		if (_object isKindOf "AllVehicles") then {
			if (_object isKindOf "CAManBase") then {	// Man
				_timer = 10;
			} else {	// Vehicle
				_timer = 20;
			};
		} else {	// Other(Ruins, WeaponDrops, etc)
			_timer = 5;
		};
		_object setVariable [QGVAR(ObjectRemovalTimer), _timer];
	};
	private _getTime = (_object getVariable QGVAR(ObjectRemovalTimer));
	if (_getTime isEqualTo 0) then {
		TRACE_1("Deleting", _object);
		deleteVehicle _object;
		systemChat format ["%1", _object];
	} else {
		TRACE_1("Removal of Object in", _getTime);
		_object setVariable [QGVAR(ObjectRemovalTimer), _getTime - 1];
	};
} count _deleteObjects;

/*
			if (_object getVariable QGVAR(ObjectRemovalTimer) <= 0) then {
				if (_object isKindOf "AllVehicles") then {
					if (_object isKindOf "CAManBase") then {
						_distance = 75;
					} else {
						_distance = 250;
					};
				} else {
					_distance = 20;
				};
				if ({((_x distance2D _object) < _distance) && !(_x getVariable [QEGVAR(Respawn,isSpectating), false])} count allplayers == 0) then {
					TRACE_2("Deleting", _x, getPosATL _x);
					deleteVehicle _object;
				};
			};
*/
