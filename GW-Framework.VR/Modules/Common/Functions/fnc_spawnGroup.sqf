/*
	Author: GuzzenVonLidl
	From array spawns Units in a group, vehicles are spawned and ocupied by group and waypoints are added

	Usage:
	[] call GW_Common_fnc_spawnGroup;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "..\scriptComponent.hpp"

params [
	"_unitArray",
	"_vehicleArray",
	["_waypointArray", nil]
];
private _vehicleList = [];
private _group = [GVAR(Faction), (count _unitArray)] call FUNC(createGroup);

if !((count _unitArray) isEqualTo 0) then {
	{
		private _core = (_unitArray select _forEachIndex);
		private _pos = (_core select 0);
		private _dir = (_core select 1);
		_x setFormDir _dir;
		_x setDir _dir;
		_x setPosATL _pos;
		if (isNil "_waypointArray") then {
			private _unitPos = (_core select 2);
			_x disableAI "PATH";
			doStop _x;
			if (_unitPos isEqualTo "Auto") then {
				_x setUnitPos (selectRandom ["Up","Middle"]);
			} else {
				_x setUnitPos _unitPos;
			};
		};
	} forEach (units _group);

};

if ((count _vehicleArray) > 0) then {
	{
		_vehicle = createVehicle [(_x select 0), [0,0,0], [], 0, "FLY"];
		_vehicle setDir (_x select 2);
		_vehicle setPosATL (_x select 1);
		_vehicleList pushBack [_vehicle, (_x select 3)];
		if (isNil "_waypointArray") then {
			_vehicle setFuel 0;
		};
		TRACE_1("Created", _vehicle);
		TRACE_1("List", _vehicleList);
	} forEach _vehicleArray;
};

if !((count _vehicleList) isEqualTo 0) then {
	{
		private ["_vehicle","_slots","_groupNew"];
		_vehicle = (_x select 0);
		_slots = (_x select 1);
		_group addVehicle _vehicle;

		if (_slots isEqualTo 0) then {
			_groupNew = [GVAR(Faction),{((_x select 1) in ["driver","commander","gunner","turret"]) && !(_x select 4)} count (fullCrew [_vehicle,"",true]), _group] call FUNC(createGroup);
		} else {
			_groupNew = ([GVAR(Faction), (count _slots), _group] call FUNC(createGroup));
		};
		{
			switch toLower((_slots select _forEachIndex) select 0) do {
				case "driver": {
					_x moveInDriver _vehicle;
				};
				case "commander": {
					_x moveInCommander _vehicle;
				};
				case "gunner": {
					_x moveInGunner _vehicle;
				};
				case "turret": {
					_x moveInTurret [_vehicle, (_slots select _forEachIndex) select 2];
				};
				case "cargo": {
					_x moveInCargo [_vehicle, (_slots select _forEachIndex) select 1];
				};
			};
			TRACE_2("Unit Moved to", _vehicle, (_slots select _forEachIndex));
		} forEach (_groupNew select 1);
		TRACE_1("Vehicle added to group", _vehicle);
		TRACE_1("Units added to vehicle", _groupNew);
	} forEach _vehicleList;
};

if !(isNil "_waypointArray") then {
	if !((count _waypointArray) isEqualTo 0) then {
		{
			_x params ["_position",["_type", "MOVE", [""]],["_behaviour", "UNCHANGED", [""]],["_combatMode", "NO CHANGE", [""]],["_completionRadius", 10, [0]],["_formation", "NO CHANGE", [""]],["_speed", "UNCHANGED", [""]]];
			_waypoint = _group addWaypoint [_position, 5];
			_waypoint setWaypointType _type;
			_waypoint setWaypointBehaviour _behaviour;
			_waypoint setWaypointCombatMode _combatMode;
			_waypoint setWaypointCompletionRadius _completionRadius;
			_waypoint setWaypointFormation _formation;
			_waypoint setWaypointSpeed _speed;
		} forEach _waypointArray;
		TRACE_2("Waypoints added to ", _group, (waypoints _group));
	};
};

_group
