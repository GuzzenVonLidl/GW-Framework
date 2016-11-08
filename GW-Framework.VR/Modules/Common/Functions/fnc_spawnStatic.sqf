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
	private _core = (_this select _forEachIndex);
	private _dir = (_core select 1);
	private _unitPos = (_core select 2);
	_x setFormDir _dir;
	_x setDir _dir;
	_x setPosATL (_core select 0);
	_x disableAI "PATH";
	doStop _x;
	if (_unitPos isEqualTo "Auto") then {
		_x setUnitPos (selectRandom ["Up","Middle"]);
	} else {
		_x setUnitPos _unitPos;
	};
} forEach (units _group);
_group
