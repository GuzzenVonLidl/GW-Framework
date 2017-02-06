/*
	Author: GuzzenVonLidl
	From array spawns Units in a group, vehicles are spawned and ocupied by group and waypoints are added

	Usage:
	[] call GW_Common_fnc_spawnStatic;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "..\scriptComponent.hpp"

private _group = [GVAR(Faction), (count _this)] call FUNC(createGroup);
{
	private _dir = ((_this select _forEachIndex) select 1);
	_x setFormDir _dir;
	_x setDir _dir;
	_x setPosATL ((_this select _forEachIndex) select 0);
	_x setUnitPos ((_this select _forEachIndex) select 2);
	_x disableAI "PATH";
} forEach (units _group);
_group
