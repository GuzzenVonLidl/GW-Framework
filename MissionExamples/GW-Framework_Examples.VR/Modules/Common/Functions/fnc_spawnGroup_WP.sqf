/*
	Author: GuzzenVonLidl
	From array spawns Units in a group, vehicles are spawned and ocupied by group and waypoints are added

	Usage:
	[] call GW_Common_fnc_spawnGroup_WP;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "script_Component.hpp"

params [
	"_group",
	"_waypointArray"
];

{
	_x params [["_position",[0,0,0]], ["_attributes",[]]];
	private _waypoint = _group addWaypoint [_position, 0];

	{
		_x params ["_type","_setting"];
		switch (_type) do {
			case 0: {
				_waypoint setWaypointType _setting;
			};
			case 1: {
				_waypoint setWaypointBehaviour _setting;
			};
			case 2: {
				_waypoint setWaypointCombatMode _setting;
			};
			case 3: {
				_waypoint setWaypointCompletionRadius _setting;
			};
			case 4: {
				_waypoint setWaypointFormation _setting;
			};
			case 5: {
				_waypoint setWaypointSpeed _setting;
			};
			case 6: {
				_waypoint setWaypointTimeout _setting;
			};
			case 7: {
				_waypoint setWaypointStatements _setting;
			};
		};
	} forEach _attributes;

} forEach _waypointArray;
TRACE_2("Waypoints added to ", _group, (waypoints _group));
