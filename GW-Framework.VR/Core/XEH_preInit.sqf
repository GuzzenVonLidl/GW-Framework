#include "scriptComponent.hpp"

if (DEVCONSOLEENABLED) then {
	switch ((["GW_FRAMEWORK", "Core", "ClearConsole"] call BIS_fnc_getCfgData)) do {	// Clean page
		case 1: {
			if !(is3DEN) then {
				DEVCONSOLE("C");
			};
		};
		case 2: {
			if (is3DEN) then {
				DEVCONSOLE("C");
			};
		};
		case 3: {
			DEVCONSOLE("C");
		};
	};

	if (isMultiplayer && !isDedicated) then {
		DEVCONSOLE("X");
	};
};

PREPMAIN(Log);
PREPMAIN(LogAdmin);
PREPMAIN(remoteCommand);
PREPMAIN(settingsInit);
PREPMAINFOLDER(spawnList);

GW_fnc_Dummy = {};

LOG("Main functions have been Prepared");

LOG("Prepping all main variables");
enableSaving [false, false];
enableEngineArtillery false;
enableSentences false;
enableRadio false;
enableTeamSwitch false;
0 fadeRadio 0;
//	enableEnvironment false;			//	<--------
//	enableSatNormalOnDetail true;		//	<--------

GVARMAIN(isActiveAdmin) = false;
GVARMAIN(activeAdmins) = [];
GVARMAIN(adminList) = ["_SP_PLAYER_", GUZZENVONLIDL, R4IDER, OKSMAN, CHRIS, BENY];
GVARMAIN(settings3denArray) = [];

// Get addon/mod/dlc availability from the A3 config file and store them in easy to use variables
GVARMAIN(DLC_Bundle) 	= isClass (configFile >> "CfgMods" >> "DLCBundle");
GVARMAIN(DLC_MarksMan) 	= isClass (configFile >> "CfgMods" >> "Mark");
GVARMAIN(DLC_Heli) 		= isClass (configFile >> "CfgMods" >> "Heli");

GVARMAIN(mod_ACE3) 			= isClass (configFile >> "CfgPatches" >> "ACE_Common");
GVARMAIN(mod_ACE3_Medical)	= isClass (configFile >> "CfgPatches" >> "ACE_Medical");
GVARMAIN(mod_ACRE) 			= isClass (configFile >> "CfgPatches" >> "ACRE_Main");
GVARMAIN(mod_AIA)	 		= isClass (configFile >> "CfgPatches" >> "AiA_Core");
GVARMAIN(mod_CUP_TERRAINS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_WEAPONS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_VEHICLES)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CBA) 			= isClass (configFile >> "CfgPatches" >> "CBA_Main");
GVARMAIN(mod_CTAB) 			= isClass (configFile >> "CfgPatches" >> "cTab");
GVARMAIN(mod_RHS)	 		= isClass (configFile >> "CfgPatches" >> "RHS_Main");
GVARMAIN(mod_TFAR) 			= isClass (configFile >> "CfgPatches" >> "Task_Force_Radio");

LOG("Prepping modules");
#define CORE_Modules (missionConfigFile >> "GW_Modules")
private ["_Modules","_postLoad"];
_Modules = [];
GVARMAIN(logModules) = [];
GVARMAIN(postLoad) = [];

for "_i" from 0 to ((count CORE_Modules) - 1) step 1 do {
	_Modules pushBack (CORE_Modules select _i);
};

{
	private ["_config","_Name","_Authors","_Version","_preInit","_postInit","_Description","_requiredModules"];
	_config = (missionConfigFile >> "GW_Modules" >> configName(_x));
	_Name = getText( _config >> "name");
	_Authors = getText( _config >> "authors");
	_Version = getNumber( _config >> "version");
	_preInit = getText( _config >> "preInit");
	_postInit = getText( _config >> "postInit");
	_Description = getText( _config >> "description");
	_requiredModules = getArray( _config >> "requiredModules");

	{
		if !(isClass ((missionConfigFile >> "GW_Modules" >> _x))) then {
			_preInit = "";
			_postInit = "";
			ERROR(FORMAT_2("Warning! %1 is Missing Module: %2",_Name, _x));
		};
	} forEach _requiredModules;

	if !(_preInit isEqualTo "") then {
		[] call compile preprocessFileLineNumbers ("Modules\" + configName(_x) +"\" + _preInit);
	};

	if !(_postInit isEqualTo "") then {
		GVARMAIN(postLoad) pushback [configName(_x), _postInit];
	};

	GVARMAIN(logModules) pushback [_Name, _Authors, _Version, _Description];
	TRACE_3("Module Loaded", _Name, _Authors, _Version);
} forEach _Modules;

LOG(FORMAT_1("Modules Loaded: %1", (count GVARMAIN(logModules))));

if (isServer) then {
	LOG("Loading Server Settings");
	private ["_LogicCenter","_moduleGroup","_module"];
	_LogicCenter = createCenter sideLogic;
	_moduleGroup = createGroup _LogicCenter;
	GVARMAIN(Gamelogic) = "Land_Matches_F" createVehicle [0,0,0];
	GVARMAIN(Gamelogic) enableSimulationGlobal false;
	GVARMAIN(Gamelogic) hideObjectGlobal true;
	publicVariable QGVARMAIN(Gamelogic);
	GVARMAIN(ZeuzModuleAdminLogged) = _moduleGroup createUnit["ModuleCurator_F",[0,0,0],[],0,"NONE"];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Owner", "#adminLogged", true];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Name", "AdminZeus", true];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Addons", 3, true];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Forced", 0, true];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["birdType", "", true];
	GVARMAIN(ZeuzModuleAdminLogged) setVariable ["showNotification", false, true];
	publicVariable QGVARMAIN(ZeuzModuleAdminLogged);

	[] call GW_Fnc_spawnList;
};

if (is3DEN) then {
	if (((["GW_FRAMEWORK", "Core", "ResetSettings"] call BIS_fnc_getCfgData) isEqualTo -2) ) then {
		{
			TRACE_1("CBA Settings", _x);
			[_x, (_x call CBA_settings_fnc_get), true, "mission"] call CBA_settings_fnc_set;
		} forEach GVARMAIN(settings3denArray);
	};

	add3DENEventHandler ["OnMissionSave",{
		removeAll3DENEventHandlers "OnMissionSave";
		if (isClass (missionConfigFile >> "GW_FRAMEWORK")) then {
			[] call compile preprocessFileLineNumbers "core\XEH_preInit.sqf";
			LOG("XEH_preInit reloaded");
		};
	}];

	add3DENEventHandler ["OnMessage",{
		if (isClass (missionConfigFile >> "GW_FRAMEWORK")) then {
			removeAll3DENEventHandlers "OnMessage";
			params ["_message"];
			if (_message isEqualTo 6) then {	// Export

				private _3denArray = [];
				private _allPlayers = {((_x get3DENAttribute "ControlMP") select 0) || ((_x get3DENAttribute "ControlSP") select 0)} count ((all3DENEntities select 0) + (all3DENEntities select 3));
				private _gamemode = (["GW_FRAMEWORK", "Naming", "GameMode"] call BIS_fnc_getCfgData);
				private _name = (["GW_FRAMEWORK", "Naming", "Name"] call BIS_fnc_getCfgData);

				if (_gamemode isEqualTo "") then {
					ERROR("GameMode in description is empty");
				};
				if (_allPlayers isEqualTo 0) then {
					ERROR("No playable units in this mission");
				};
				if (_name isEqualTo "") then {
					ERROR("Name in description is empty");
				};
				if !((_name isEqualTo "") && (_gamemode isEqualTo "") && (_allPlayers isEqualTo 0)) then {
					private _compile = (format ["%1@%2 %3", _gamemode, _allPlayers, _name]);
					TRACE_1("Cfg Settings", _compile);
					_3denArray pushBack ["Scenario","IntelBriefingName", _compile];
				} else {
					ERROR("Mission failed Exported");
				};

				{
					private _cfg = (_x select 2);
					if !(_x select 3) then {
						_cfg = (["GW_FRAMEWORK", "Naming", (_x select 2)] call BIS_fnc_getCfgData);
						TRACE_2("Cfg Settings", (_x select 2), _cfg);
					};
					if !(_cfg isEqualTo "") then {
						_3denArray pushBack [(_x select 0), (_x select 1), _cfg];
					};
				} forEach [
					["Scenario", "Author", "Author", false],
					["Scenario", "OverviewText", "Description", false],
					["Scenario", "LoadScreen", "Picture", false],
					["Scenario", "OnLoadMission", "onLoad", false],
					["Multiplayer", "GameType", _gamemode, true],
					["Multiplayer", "GameType", _allPlayers, true]
				];

				if !((count _3denArray) isEqualTo 0) then {
					set3DENMissionAttributes _3denArray;
				};
				LOG("Mission Exported");
			};
		};
	}];
};

LOG("preInit finished");
