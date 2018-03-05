/*
	AUTHOR: GuzzenVonLidl
	Spawning in a group and attack, patrol or defend a area

	Usage:
	["NATO", 3] spawn GW_Common_fnc_createUnits;

	Parameters:
	NOTE: if param have a Default it is also optional
	#0:	Faction:	Faction name from preInit
	#1:	Number:		Number of units to spawn

	Return Value: <GROUP>
	Group that spawned

	Public: NO

*/
#include "script_Component.hpp"

params [
	["_number", 1, [0]],
	["_radius", 30, [0]]
];

_waypoints = 5;
_waypointList = [];
if (_radius < 30) then {
	_radius = 30;
};

[GVAR(Faction), _number] call FUNC(createGroup) params ["_group"];

for "_i" from 0 to _waypoints do {
	_waypointList pushBack ([getPos (leader _group), 25, _radius, 3, 0, 20, 0] call BIS_fnc_findSafePos);
};

for "_i" from 0 to _waypoints do {
	_wp = _group addWaypoint [(_waypointList select _i), 0];
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "LIMITED";
	if (_waypoints isEqualTo _i) then {
		_wp setWaypointType "CYCLE";
	} else {
		_wp setWaypointType "MOVE";
	};
};

_group
