#include "scriptComponent.hpp"

PREP(displayText);
PREP(startText);
PREP(weaponLock);

GVAR(TimeLimit) = 5;
GVAR(Enabled) = true;
GVAR(autoProtection) = true;

[QGVAR(Enabled), {
	TRACE_1("QGVAR(Enabled)", _this);
	_this call FUNC(WeaponLock);
}] call CBA_fnc_addEventHandler;

[QGVAR(Time), {
	TRACE_1("QGVAR(Time)", _this);
	_this call FUNC(displayText);
}] call CBA_fnc_addEventHandler;

[
	QGVAR(TimeLimit), "LIST",
	["Starting Protection", "Disables all weapons during the first minutes of the mission"],
	QUOTE(ADDON), [[-1,1,3,5,10,15,20], ["Disabled","1 Min","3 Min","5 Min","10 Min","15 Min","20 Min"], 3], false
] call FUNCMAIN(settingsInit);

/*
[
	QGVAR(autoProtection), "LIST",
	["Protection Area", "Always activeates protection when in the area"],
	QUOTE(ADDON), [[0,1,2], ["Disabled","Respawn position","Airbase"], 0], false
] call FUNCMAIN(settingsInit);
*/
