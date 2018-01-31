#include "script_Component.hpp"

PREP(buildingPop);
PREP(createGroup);
PREP(empty);
PREP(createUnits);
PREP(getGroupType);
PREP(setAttributes);
PREP(setGroupColor);
PREP(setGroupid);
PREP(simpleRoster);
PREP(spawnGroup);
PREP(spawnGroup_Veh);
PREP(spawnGroup_WP);
PREP(spawnObjects);

if (is3DEN) then {
	PREP(setAttributes3DEN);
	PREP(spawn3DEN);
	PREP(spawn3DENObjects);
};

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
	1
] call FUNCMAIN(settingsInit);

[QGVAR(AutoLock), "CHECKBOX", ["Auto Lock Vehicles", "Note: Only effects vehicles with units in and spawned though the framework"], QUOTE(ADDON), false, CBA_SERVEROVERWRITE] call FUNCMAIN(settingsInit);
[QGVAR(BlockAIGear), "CHECKBOX", ["Blocks access to ai Inventories", "Stops players from being able to scavenge dead AI"], QUOTE(ADDON), true, CBA_SERVEROVERWRITE] call FUNCMAIN(settingsInit);
[QGVAR(autoDelete), "CHECKBOX", ["Auto Delete Forgotten Units", "Automaticly deletes units and objects located at [0,0,0] after 10 seconds if not moved"], QUOTE(ADDON), true, CBA_SERVEROVERWRITE] call FUNCMAIN(settingsInit);
