/*
	Author: GuzzenVonLidl
	Spawns in a group of civilians in a area and will patrol it to create a semi ambient life

	Usage:
	["marker_3", 50] call GW_effects_fnc_agentHandler;

	Arguments:
	0: Marker Name <STRING>
	1: Amount to spawn <NUMBER>

	Return Value: NO

	Public: No

*/
#include "script_Component.hpp"

params ["_marker","_count"];

while {GVAR(ambientLife)} do {
	_toDelete = [];
	{
		_x params ["_agent"];
		if (alive _agent) then {
			if (moveToCompleted _agent) then {
				if (_agent getVariable ["doPatrol", true]) then {
					_newPos = [(_agent getVariable "MarkerWP")] call EFUNC(Common,getRandPos);
					_agent moveTo _newPos;
				} else {
					if !(_agent getVariable ["isSafe", true]) then {
						_agent setVariable ["isSafe", true];
						_agent setUnitPos (selectRandom ["UP","UP","Middle"]);

						[{(speed _this) isEqualTo 0}, {
							if (alive _this) then {
								_this enableSimulationGlobal false;
							};
						}, _agent, 5, {
							if (alive _this) then {
								_this enableSimulationGlobal false;
							};
						}] call CBA_fnc_waitUntilAndExecute;
					};
				};
			};
		} else {
			_toDelete pushBack _agent;
		};
	} forEach GVAR(AllAgents);

	if !(_toDelete isEqualTo []) then {
		GVAR(AllAgents) = (GVAR(AllAgents) - _toDelete);
	};
	sleep 1;
};
