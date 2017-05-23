#include "scriptComponent.hpp"

PREP(HandlerCleanUp);
PREP(HandlerCleanUpCounter);
PREP(HandlerKilled);
PREP(Simulation);

GVAR(Simulation) = true;			//	Removes lag from spawning units
GVAR(Delay) = 60;					//	Delay between each loop for removing objects

[
	QGVAR(Enabled), "LIST",
	["Enable clean up", "Toggle clean up"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], true
] call FUNCMAIN(settingsInit);

[
	QGVAR(UnitEnabled), "LIST",
	["Gear removal", "Remove all equipment from dead unit execpt for uniform"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], true
] call FUNCMAIN(settingsInit);
