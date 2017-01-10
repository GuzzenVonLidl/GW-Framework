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
	enableEnvironment true;
	player setVariable ["BIS_noCoreConversations", true, true];
	player setVariable ["BIS_enableRandomization", false, true];

	GVARMAIN(logModules) sort false;
	player createDiarySubject ["framework_diary","Modules Loaded"];
	{
		player createDiaryRecord ["framework_diary", [FORMAT_1("%1", (_x select 0)),
			FORMAT_3("Version: %2  by %1, <br/>Description: %3", (_x select 1), (_x select 2), (_x select 3))
		]];
	} forEach GVARMAIN(logModules);
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

[{(getClientStateNumber >= 9) || !isMultiplayer}, {
	LOG("Event mapLoaded");
	if (isServer) then {
		publicVariable QGVARMAIN(Gamelogic);
		publicVariable QGVARMAIN(ZeuzModuleAdminLogged);
	};

	[QGVARMAIN(mapLoaded), []] call CBA_fnc_localEvent;
	if (hasInterface) then {
		private _framework = "==============================================
				<br/>
				<br/>	Framework by: GuzzenVonLidl
				<br/>	Version: "+GVARMAIN(Version)+"
				<br/>
				<br/>	==============================================
				<br/>
				<br/>	Guerrillas of Liberation
				<br/>	Teamspeak: teamspeak.gol-clan.co.uk
				<br/>	Website: http://www.gol-clan.co.uk/
				<br/>	==============================================";
		player createDiaryRecord ["Log", ["Framework",_framework]];
	};
}, []] call CBA_fnc_waitUntilAndExecute;

[{(getClientStateNumber >= 10) || !isMultiplayer}, {
	[{
		LOG("Event missionStarted");
		[QGVARMAIN(missionStarted), []] call CBA_fnc_localEvent;
		if ((getPlayerUID player) in (["GW_FRAMEWORK", "Naming", "AuthorUID"] call BIS_fnc_getCfgData)) then {
			[QGVARMAIN(AddAdmin), player] call CBA_fnc_serverEvent;
		};
	}, [], 0.5] call CBA_fnc_waitAndExecute;
	if (hasInterface) then {
		[{
			cutText ["Finalizing Settings","BLACK FADED",10];
			GVARMAIN(blockMovement) = player addeventhandler ["animChanged",{player switchMove "AmovPercMstpSnonWnonDnon_Ease";}];
		}, [], 0.1] call CBA_fnc_waitAndExecute;
		[{
			if !(isNil QGVARMAIN(blockMovement)) then {
				player removeEventHandler ["animChanged", GVARMAIN(blockMovement)];
			};
			player playMoveNow "AmovPercMstpSnonWnonDnon_EaseOut";
			player playMoveNow "AmovPknlMstpSlowWrflDnon";
			cutText ["","BLACK IN",10];
		}, [], 5] call CBA_fnc_waitAndExecute;
	};
}, []] call CBA_fnc_waitUntilAndExecute;

LOG("postInit finished");
