/*
	Author: GuzzenVonLidl
	Handles execution for things in 3den editor
	Moved to seperate file for easier management

	Usage:
	["init"] call GW_Fnc_init3DEN;

	Arguments:
	0: Switch <STRING>

	Return Value:NO

	Public: NO

*/
#include "..\scriptComponent.hpp"
params ["_switch"];

switch (_switch) do {
	case "init": {
		private _3denArray = [];
		private _allPlayers = {((_x get3DENAttribute "ControlMP") select 0) || ((_x get3DENAttribute "ControlSP") select 0)} count ((all3DENEntities select 0) + (all3DENEntities select 3));
		private _gamemode = (["GW_FRAMEWORK", "Naming", "GameMode"] call BIS_fnc_getCfgData);
		private _name = (["GW_FRAMEWORK", "Naming", "Name"] call BIS_fnc_getCfgData);

		if (_gamemode isEqualTo "") then {
			ERROR("GameMode in description is empty");
		};
		if (_allPlayers isEqualTo 0) then {
//			ERROR("No playable units in this mission");
		};
		if (_name isEqualTo "") then {
			ERROR("Name in description is empty");
		};
		if !((_name isEqualTo "") && (_gamemode isEqualTo "") && (_allPlayers isEqualTo 0)) then {
			private _compile = (format ["%1@%2 %3", _gamemode, _allPlayers, _name]);
			TRACE_1("Cfg Settings", _compile);
			_3denArray pushBack ["Scenario","IntelBriefingName", _compile];
		} else {
			ERROR("Mission name failed");
		};

		{
			private _cfg = (_x select 2);
			if (_x select 3) then {	// read from configs
				_cfg = (["GW_FRAMEWORK", "Naming", (_x select 2)] call BIS_fnc_getCfgData);
				TRACE_2("Cfg Settings", (_x select 2), _cfg);
			};
			if !(_cfg isEqualTo "") then {
				_3denArray pushBack [(_x select 0), (_x select 1), _cfg];
			};
		} forEach [
			["Scenario", "Author", "Author", true],
			["Scenario", "OverviewText", "Description", true],
			["Scenario", "LoadScreen", "Picture", true],
			["Scenario", "OnLoadMission", "onLoad", true],
			["Multiplayer", "GameType", _gamemode, false],
			["Multiplayer", "MaxPlayers", _allPlayers, false]
		];

		if !((count _3denArray) isEqualTo 0) then {
			set3DENMissionAttributes _3denArray;
		};
		LOG("Mission Saved");
	};

	case "reconfigure": {
		private _3denArray = [];
		{
			_3denArray pushBack [(_x select 0), (_x select 1), (_x select 2)];
		} forEach [
			["Multiplayer", "MinPlayers", 1],
			["Multiplayer", "DisabledAI", true],
			["Multiplayer", "JoinUnassigned", true],
			["Multiplayer", "Respawn", 3],
			["Multiplayer", "RespawnDelay", 30],
			["Multiplayer", "RespawnDialog", false],
			["Multiplayer", "EnableTeamSwitch", false],
			["Multiplayer", "AIKills", false]
		];
		set3DENMissionAttributes _3denArray;

		{
			TRACE_1("CBA Settings", _x);
			[_x, (_x call CBA_settings_fnc_get), true, "mission"] call CBA_settings_fnc_set;
		} forEach GVARMAIN(settings3denArray);
	};
	case "": {
	};
};
