#include "scriptComponent.hpp"

PREP(addToCurators);
PREP(buildingPop);
PREP(createGroup);
PREP(createUnits);
PREP(findAverage);
PREP(getGroupType);
PREP(GetPosASL);
PREP(GetPosATL);
PREP(isNight);
PREP(setAttributes);
PREP(setGroupColor);
PREP(setGroupid);
PREP(simpleRoster);
PREP(spawnGroup);
PREP(spawnObjects);

[
	QGVAR(Faction), "LIST",
	["AI Spawn Side", "Side for units to spawn on"],
	QUOTE(ADDON),
	[
		[
			"west",
			"east",
			"independent"
		],
		[
			"West",
			"East",
			"Independent"
		],
		0
	],
	false
] call FUNCMAIN(settingsInit);

[
	QGVAR(AutoLock), "LIST",
	["Auto Lock Vehicles", "Note: Only effects vehicles with units in and spawned though the framework"],
	QUOTE(ADDON), [[true,false], ["Enabled","Disabled"], 1], false
] call FUNCMAIN(settingsInit);

/*
//["AllVehicles", "init", GW_Common_fnc_addToCurators, true, [], true] call CBA_fnc_addClassEventHandler;
//	["AllVehicles", "init", GW_Common_fnc_addToCurators] call CBA_fnc_addClassEventHandler;

if (isServer) then {
	["AllVehicles", "init", {
		_this call GW_Common_fnc_addToCurators;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
};
*/
