/*
	Author: GuzzenVonLidl
	Spawns in a group of civilians in a area and will patrol it to create a semi ambient life

	Usage:
	["marker_3", 50] call GW_effects_fnc_createAgent;

	Arguments:
	0: Marker Name <STRING>
	1: Amount to spawn <NUMBER>

	Return Value: NO

	Public: No

*/
#include "script_Component.hpp"

params ["_marker","_count"];

for "_i" from 1 to _count step 1 do {
	_spawnLocation = [_marker] call EFUNC(Common,getRandPos);
//	[_spawnLocation,"ColorBlack"] call EFUNC(Common,createMarker);
	_agent = createAgent [selectRandom ["C_Man_casual_4_F", "C_Man_casual_5_F", "C_Man_casual_6_F"], _spawnLocation, [], 0, "FORM"];

	_agent disableAI "AIMINGERROR";
	_agent disableAI "AUTOCOMBAT";
	_agent disableAI "AUTOTARGET";
	_agent disableAI "CHECKVISIBLE";
	_agent disableAI "COVER";
	_agent disableAI "FSM";
	_agent disableAI "MINEDETECTION";
	_agent disableAI "SUPPRESSION";
	_agent disableAI "TARGET";
	_agent disableAI "WEAPONAIM";

	_agent setSkill 0;
	_agent setBehaviour "CARELESS";

	_moveLocation = [_marker] call EFUNC(Common,getRandPos);
	_agent moveTo _moveLocation;
	_agent forceSpeed (_agent getSpeed "SLOW");

	_agent addEventHandler ["Killed", {
		params ["_agent"];
		_agent enableSimulationGlobal true;
		_agent removeEventHandler ["FiredNear", (_agent getVariable "TestIndex")];
	}];

	_index = _agent addEventHandler ["FiredNear", {
		params ["_agent","_vehicle","_distance"];
		if (_agent getVariable ["isSafe", true]) then {
			if !(simulationEnabled _agent) then {
				_agent enableSimulationGlobal true;
			};
			(_agent call CBA_fnc_getNearestBuilding) params ["_building","_index"];
			_newPos = (_building buildingPos floor(random _index));
			_agent moveTo _newPos;
			_agent forceSpeed (_agent getSpeed "FAST");
			_agent setVariable ["isSafe", false];
			_agent setVariable ["doPatrol", false];	// Disable patrol
		};
	}];

	_agent setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_agent setVariable ["MarkerWP",_marker];
	_agent setVariable ["TestIndex",_index];
	_agent setVariable ["isSafe", true];
	_agent setVariable ["doPatrol", true];
	GVAR(AllAgents) pushBack _agent;
};

if !(GVAR(ambientLife)) then {
	GVAR(ambientLife) = true;
	[] spawn FUNC(agentHandler);
};
