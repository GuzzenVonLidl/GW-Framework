//#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

params ["_shooter", "_location"];

private _allUnits = [];
//	((currentWeapon _unit) isEqualTo "") &&
//	if (!(isPlayer _unit) && !((side _unit) isEqualTo (side _shooter))) then {
{
	_x params ["_unit"];
	if !(isPlayer _unit) then {
		_allUnits pushBack _unit;
	};
} forEach (_location nearEntities ["Man", 10]);

{
	_x params ["_unit"];
	private _grp = (group _unit);
	private _chance = floor(random 100);
	private _currentWeapon = (currentWeapon _unit);
	private _newPos = (_unit getPos [25,floor(random 360)]);

	_unit setVariable [QGVAR(unitPos), (unitPos _unit)];


	doStop _unit;
	_grp setBehaviour "AWARE";
//	_unit doMove _newPos;

	switch (_moveOrder) do {
		case "": {	// Evasive maneuvers
			[_unit] call FUNC(DoEvasive);
		};

		case "": {	// Smoke
			[_unit] call FUNC(DoSmoke);
		};

		case "": {	// Suppress
			[_unit] call FUNC(DoSuppress);
		};

		case "": {	// Flank
			[_unit] call FUNC(DoFlank);
		};

		default {	// Relocate
			[_unit] call FUNC(DoRelocate);
//			_unit doMove _newPos;
		};
	};
	// Change skill
} forEach _allUnits;
