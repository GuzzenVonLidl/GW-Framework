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
#include "script_Component.hpp"

params [
	"_unitArray",
	["_vehicleArray", []],
	["_waypointArray", nil]
];

if (is3DEN) exitWith {
	_this call FUNC(spawn3DEN);
	false
};

private _group = [GVAR(Faction), (count _unitArray)] call FUNC(createGroup);

if !((count _unitArray) isEqualTo 0) then {
	{
		private _core = (_unitArray select _forEachIndex);
		private _unit = _x;
		_core params ["_pos","_dir",["_unitPos", [], [[],""]],["_specials", []]];
		if (isNil "_waypointArray") then {
			[QGVAR(disableAICommand), _unit] call CBA_fnc_localEvent;

			if (_unitPos isEqualTo "Auto") then {
				_unit setUnitPos (selectRandom ["Up","Middle"]);
			} else {
				_unit setUnitPos _unitPos;
			};
		} else {
			_unit disableAI "MINEDETECTION";
		};

		_unit setFormDir _dir;
		_unit setDir _dir;
		_unit setPosATL _pos;

		[_unit, _specials] call FUNC(setAttributes);
		[{
			params ["_unit","_dir"];
			_unit setFormDir _dir;
			_unit setDir _dir;
		}, [_unit, _dir], (1 + _forEachIndex)] call CBA_fnc_waitAndExecute;
	} forEach (units _group);
};

if ((count _vehicleArray) > 0) then {
	[{
		_this call FUNC(spawnGroup_Veh);
	}, [_group, _vehicleArray, (isNil "_waypointArray")], 2] call CBA_fnc_waitAndExecute;
};

if !(isNil "_waypointArray") then {
	[{
		_this call FUNC(spawnGroup_WP);
	}, [_group, _waypointArray], 3] call CBA_fnc_waitAndExecute;
};

_group
