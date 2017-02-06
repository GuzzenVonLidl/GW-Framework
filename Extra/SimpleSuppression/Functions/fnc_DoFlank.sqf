#include "..\scriptComponent.hpp"

params ["_unit"];

private _grp = (group _unit);
private _shooter = player;
private _LeftorRight = (selectRandom [35, -35]);

if (GVAR(waypoints) && (time > (_grp getVariable [QGVAR(nextWaypointDone), 0]))) then {
	if (GVAR(Messages)) then {
		diag_log "waypoint assigned";
		systemChat "waypoint assigned";
	};

	{
	    deleteWaypoint [_grp, 0];
	} forEach (waypoints _grp);
	_grp addWaypoint [_unit getRelPos [floor((_unit distance2D _shooter) / 3), (floor(_unit getRelDir _shooter) + _LeftorRight)], 20, 0];
	[_grp, 0] setWaypointType "Move";
	[_grp, 0] setWaypointBehaviour "Aware";
	_LogicCenter = createCenter sideLogic;
	_moduleGroup = createGroup _LogicCenter;
	_logic = "Land_Matches_F" createVehicle [0,0,0];
	_logic setPosATL (waypointPosition [_grp, 0]);

	for "_i" from 1 to 2 step 1 do {
		_logic setPosATL (waypointPosition [_grp, (_i - 1)]);
		if (_i isEqualTo 2) then {
			_grp addWaypoint [(getPosATL _shooter), 1, _i];
			[_grp, _i] setWaypointType "SAD";
			[_grp, _i] setWaypointBehaviour "COMBAT"; // changed from COMBAT to UNCHANGED
		} else {
			_grp addWaypoint [(_unit getRelPos [floor((_unit distance2D _shooter) - ((waypointPosition [_grp, (_i - 1)]) distance2D _unit)), (floor(_unit getRelDir _shooter) + _LeftorRight)]), 20, _i];
			[_grp, _i] setWaypointType "Move";
			[_grp, _i] setWaypointBehaviour "Aware";
		};
	};
	deleteVehicle _logic;

	_grp setVariable [QGVAR(nextWaypointDone), (time + 30)];
};

/*
((_unit distance2D _shooter) / 2)

([_unit, _shooter] call BIS_fnc_relativeDirTo) + (selectRandom [90, -90])



//target1 getPos [((target1 distance2D player) / 2), ([target1, player] call BIS_fnc_relativeDirTo) + (selectRandom [90, -90])]
*/
