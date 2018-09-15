#define	COMPONENT CORE
#define VERSION 1
#define CUSTOM_FOLDER Core\Framework\Functions
#include "script_Component.hpp"

LOG("postInit started");
if (isServer) then {
	LOG("Loading Server Variables");
	GVARMAIN(MACHINE) = "SERVER";

	if (call EFUNC(Common,isDevBuild)) then {
		LOG("devBuild started");
		{
			deleteVehicle _x;
		} forEach switchableUnits;
	} else {
		{
			_x disableAI "All";
		} forEach switchableUnits;
	};
};

if (hasInterface) then {
	LOG("Loading Player Variables");
//	disableRemoteSensors true;
	enableEnvironment true;
	setCompassOscillation [(rad 5), 0.1, 1];
	player addRating 100000;
	player disableConversation true;
//	player enableWeaponDisassembly false;	// 1.67	- breaks getIn?
	player setVariable ["BIS_noCoreConversations", true, true];
	player setVariable ["BIS_enableRandomization", false, true];
	player switchMove "AmovPknlMstpSlowWrflDnon";
	GVARMAIN(MACHINE) = str(player);
};

{
	[] call compile preprocessFileLineNumbers ("Modules\" + (_x select 0) +"\" + (_x select 1));
	LOG(FORMAT_1("Module postInit: %1", (_x select 0)));
} forEach GVARMAIN(postLoad);
LOG(FORMAT_1("Modules Settings: %1", (count GVARMAIN(postLoad))));
GVARMAIN(postLoad) = nil;

[{
	if (hasInterface) then {
		GVARMAIN(logModules) sort false;
		player createDiarySubject ["framework_diary","Modules Loaded"];
		{
			player createDiaryRecord ["framework_diary", [FORMAT_1("%1", (_x select 0)),
				FORMAT_3("Version: %2  by %1, <br/>Description: %3", (_x select 1), (_x select 2), (_x select 3))
			]];
		} forEach GVARMAIN(logModules);

		[{
			player createDiaryRecord ["framework_diary", ["Framework",
				"==============================================
				<br/>
				<br/>	Mission: "+(getText(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "Name"))+"
				<br/>	By: "+(getText(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "Author"))+"
				<br/>	Version: "+str(getNumber(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "version"))+"
				<br/>	File name: "+(missionName)+"
				<br/>
				<br/>	==============================================
				<br/>
				<br/>	Framework by: GuzzenVonLidl
				<br/>	Version: "+GVARMAIN(Version)+"
				<br/>
				<br/>	==============================================
				<br/>
				<br/>	Guerrillas of Liberation
				<br/>	Teamspeak: teamspeak.gol-clan.co.uk
				<br/>	Website: http://www.gol-clan.co.uk/
				<br/>	=============================================="
			]];
		}, []] call CBA_Fnc_execNextFrame;
	};
	LOG("Event mapLoaded");
	[QGVARMAIN(mapLoaded), []] call CBA_fnc_localEvent;
	[{
		["CBA_settingsInitializedDelayed", []] call CBA_fnc_localEvent;
	}, [], 0.1] call CBA_fnc_waitAndExecute;
}, []] call CBA_Fnc_execNextFrame;

["CBA_loadingScreenDone", {
	if (isMultiplayer && !(call EFUNC(Common,isDevBuild))) then {
		[{
			[] spawn {
				startLoadingScreen ["", "GW_loadingScreen"];

				_progress = 0;
				for "_i" from 1 to 1000 step 1 do {
					_progress = _progress + 0.001;
					progressLoadingScreen _progress;
					if (_i isEqualTo 55) then {
						uisleep 1;
					} else {
						if (_i isEqualTo 666) then {
							uisleep 2;
						} else {
							uisleep 0.005;
						};
					};
				};

				endLoadingScreen;
				cutText ["","BLACK IN",10];
			};
		}, [], 0.1] call CBA_fnc_waitAndExecute;
	};

	LOG("Event missionLoaded");
	[QGVARMAIN(missionLoaded), []] call CBA_fnc_localEvent;

	[{
		LOG("Event missionStarted");
		[QGVARMAIN(missionStarted), []] call CBA_fnc_localEvent;

		if (isServer) then {
			LOG("Loading Server Settings");
			private ["_LogicCenter","_moduleGroup"];
			_LogicCenter = createCenter sideLogic;
			_moduleGroup = createGroup _LogicCenter;

			GVARMAIN(Gamelogic) = createVehicle ["Land_Matches_F", [0,0,0], [], 0, "CAN_COLLIDE"];
			GVARMAIN(Gamelogic) enableSimulationGlobal false;
			GVARMAIN(Gamelogic) hideObjectGlobal true;
			publicVariable QGVARMAIN(Gamelogic);

			GVARMAIN(ZeuzModuleAdminLogged) = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"CAN_COLLIDE"];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Owner", "#adminLogged", true];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Name", "AdminZeus", true];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Addons", 3, true];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["Forced", 0, true];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["birdType", "", true];
			GVARMAIN(ZeuzModuleAdminLogged) setVariable ["showNotification", false, true];
			publicVariable QGVARMAIN(ZeuzModuleAdminLogged);

			[QGVARMAIN(serverReady), []] call CBA_fnc_localEvent;
		};

		if (hasInterface) then {
			if ((getPlayerUID player) in getArray(missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "AuthorUID")) then {
				[QGVARMAIN(AddAdmin), player] call CBA_fnc_localEvent;
			};
			[QGVARMAIN(playerReady), []] call CBA_fnc_localEvent;
		};

		if (CBA_isHeadlessClient) then {
			[QGVARMAIN(headlessReady), []] call CBA_fnc_localEvent;
		};
	}, [], 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

LOG("postInit finished");
