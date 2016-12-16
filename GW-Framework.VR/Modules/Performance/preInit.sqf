#include "scriptComponent.hpp"

PREP(HandlerAdjustFPS);
PREP(HandlerCleanUp);
PREP(HandlerKilled);
PREP(Simulation);

GVAR(Simulation) = true;			//	Removes lag from spawning units
GVAR(Delay) = 60;					//	Delay between each loop for removing objects

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
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false, {
		[QGVAR(EnableDynamicViewDistance), _this] call CBA_fnc_LocalEvent;
	}, "client"
] call FUNCMAIN(settingsInit);

[
	QGVAR(AvgTargetDistance), "SLIDER",
	["Target FPS (DVD)", "viewDistance will automaticly be changed to keep avg with a 5 fps diff"],
	QUOTE(ADDON), [20, 50, 25, 0], false, {}, "client"
] call FUNCMAIN(settingsInit);

[QGVAR(removeGroup), {
	deleteGroup _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(EnableDynamicViewDistance), {
	params ["_enable"];
	if (time >= 5) then {
		if (_enable && (isNil QGVAR(viewDistance_PFH))) then {
			GVAR(viewDistance_PFH) = [{
				[] call FUNC(HandlerAdjustFPS);
			}, 0.1, []] call CBA_fnc_addPerFrameHandler;
		} else {
			[GVAR(viewDistance_PFH)] call CBA_fnc_removePerFrameHandler;
			GVAR(viewDistance_PFH) = nil;
		};
	} else {
		[{
			[QGVAR(EnableDynamicViewDistance), _this] call CBA_fnc_LocalEvent;
		}, _this, 5] call CBA_fnc_waitAndExecute;
	};
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
