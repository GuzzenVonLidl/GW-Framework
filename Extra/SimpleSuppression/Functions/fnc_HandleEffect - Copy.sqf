//#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

params ["_shooter", "_location"];

private _allUnits = [];
{
	_x params ["_unit"];
//	((currentWeapon _unit) isEqualTo "") &&
	if (!(isPlayer _unit) && !((side _unit) isEqualTo (side _shooter))) then {
		_allUnits pushBack _unit;
	};
} forEach (_location nearEntities ["Man", 10]);

{
	_x params ["_unit"];
	private _grp = (group _unit);
	private _chance = floor(random 100);
	private _currentWeapon = (currentWeapon _unit);
	private _unitStance = (unitPos _unit);
	private _newPos = (_unit getPos [25,floor(random 360)]);


/*
	if (_unit distance _newPos <= 5) then {
		_unit setUnitPos "DOWN";
	} else {
		_unit setUnitPos "AUTO";
	};
*/
	doStop _unit;
//	_unit doMove _newPos;
	_grp setBehaviour "AWARE";

	if ((_chance < 5) && GVAR(useSmoke)) then {
		_unit fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
		_unit selectWeapon _currentWeapon;
	};

//	if (true) then {
	if ((_chance < 25) && (_currentWeapon isEqualTo (primaryWeapon _unit)) && (_unit getVariable [QGVAR(animationDone), true]) && GVAR(evasiveAnimations)) then {
		_unit setVariable [QGVAR(animationDone), false];
		private _delay = (5 + floor(random 10));	// Next tacticle movement

		// strafes and drops to kneeling
		private _animation = selectRandom [
			["AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", "Front-Kneeling", "Middle"],
			["AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon", "Right-Kneeling", "Middle"],
			["AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon", "Left-Kneeling", "Middle"]
		];
		private _selectRandom = (selectRandom [true, false]);
		switch (stance _unit) do {
			case "STAND": {
				if (_selectRandom) then {
					// Standing and drops to prone
					_animation = selectRandom [
						["AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon", "Front-Prone", "Down"],
						["AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright", "Right-Prone", "Down"],
						["AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft", "Left-Prone", "Down"]
					];
				};
			};

			case "CROUCH": {
				_animation = selectRandom [
					["AmovPknlMevaSrasWrflDf", "Front-CROUCH", "Middle"],
					["AmovPknlMevaSrasWrflDfr", "Right-CROUCH", "Middle"],
					["AmovPknlMevaSrasWrflDfl", "Left-CROUCH", "Middle"]
				];
			};

			case "PRONE": {
				_delay = 3;
				_animation = selectRandom [
//					["AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", "Front-PRONE", "Down"],
					["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr", "Right-PRONE", "Down"],
					["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl", "Left-PRONE", "Down"]
				];
				if (_selectRandom) then {
					[{
						params ["_unit", "_animation"];
						_unit playMoveNow _animation;
					}, [_unit, (_animation select 0)], 1] call CBA_fnc_waitAndExecute;
				};
			};
		};

		_unit playMoveNow (_animation select 0);
		if (GVAR(Messages)) then {
			diag_log format ["playMoveNow; %1", (_animation select 1)];
			systemChat format ["playMoveNow; %1", (_animation select 1)];
		};
		[{
			params ["_unit", "_stance", "_newPos"];
			_unit doMove _newPos;
			(group _unit) setSpeedMode "FULL";
			_unit setUnitPos _stance; // back to default
			_unit setVariable [QGVAR(animationDone), true];
			_unit doTarget _shooter;
			_unit doFire _shooter;
		}, [_unit, _unitStance, _newPos], _delay] call CBA_fnc_waitAndExecute;
	};


	if (GVAR(waypoints) && (time > (_grp getVariable [QGVAR(nextWaypointDone), 0]))) then {
		if (GVAR(Messages)) then {
			diag_log "waypoint assigned";
			systemChat "waypoint assigned";
		};

		{
		    deleteWaypoint [_grp, 0];
		} forEach (waypoints _grp);
		_grp addWaypoint [(getPosATL _shooter), 0, 0];
		[_grp, 0] setWaypointType "SAD";
		[_grp, 0] setWaypointBehaviour "UNCHANGED"; // changed from COMBAT to UNCHANGED
		_grp setVariable [QGVAR(nextWaypointDone), (time + 30)];
	};

} forEach _allUnits;






/*
[_weapon] spawn {
	params ["_weapon"];
	_weapon suppressFor (5 + random 10);
	_aimAccuracy = (_weapon skill "aimingAccuracy");
	_weapon setSkill ["aimingAccuracy",_aimAccuracy/(1 + random 1)];
	sleep (10-((skill _weapon)*7));
	_weapon setSkill ["aimingAccuracy",skill _weapon];
};

[_unit,_weapon] spawn {
	params ["_unit", "_weapon"];
	_posFirer = position _weapon;
	if (_posFirer distance [0,0,0] < 100) exitWith {false};
	_grp = (group _unit);
	_aimAccuracy = _unit skill "aimingAccuracy";
	_courage = _unit skill "courage";
	_commanding = _unit skill "commanding";
	{
		_x setSkill ["aimingAccuracy",random 0.2 + ((skill _x)/(2 * random 4))];
		_x suppressFor (5 + random 20);
		if (GVAR(LMGSUPPRESSION) && (getText(configfile >> "CfgWeapons" >> currentWeapon _x >> "cursor")) isEqualTo "mg") then {
			[_x,_weapon] spawn FUNC(LMG);
		};
	} forEach (units(group _unit));
	if (GVAR(WAYPOINTS)) then {
		_grp addWaypoint [_posFirer, 0]; // changed index from 1 to 0
		[_grp, 0] setWaypointType "SAD"; //modified from Destroy waypoint which may make units attack static objects
		[_grp, 0] setWaypointBehaviour "UNCHANGED"; // changed from COMBAT to UNCHANGED
		sleep 5;
		//	_grp setCurrentWaypoint [_grp, 0];
	};
	_unit setSkill ["courage",(skill _unit)/4];
	_unit setSkill ["commanding",0];
	sleep (10 - ((skill _unit) * (1 + random 8)));
	_unit setSkill ["aimingAccuracy",_aimAccuracy];
	_unit setSkill ["courage",_courage];
	_unit setSkill ["commanding",_commanding];
	_unit doTarget _weapon;
	_unit doFire _weapon;
	_unit setVariable [QGVAR(Check),false];
};
*/
