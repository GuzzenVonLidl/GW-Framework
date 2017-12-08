/*
	AUTHOR: GuzzenVonLidl
	Collects all positions and selects a random one to place a unit in

	Usage:
	["randomMarker_1", 50, 15] spawn GW_Common_Fnc_BuildingPop;

	Parameters:
	#0	OBJECT || STRING || ARRAY:	Center Location of buildings/positions
	#1	NUMBER:	Radius of area	(Optional: Default: 50)
	#2	NUMBER:	Amount of ai spawn

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "script_Component.hpp"

ERROR("Deprecated function used: GW_Common_Fnc_BuildingPop");

params ["_searchPos","_radius","_unitCount"];
private _getPos = [_searchPos] call FUNC(getPosATL);
private _buildings = [];

{
	private _house = ([_x] call BIS_fnc_buildingPositions);
	if (count _house >= 1) then {
		_buildings = (_buildings + _house);
	};
} forEach (nearestObjects [_getPos, ["house"], _radius]);

if (_unitCount > count _buildings) then {
	_unitCount = (count _buildings);
};

private _group = [GVAR(Faction), _unitCount] call FUNC(createGroup);
{
	private _pos = (selectRandom _buildings);
	private _dir = floor(random 360);
	_buildings deleteAt (_buildings find _pos);
	_x setFormDir _dir;
	_x setDir _dir;
	_x setPosATL _pos;
	_x setUnitPosWeak "UP";
	_x disableAI "PATH";
} forEach (units _group);
_group
