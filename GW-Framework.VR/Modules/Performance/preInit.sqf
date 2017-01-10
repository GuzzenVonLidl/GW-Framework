#include "scriptComponent.hpp"

PREP(HandlerCleanUp);
PREP(HandlerKilled);
PREP(Simulation);

GVAR(Simulation) = true;			//	Removes lag from spawning units
GVAR(Delay) = 60;					//	Delay between each loop for removing objects

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

[QGVAR(removeGroup), {
	deleteGroup _this;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(missionStarted), {
	[{
		if (isServer && (isNil QGVAR(CleanUp_PFH))) then {
			GVAR(CleanUp_PFH) = [{
				if (GVAR(Enabled)) then {
					[] call FUNC(HandlerCleanUp);
				};
			}, GVAR(Delay), []] call CBA_fnc_addPerFrameHandler;
		};

		if ((count EGVAR(headlessController,headlessList)) > 0) then {
			if (isServer) then {
				setViewDistance 750;
				setTerrainGrid 50;
			};
			if (CBA_isHeadlessClient) then {
				setViewDistance 1500;
				setTerrainGrid 25;
			};
		} else {
			if (isServer) then {
				setViewDistance 1500;
				setTerrainGrid 25;
			};
		};
	}, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
