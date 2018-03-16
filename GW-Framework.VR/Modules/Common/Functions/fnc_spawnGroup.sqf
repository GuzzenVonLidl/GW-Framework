/*
	Author: GuzzenVonLidl
	From array spawns Units in a group, vehicles are spawned and ocupied by group and waypoints are added

	Usage:
	[] call GW_Common_fnc_spawnGroup;

	Arguments:
	#0:	ARRAY - A shit ton of multidimensional arrays

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "script_Component.hpp"

if (is3DEN) exitWith {
	_this call FUNC(spawn3DEN);
	false
};

params [
	"_unitArray",
	["_vehicleArray", []],
	["_waypointArray", nil],
	["_skipQueue", false]
];

private _group = [GVAR(Faction), 0] call FUNC(createGroup);

[_unitArray,_vehicleArray,_waypointArray,_skipQueue,_group] spawn FUNC(spawnHandler);

_group
