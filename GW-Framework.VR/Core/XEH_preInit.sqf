#include "script_Component.hpp"

LOG("Prepping all main functions");
PREPMAIN(changeSetting);
PREPMAIN(Log);
PREPMAIN(LogAdmin);
PREPMAIN(remoteCommand);
PREPMAIN(settingsInit);
PREPMAINFOLDER(spawnList);

LOG("Prepping all main variables");
enableSaving [false, false];
enableEngineArtillery false;
enableSentences false;
enableRadio false;
enableTeamSwitch false;
useAISteeringComponent true;
enableWeaponDisassembly false;
0 fadeRadio 0;
//	enableSatNormalOnDetail true;		//	<--------

GVARMAIN(settings3denArray) = [];
GVARMAIN(Version) = (["GW_FRAMEWORK", "Core", "Version"] call BIS_fnc_getCfgData);

// Get addon/mod/dlc availability from the A3 config file and store them in easy to use variables
GVARMAIN(DLC_Bundle) 	= isClass (configFile >> "CfgMods" >> "DLCBundle");
GVARMAIN(DLC_MarksMan) 	= isClass (configFile >> "CfgMods" >> "Mark");
GVARMAIN(DLC_Heli) 		= isClass (configFile >> "CfgMods" >> "Heli");

GVARMAIN(mod_ACE3) 			= isClass (configFile >> "CfgPatches" >> "ACE_Common");
GVARMAIN(mod_ACE3_Medical)	= isClass (configFile >> "CfgPatches" >> "ACE_Medical");
GVARMAIN(mod_ACRE) 			= isClass (configFile >> "CfgPatches" >> "ACRE_Main");
GVARMAIN(mod_AIA)	 		= isClass (configFile >> "CfgPatches" >> "AiA_Core");
GVARMAIN(mod_GW)			= isClass (configFile >> "CfgPatches" >> "GW_Main");
GVARMAIN(mod_CUP_TERRAINS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_WEAPONS)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CUP_VEHICLES)	= isClass (configFile >> "CfgPatches" >> "CUP_BaseConfig_F");
GVARMAIN(mod_CBA) 			= isClass (configFile >> "CfgPatches" >> "CBA_Main");
GVARMAIN(mod_CTAB) 			= isClass (configFile >> "CfgPatches" >> "cTab");
GVARMAIN(mod_RHS)	 		= isClass (configFile >> "CfgPatches" >> "RHS_Main");
GVARMAIN(mod_TFAR) 			= isClass (configFile >> "CfgPatches" >> "Task_Force_Radio");
GVARMAIN(mod_TFAR_CORE) 	= isClass (configFile >> "CfgPatches" >> "TFAR_Core");

if (is3DEN) then {
	if !(GVARMAIN(mod_GW)) exitWith {
		["ADDON is not loaded, Exiting Framework","WARNING"] spawn BIS_fnc_3DENShowMessage;
	};
	if (GVARMAIN(mod_GW) && ((getNumber (configFile >> "CfgPatches" >> "GW_Main" >> "version")) < 0.6)) exitWith {
		["ADDON And Framework versions are not compatible!   Exiting Framework","WARNING"] spawn BIS_fnc_3DENShowMessage;
	};
};

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
	_Authors = getArray( _config >> "authors");
	_Version = getNumber( _config >> "version");
	_preInit = getText( _config >> "preInit");
	_postInit = getText( _config >> "postInit");
	_Description = getText( _config >> "description");
	_requiredModules = getArray( _config >> "requiredModules");
	_requiredAddon = getArray( _config >> "requiredAddon");

	{
		if !(isClass ((missionConfigFile >> "GW_Modules" >> _x))) then {
			_preInit = "";
			_postInit = "";
			ERROR(FORMAT_2("Warning! %1 is Missing Module: %2",_Name, _x));
		};
	} forEach _requiredModules;

	{
		if !(isClass (configFile >> "CfgPatches" >> _x)) then {
			_preInit = "";
			_postInit = "";
			ERROR(FORMAT_2("Warning! %1 is Missing Addon: %2",_Name, _x));
		};
	} forEach _requiredAddon;

	if !(_preInit isEqualTo "") then {
		[] call compile preprocessFileLineNumbers ("Modules\" + configName(_x) +"\" + _preInit);
	};

	if !(_postInit isEqualTo "") then {
		GVARMAIN(postLoad) pushback [configName(_x), _postInit];
	};

	if ((count _Authors) isEqualTo 1) then {
		_Authors = format ["%1", (_Authors select 0)];
	} else {
		private _str = "";
		{
			if (_forEachIndex isEqualTo 0) then {
				_str = format ["%1", _x];
			} else {
				_str = (_str + (format [", %1", _x]));
			};
		} forEach _Authors;
		_Authors = _str;
	};

	GVARMAIN(logModules) pushback [_Name, _Authors, _Version, _Description];
	TRACE_3("Module Loaded", _Name, _Authors, _Version);
} forEach _Modules;

LOG(FORMAT_1("Modules Loaded: %1", (count GVARMAIN(logModules))));

LOG("preInit finished");
