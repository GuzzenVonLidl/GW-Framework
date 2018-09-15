#include "script_Component.hpp"

[QGVARMAIN(serverReady), {
	["CAManBase", "init", {
		params ["_unit"];
		if (GVAR(autoDelete)) then {
			[{
				params ["_unit"];
				if ((_unit distance [0,0,0]) < 30) then {
					deleteVehicle _unit;
				};
			}, _this, 10] call CBA_fnc_waitAndExecute;
		};
		_unit setSpeaker "NoVoice";
	}, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[player] call FUNC(setGroupColor);
	if (leader (group player) isEqualTo player) then {
		[player] call FUNC(setGroupID);
	};
	if (didJip) then {
		[QGVAR(update), []] call CBA_fnc_globalEvent;
	};

	player addEventHandler ["InventoryOpened", {
		params ["_unit","_container","_secondaryContainer"];
		if (GVAR(BlockAIGear)) then {
			if (((_container isKindOf "CAManBase") && !(_container getVariable [QGVAR(isPlayer), false])) || ((_secondaryContainer isKindOf "CAManBase") && (_secondaryContainer getVariable [QGVAR(isPlayer), false]))) then {
				true
			};
		} else {
			false
		};
	}];
}] call CBA_fnc_addEventHandler;

[QGVAR(update), {
	[{
		[] call FUNC(simpleRoster);
	}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(mapLoaded), {
	if !(didJip) then {
//		[QGVAR(update), []] call CBA_fnc_globalEvent;
		[QGVAR(update), []] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(disableAICommand), {
	params ["_unit"];
	private _grp = (group _unit);
	_unit setVariable [QGVAR(disableAI_Path), true, true];
	_unit disableAI "PATH";
	_unit disableAI "MINEDETECTION";
//	_unit disableAI "TEAMSWITCH";

//	_unit disableAI 'SUPPRESSION';
//	_unit disableAI 'AUTOCOMBAT';			// AI run another FSM when in combat, this may reduce the calculations
//	_unit disableAI 'CHECKVISIBLE';			// Raycasting takes up a lot of CPU time, this will sharply reduce.
	_unit disableAI 'COVER';				// should disable some expensive cover calculations
//	_unit disableAI 'FSM';					// Will make the AI very dumb, and reduce some calculations. they may not shoot.
	_unit setSkill ['spotDistance',0.5];	// Reduce the distance at which AI can see enemy, reducing their calculations.
	_unit setBehaviour 'SAFE';				// Get the unit out of combat mode so some of the above can take effect.

	doStop _unit;
	_grp enableAttack false;

	if (_unit getVariable QGVAR(Fortify)) then {
		[_unit] execFSM "modules\common\ai_bunker.fsm";
	} else {
		if ((leader _grp) isEqualTo (leader _unit)) then {
			[_grp] call CBA_fnc_clearWaypoints;
			_wp = _grp addWaypoint [(getposATL _unit), 0];
			_wp setWaypointType "GUARD";
			_wp setWaypointCombatMode "YELLOW";
			_wp setWaypointBehaviour "SAFE";
			_grp setCurrentWaypoint _wp;
		};
	};
}] call CBA_fnc_addEventHandler;

/*
AIAiming - shows vectors (lines) of AI aiming at known target
AIBrain - general informations about AI brain, combat mode and fsm state
AIDynamicError - shows value of dynamically calculated AI aiming error
AISkill - shows value of skill, plus global coefficients, as set by difficulty mode
AISuppression - shows value of suppression
AIDriving - Shows various information about AI driving and path in real time.

"AIAiming" diag_enable true;
"AIBrain" diag_enable true;
"AIDynamicError" diag_enable true;
"AISkill" diag_enable true;
"AISuppression" diag_enable true;
*/

[QGVAR(groupPerformance), {
	params ["_enable","_grp"];
	if !((_grp select {isPlayer _x}) isEqualTo []) exitWith {false};
	if (_enable) then {
		{
			_x disableAI "ALL";
			_x enableSimulationGlobal false;
			_x hideObjectGlobal true;
		} forEach _grp;
	} else {
		{
			_x enableAI "ALL";
			_x enableSimulationGlobal true;
			_x hideObjectGlobal false;
		} forEach _grp;
	};
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
[] spawn {
	while {true} do {
		{
			if (_x getVariable [QGVAR(groupEnabled), false]) then {
				["GW_Common_groupPerformance", [true, (units _x)]] call CBA_fnc_localEvent;
				_x setVariable [QGVAR(groupEnabled), true];
			} else {
				_x setVariable [QGVAR(groupEnabled), false];
				["GW_Common_groupPerformance", [false, (units _x)]] call CBA_fnc_localEvent;
			};
		} forEach (allGroups select {_x getVariable [QGVAR(disableAI_Path), false]});
		sleep 3;
	};
};
#endif
