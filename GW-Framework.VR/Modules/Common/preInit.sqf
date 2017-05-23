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
PREP(spawnGroup_Veh);
PREP(spawnGroup_WP);
PREP(spawnObjects);

[
	QGVAR(Faction), "LIST",
	["AI Spawn Side", "Side for units to spawn on"],
	QUOTE(ADDON),
	[
		[
			"west",
			"east",
			"independent",
			"civilian"
		],
		[
			"West",
			"East",
			"Independent",
			"Civilian"
		],
		0
	],
	true
] call FUNCMAIN(settingsInit);

[
	QGVAR(AutoLock), "LIST",
	["Auto Lock Vehicles", "Note: Only effects vehicles with units in and spawned though the framework"],
	QUOTE(ADDON), [[true,false], ["Enabled","Disabled"], 1], true
] call FUNCMAIN(settingsInit);
