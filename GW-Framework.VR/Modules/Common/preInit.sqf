#include "script_Component.hpp"

PREP(buildingPop);
PREP(createGroup);
PREP(empty);
PREP(createUnits);
PREP(getGroupType);
PREP(setAttributes);
PREP(setAttributes3DEN);
PREP(setGroupColor);
PREP(setGroupid);
PREP(simpleRoster);
PREP(spawn3DEN);
PREP(spawn3DENObjects);
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

[
	QGVAR(BlockAIGear), "LIST",
	["Blocks access to ai Inventories", "Stops players from being able to scavenge dead AI"],
	QUOTE(ADDON),
	[
		[true,false],
		["enabled","disabled"],
		0
	],
	true
] call FUNCMAIN(settingsInit);

[
	QGVAR(autoDelete), "LIST",
	["Auto Delete Forgotten Units", "Automaticly deletes units and objects located at [0,0,0] after 10 seconds if not moved"],
	QUOTE(ADDON),
	[
		[true,false],
		["enabled","disabled"],
		0
	],
	true
] call FUNCMAIN(settingsInit);
