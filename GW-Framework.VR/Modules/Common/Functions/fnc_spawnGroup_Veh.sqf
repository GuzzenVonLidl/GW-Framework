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
#include "..\scriptComponent.hpp"

params [
	"_group",
	"_vehicleArray",
	"_waypointArray"
];
private _vehicleList = [];

{
	_x params ["_class","_pos","_dir","_crewCount",["_specials", []]];

	_vehicle = createVehicle [_class, _pos, [], 0, "NONE"];
	_vehicle setDir _dir;
	_vehicle setPosATL _pos;
	_vehicle setVectorUp surfaceNormal (position _vehicle);

	if (GVAR(AutoLock)) then {
		_vehicle setVehicleLock "LOCKEDPLAYER";
	};
	if (_waypointArray) then {
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
