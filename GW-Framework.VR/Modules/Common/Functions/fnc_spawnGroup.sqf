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

if (GVAR(spawnActive)) exitWith {
	GVAR(spawnQueue) pushBack _this;
	false
};

if !(canSuspend) exitWith {
	_this spawn FUNC(spawnGroup);
	false
};

if (GVAR(autoQueue)) then {
	GVAR(spawnActive) = true;
};

params [
	"_unitArray",
	["_vehicleArray", []],
	["_waypointArray", nil]
];

private _group = [GVAR(Faction), (count _unitArray)] call FUNC(createGroup);

if !((count _unitArray) isEqualTo 0) then {
	{
		(_unitArray select _forEachIndex) params ["_pos","_dir",["_unitPos", [], [[],""]],["_specials", []]];
		private _unit = _x;
		if (isNil "_waypointArray") then {
			[QGVAR(disableAICommand), _unit] call CBA_fnc_localEvent;

			if (_unitPos isEqualTo "Auto") then {
				_unit setUnitPos (selectRandom ["Up","Middle"]);
			} else {
				_unit setUnitPos _unitPos;
			};
			doStop _unit;
		} else {
			_unit disableAI "MINEDETECTION";
		};

		_unit setFormDir _dir;
		_unit setDir _dir;
		sleep 0.1;
		_unit setDir _dir;
		_unit setPosATL _pos;

		[_unit, _specials] call FUNC(setAttributes);

		sleep 0.9;
		_unit enableSimulationGlobal true;
	} forEach (units _group);
	sleep 1;
};

if ((count _vehicleArray) > 0) then {
	private _vehicleList = [];

	{
		_x params ["_class","_pos","_dir","_crewList",["_specials", []]];
		private _collision = "CAN_COLLIDE";
		if (_pos select 2 > 20) then {
			_collision = "FLY";
		};
		_vehicle = createVehicle [_class, _pos, [], 0, _collision];
		_vehicle setDir _dir;
		_vehicle setPosATL _pos;
		_vehicle setVectorUp surfaceNormal (position _vehicle);
		_pos set [2, (_pos select 2) + 0.3];
		_vehicle setPosATL _pos;
		_group addVehicle _vehicle;

		if (GVAR(AutoLock)) then {
			_vehicle setVehicleLock "LOCKEDPLAYER";
		};

		if (isNil "_waypointArray") then {
			_vehicle setFuel 0;
			_vehicle allowCrewInImmobile true;
		} else {
			_vehicle engineOn true;
		};

		_vehicle setVariable [QEGVAR(gear,side), GVAR(Faction)];

		[_vehicle, _specials] call FUNC(setAttributes);
		_vehicleList pushBack [_vehicle, _crewList];
		TRACE_1("Created", _vehicle);

		if (_crewList isEqualTo []) then {
			{
				_crewList pushBack [(_x select 1), (_x select 2), (_x select 3)];
			} forEach ((fullCrew [_vehicle,"",true]) select {((_x select 1) in ["commander","gunner","turret"])});
		};

		private _groupNew = ([GVAR(Faction), (count _crewList), _group] call FUNC(createGroup));

		{
			_slots = _x;
			TRACE_1("Vehicle added to group", _vehicle);

			{
				switch (toLower(_slots select 0)) do {
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
						_x moveInTurret [_vehicle, (_slots select 2)];
					};
					case "cargo": {
						_x moveInCargo [_vehicle, (_slots select 1)];
					};
				};
				_x enableSimulationGlobal true;
				TRACE_2("Unit Moved to", _vehicle, _slots);
			} forEach (_groupNew select 1);

			TRACE_1("Units added to vehicle", _groupNew);
			sleep 1;
		} forEach _crewList;
		sleep 3;
	} forEach _vehicleArray;
	sleep 1;
};

if !(isNil "_waypointArray") then {
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
};

sleep 1;

if (GVAR(autoQueue)) then {
	GVAR(spawnActive) = false;
	if ((count GVAR(spawnQueue)) > 0) then {
		(GVAR(spawnQueue) select 0) spawn FUNC(spawnGroup);
		GVAR(spawnQueue) deleteAt 0;
	};
};

_group
