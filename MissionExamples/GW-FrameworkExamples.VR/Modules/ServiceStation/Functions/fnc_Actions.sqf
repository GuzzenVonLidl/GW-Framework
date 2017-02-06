#include "..\scriptComponent.hpp"

private ["_Actions","_Action1","_Action2","_Action3","_Action4","_Action5","_Action6"];
params ["_veh","_SS"];

_Action1 =	_veh addAction ["<t color='#FF8000'>NeKy's Service Station</t>", {}, [], 10, false, false];
_Action2 =  _veh addaction ["<t color='#F7FE2E'>Repair</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Repair);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_veh,_SS,false], 10, false, true];
_Action3 =	_veh addaction ["<t color='#F7FE2E'>Refuel</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Refuel);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_veh,_SS,false], 10, false, true];
_Action4 =  _veh addaction ["<t color='#F7FE2E'>Rearm</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Rearm);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_veh,_SS,false], 10, false, true];
_Action5 =  _veh addaction ["<t color='#F7FE2E'>Full Service</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(FullService);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_veh,_SS], 10, false, true];
_Action6 =	_veh addAction ["<t color='#FF8000'>NeKy's Service Station</t>", {}, [], 10, false, false];

if (isServer) then {
	_Actions = [_Action1,_Action2,_Action3,_Action4,_Action5,_Action6];
	{GVAR(Actions) pushBack _x} forEach _Actions;

	// Remove Actions when leaving station.
	[_veh, _SS, _Actions] spawn {
		params ["_veh","_SS","_Actions"];

		WaitUntil {Sleep 0.5; (((_veh Distance _SS) > RADIUS) or !(_SS in GVAR(Stations)) or !(Alive _veh))};
		GVAR(Array) deleteAt (GVAR(Array) find _veh);
		if (_SS in GVAR(Active)) then {[_SS,false] call FUNC(Available)};
		PublicVariable QGVAR(Array);
		[[[_veh,_Actions],{{(_This select 0) removeAction _x} forEach (_This select 1)}], "BIS_FNC_SPAWN", True] call BIS_FNC_MP;
		{GVAR(Actions) deleteAt (GVAR(Actions) find _x)} forEach (_Actions + [_veh]);
	};
};
