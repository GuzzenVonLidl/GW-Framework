#define	COMPONENT CORE
#define VERSION 1
#define CUSTOM_FOLDER Core\Framework\Functions
#include "scriptComponent.hpp"

LOG("postInit started");
if (isServer) then {
	LOG("Loading Server Variables");
	GVARMAIN(MACHINE) = "SERVER";
} else {
	if (isNil QGVARMAIN(Gamelogic)) then {
		ERROR("ISNIL Gamelogic");
	};
	if (isNil QGVARMAIN(ZeuzModuleAdminLogged)) then {
		ERROR("ISNIL ZeuzModuleAdminLogged");
	};
	GVARMAIN(MACHINE) = str(player);
};

if (hasInterface) then {
	LOG("Loading Player Variables");
	player addRating 100000;
	player disableConversation true;
//	disableRemoteSensors true;
	enableEnvironment false;
	player setVariable ["BIS_noCoreConversations", true, true];
	player setVariable ["BIS_enableRandomization", false, true];

	GVARMAIN(logModules) sort false;
	player createDiarySubject ["framework_diary","Modules Loaded"];
	{
		player createDiaryRecord ["framework_diary", [FORMAT_1("%1", (_x select 0)),
			FORMAT_3("Version: %2  by %1, <br/>Description: %3", (_x select 1), (_x select 2), (_x select 3))
		]];
	} forEach GVARMAIN(logModules);

	GVARMAIN(RealSide) = switch (GETSIDE(player)) do {
		case 0: {
			"east";
		};
		case 1: {
			"West";
		};
		case 2: {
			"Independent";
		};
		case 3: {
			"Civilian";
		};
	};
};

{
	[] call compile preprocessFileLineNumbers ("Modules\" + (_x select 0) +"\" + (_x select 1));
	LOG(FORMAT_1("Module postInit: %1", (_x select 0)));
} forEach GVARMAIN(postLoad);
LOG(FORMAT_1("Modules Settings: %1", (count GVARMAIN(postLoad))));
GVARMAIN(postLoad) = nil;

if (DEVBUILD) then {
	LOG("devBuild started");
	{
		deleteVehicle _x;
	} forEach switchableUnits;

	if !(isNil "GW_Menu_fnc_mapMonitor_Handler") then  {
		[2] call GW_Menu_fnc_mapMonitor_Handler;
	};
	if !(isNil "GW_Menu_fnc_serverfps") then  {
		[5] spawn GW_Menu_fnc_serverfps;
	};
} else {
	{
		private _unit = _x;
		if !(isPlayer _unit) then {
			{
				_unit disableAI _x;
			} forEach ["Path","TARGET","AUTOTARGET","ANIM","FSM","CHECKVISIBLE"];
		};
	} forEach switchableUnits;
};

[{(getClientStateNumber isEqualTo 9) || !isMultiplayer}, {
	LOG("Event mapLoaded");
	[QGVARMAIN(mapLoaded), []] call CBA_fnc_localEvent;
	if (isServer) then {
		publicVariable QGVARMAIN(Gamelogic);
		publicVariable QGVARMAIN(ZeuzModuleAdminLogged);
	};

	[{(getClientStateNumber >= 10) || !isMultiplayer}, {
		LOG("Event missionStarted");
		[QGVARMAIN(missionStarted), []] call CBA_fnc_localEvent;
		if ((getPlayerUID player) in (["GW_FRAMEWORK", "Naming", "AuthorUID"] call BIS_fnc_getCfgData)) then {
			[QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent;
		};
	}, []] call CBA_fnc_waitUntilAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;

LOG("postInit finished");
