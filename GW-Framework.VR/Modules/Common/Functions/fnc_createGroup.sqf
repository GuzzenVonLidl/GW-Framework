/*
	AUTHOR: GuzzenVonLidl
	Spawning in a group and attack, patrol or defend a area

	Usage:
	["NATO", 3] call GW_Common_fnc_createGroup;
	["NATO", 3, (group player)] call GW_Common_fnc_createGroup;

	Parameters:
	NOTE: if param have a Default it is also optional
	#0:	Faction:	Faction name from preInit
	#1:	Number:		Number of units to spawn

	Return Value: <GROUP>
	Group that spawned

	Public: NO
*/
#include "..\scriptComponent.hpp"

private ["_unitClass","_unit","_array","_unitsCreted"];
params [
	"_faction",
	["_number", 1, [0]],
	["_group", grpNull, [grpNull]]
];
([_faction] call FUNC(getGroupType)) params ["_side", "_leader","_unitList"];

if (_group isEqualTo grpNull) then {
	_group = CreateGroup _side;
} else {
	_unitsCreted = [];
};
TRACE_1("Update", _group);

for "_i" from 1 to _number do {
	if (_i isEqualTo 1) then {
		_unitClass = _leader;
	} else {
		_unitClass = (selectRandom _unitList);
	};
	_unit = _group createUnit [_unitClass, [0,0,0], [], 10, "NONE"];
	_unit setVariable [QGVAR(isSpawned), true];
	if !(isNil "_unitsCreted") then {
		_unitsCreted pushBack _unit;
	};
	TRACE_1("Created", _unit);
};

if !(isNil "_unitsCreted") then {
	[_group, _unitsCreted]
} else {
	_group
};
