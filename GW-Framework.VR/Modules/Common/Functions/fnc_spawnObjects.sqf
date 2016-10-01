/*
	Author: GuzzenVonLidl
	From array spawns objects and vehicles and adds them to a array

	Usage:
	[] call GW_Common_fnc_spawnObjects;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <ARRAY>
	Objects spawned

	Public: NO


*/
#include "..\scriptComponent.hpp"

private _objects = [];
{
	private _veh = createVehicle [(_x select 0), [0,0,0], [], 0, "NONE"];
	_veh setPosATL (_x select 1);
	_veh setDir (_x select 1);
	_objects pushBack _veh;
} forEach _this;

_objects
