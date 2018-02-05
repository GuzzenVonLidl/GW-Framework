/*
	Author: GuzzenVonLidl
	From array spawns Units in a group, vehicles are spawned and ocupied by group and waypoints are added

	Usage:
	[] call GW_Common_fnc_spawnGroup_Veh;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "script_Component.hpp"

params [
	"_group",
	"_vehicleArray",
	"_waypointArray"
];
private _vehicleList = [];

{
	_x params ["_class","_pos","_dir","_crewCount",["_specials", []]];

	_vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	_vehicle setDir _dir;
	_vehicle setPosATL _pos;
	_vehicle setVectorUp surfaceNormal (position _vehicle);
	_pos set [2, (_pos select 2) + 0.3];
	_vehicle setPosATL _pos;
	_group addVehicle _vehicle;

	if (GVAR(AutoLock)) then {
		_vehicle setVehicleLock "LOCKEDPLAYER";
	};
	if (_waypointArray) then {
		_vehicle setFuel 0;
	};
	_vehicle allowCrewInImmobile true;
	_vehicle setVariable [QEGVAR(gear,side), GVAR(Faction)];

	[_vehicle, _specials] call FUNC(setAttributes);
	_vehicleList pushBack [_vehicle, _crewCount];
	TRACE_1("Created", _vehicle);
} forEach _vehicleArray;
TRACE_1("List", _vehicleList);

if !(_vehicleList isEqualTo []) then {
	{
		_x params ["_vehicle","_slots"];
		TRACE_1("Vehicle added to group", _vehicle);

		if (_slots isEqualTo []) then {
			{
				_slots pushBack [(_x select 1), (_x select 2), (_x select 3)];
			} forEach ((fullCrew [_vehicle,"",true]) select {((_x select 1) in ["commander","gunner","turret"])});
		};
		private _groupNew = ([GVAR(Faction), (count _slots), _group] call FUNC(createGroup));

		[{
			params ["_vehicle","_slots","_groupNew"];

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
		}, [_vehicle, _slots, _groupNew], 0.5] call CBA_fnc_waitAndExecute;
		TRACE_1("Units added to vehicle", _groupNew);
	} forEach _vehicleList;
};
