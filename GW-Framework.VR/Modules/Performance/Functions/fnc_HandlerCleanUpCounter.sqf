/*
	Author: GuzzenVonLidl
	A performance handler that removes dead bodies, weaponholders and vehicles after some time

	Usage:
	[] call GW_Performance_Fnc_HandlerCleanUp;

	Arguments: NO

	Return Value: NO

	Public: NO
*/
#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"
params ["_objectType","_object"];
private ["_timer","_distance"];

if (isNil {_object getVariable QGVAR(ObjectRemovalTimer)}) then {
	switch (_objectType) do {
		case 0: { // Man
			_timer = 10;
		};
		case 1: { // Vehicle
			_timer = 20;
		};
		case 2: { // WeaponHolder
			_timer = 5;
		};
		case 3: { // Ruins
			_timer = 5;
		};
	};
	_object setVariable [QGVAR(ObjectRemovalTimer), _timer];
};

private _getTime = (_object getVariable QGVAR(ObjectRemovalTimer));
if (_getTime isEqualTo 0) then {
	if (({(_x distance2D _object) < 50} count allPlayers) isEqualTo 0) then {
		TRACE_1("Deleting", _object);
		deleteVehicle _object;
	};
} else {
	TRACE_1("Removal Timer", _getTime);
	_object setVariable [QGVAR(ObjectRemovalTimer), _getTime - 1];
};
