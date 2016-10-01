#include "scriptComponent.hpp"

PREP(addToCurators);
PREP(createGroup);
PREP(createUnits);	// Untested
PREP(findAverage);
PREP(getGroupType);
PREP(GetPosASL);
PREP(GetPosATL);
PREP(isNight);
PREP(spawnGroup);
PREP(spawnObjects);
PREP(spawnStatic);

GVAR(Faction) = "Independent";

if (isServer) then {
	["AllVehicles", "init", {
		_this call FUNC(addToCurators);
//		_this call FUNC(autoLock);
	}] call CBA_fnc_addClassEventHandler;
};

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
