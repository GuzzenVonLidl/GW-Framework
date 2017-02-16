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
#define DEBUG_MODE_FULL
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
		private ["_unitPos","_specials"];
		private _unit = _x;
		private _core = (_unitArray select _forEachIndex);
		private _pos = (_core select 0);
		private _dir = (_core select 1);
		if ((count _core) isEqualTo 4) then {
			_unitPos = (_core select 2);
			_specials = (_core select 3);
//			_core params ["_pos","_dir","_unitPos","_specials"];
		} else {
			_specials = (_core select 2);
//			_core params ["_pos","_dir","_specials"];
		};

		if (_dir isEqualType []) then {
			_unit setVectorDirAndUp _dir;
			_unit setFormDir (getDir _unit);
			_unit setDir (getDir _unit);
		} else {
			_unit setFormDir _dir;
			_unit setDir _dir;
		};
		_unit setPosATL _pos;
		if (isNil "_waypointArray") then {
			_unit disableAI "PATH";
			doStop _unit;
			if (_unitPos isEqualTo "Auto") then {
				_unit setUnitPos (selectRandom ["Up","Middle"]);
			} else {
				_unit setUnitPos _unitPos;
			};
		};
		[_unit, _specials] call FUNC(setAttributes);
	} forEach (units _group);
};

if ((count _vehicleArray) > 0) then {
	{
		_x params ["_class","_pos","_dir","_crewCount","_specials"];
		_vehicle = createVehicle [_class, _pos, [], 0, "FLY"];
		_vehicle setDir _dir;
		_vehicle setVectorUp surfaceNormal (position _vehicle);
		if (GVAR(AutoLock)) then {
			_vehicle setVehicleLock "LOCKEDPLAYER";
		};
		if (isNil "_waypointArray") then {
			_vehicle setFuel 0;
		};
		_vehicle allowCrewInImmobile (selectRandom [true, false]);
		[_vehicle, _specials] call FUNC(setAttributes);
		_vehicleList pushBack [_vehicle, _crewCount];
		TRACE_1("Created", _vehicle);
	} forEach _vehicleArray;
	TRACE_1("List", _vehicleList);

	if !((count _vehicleList) isEqualTo 0) then {
		{
			private ["_vehicle","_slots","_groupNew"];
			_x params ["_vehicle","_slots"];
			_vehicle = (_x select 0);
			_slots = (_x select 1);
			_group addVehicle _vehicle;
			TRACE_1("Vehicle added to group", _vehicle);

			if (_slots isEqualTo 0) then {
				_groupNew = [GVAR(Faction),{(_slots in ["driver","commander","gunner","turret"])} count (fullCrew [_vehicle,"",true]), _group] call FUNC(createGroup);
			} else {
				_groupNew = ([GVAR(Faction), (count _slots), _group] call FUNC(createGroup));
			};

			{
				switch toLower((_slots select _forEachIndex) select 0) do {
					case "driver": {
						_x assignAsDriver _vehicle;
						_x moveInDriver _vehicle;
					};
					case "commander": {
						_x assignAsCommander _vehicle;
						_x moveInCommander _vehicle;
					};
					case "gunner": {
						_x assignAsGunner _vehicle;
						_x moveInGunner _vehicle;
					};
					case "turret": {
						_x assignAsTurret _vehicle;
						_x moveInTurret [_vehicle, (_slots select _forEachIndex) select 2];
					};
					case "cargo": {
						_x assignAsCargoIndex [_vehicle, (_slots select _forEachIndex) select 1];
						_x moveInCargo [_vehicle, (_slots select _forEachIndex) select 1];
					};
				};
				TRACE_2("Unit Moved to", _vehicle, (_slots select _forEachIndex));
			} forEach (_groupNew select 1);
			TRACE_1("Units added to vehicle", _groupNew);
		} forEach _vehicleList;
	};
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
