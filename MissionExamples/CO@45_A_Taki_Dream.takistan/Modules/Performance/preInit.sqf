#include "scriptComponent.hpp"

PREP(clearGroups);
PREP(clearLoop);
PREP(clearObjects);
PREP(clearTriggers);
PREP(getFps);
PREP(HandlerKilled);
PREP(HandleDistance);
PREP(setDistance);
PREP(Simulation);

GVAR(Enabled) = true;				//	Enable removal of most things for performance
GVAR(UnitEnabled) = true;			//	Remove equipment from unit
GVAR(Simulation) = true;			//	Removes lag from spawning units
GVAR(Delay) = 60;					//	Delay between each loop for removing objects

GVAR(EnabledDistance) = false;
GVAR(getAvgFPS) = [];

if (isServer) then {
	["CAManBase", "init", {
		_this call FUNC(Simulation);
	}] call CBA_fnc_addClassEventHandler;
};

["CAManBase", "KILLED", {
	_this call FUNC(HandlerKilled);
}] call CBA_fnc_addClassEventHandler;

[
	QGVAR(Enabled), "LIST",
	["Enable clean up", "Toggle clean up"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(UnitEnabled), "LIST",
	["Gear removal", "Remove all equipment from dead unit execpt for uniform"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(EnabledDistance), "LIST",
	["Dynamic viewDistance", "Warning: Experimental!"],
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false, {
		params ["_value"];
		[_value] call FUNC(HandleDistance);
	}, "client"
] call FUNCMAIN(settingsInit);

[QGVARMAIN(missionStarted), {
	[{
		if ((count EGVAR(headlessController,headlessList)) > 0) then {
			if (isServer) then {
				setViewDistance 500;
				setTerrainGrid 0;
			};
			if (CBA_isHeadlessClient) then {
				setViewDistance 1500;
				setTerrainGrid 25;
			};
		};
		if (isServer && GVAR(Enabled)) then {
			[] call FUNC(clearLoop);
		};
	}, [], GVAR(Delay)] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
