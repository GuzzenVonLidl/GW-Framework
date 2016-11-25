#include "scriptComponent.hpp"

PREP(HandlerKilled);
PREP(HandlerCleanUp);
PREP(HandlerAdjustFPS);
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
	["Dynamic viewDistance (DVD)", "Automatically adjust view distance based on frame rate"],
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false, {}, "client"
] call FUNCMAIN(settingsInit);

[
	QGVAR(AvgTargetDistance), "SLIDER",
	["Target FPS (DVD)", "viewDistance will automaticly be changed to keep avg with a 5 fps diff"],
	QUOTE(ADDON), [20, 50, 25, 0], false, {}, "client"
] call FUNCMAIN(settingsInit);

[QGVARMAIN(missionStarted), {
	[{
		if (isServer && GVAR(Enabled)) then {
			[{
				[] call FUNC(HandlerCleanUp);
			}, 5, []] call CBA_fnc_addPerFrameHandler;
		};

		if ((count EGVAR(headlessController,headlessList)) > 0) then {
			if (isServer) then {
				setViewDistance 500;
				setTerrainGrid 50;
			};
			if (CBA_isHeadlessClient) then {
				setViewDistance 1500;
				setTerrainGrid 25;
			};
		};

		if (hasInterface) then {
			[{
				if (GVAR(EnabledDistance)) then {
					[] call FUNC(HandlerAdjustFPS);
				};
			}, 0.1, []] call CBA_fnc_addPerFrameHandler;
		};
	}, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
