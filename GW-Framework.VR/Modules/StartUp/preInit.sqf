#include "scriptComponent.hpp"

PREP(startText);
PREP(weaponLock);

GVAR(TimeLimit) = 5;
GVAR(Enabled) = true;
GVAR(autoProtection) = true;
GVAR(DistanceLimit) = false;

[QGVAR(Enabled), {
	TRACE_1("QGVAR(Enabled)", _this);
	_this call FUNC(WeaponLock);
}] call CBA_fnc_addEventHandler;

[QGVAR(Time), {
	if (hasInterface) then {
		params["_number"];
		TRACE_1("QGVAR(Time)", _number);
		if (_number isEqualTo -1) then {
			systemChat "SAFE START: Weapons are now active";
		} else {
			systemChat format ["SAFE START: Time Remaining until weapons are live: %1 min", _number];
		};
	};
}] call CBA_fnc_addEventHandler;

[
	QGVAR(TimeLimit), "LIST",
	["Starting Protection", "Disables all weapons during the first minutes of the mission"],
	QUOTE(ADDON), [[-1,1,3,5,10,15,20], ["Disabled","1 Min","3 Min","5 Min","10 Min","15 Min","20 Min"], 3], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(DistanceLimit), "LIST",
	["Removing Protection", "Remove weapon safety when player moves from respawn location"],
	QUOTE(ADDON), [[-1,25,50,100], ["Disabled","25 Meters","50 Meters","100 Meters"], 2], false
] call FUNCMAIN(settingsInit);

/*
[
	QGVAR(autoProtection), "LIST",
	["Protection Area", "Always activeates protection when in the area"],
	QUOTE(ADDON), [[0,1,2], ["Disabled","Respawn position","Airbase"], 0], false
] call FUNCMAIN(settingsInit);
*/
