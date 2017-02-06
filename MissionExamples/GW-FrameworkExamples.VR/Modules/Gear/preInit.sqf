#include "scriptComponent.hpp"

GVAR(Enabled_101) = true;
GVAR(Enabled_201) = true;
GVAR(Enabled_301) = true;
GVAR(Enabled_302) = true;

GVAR(Index101) = 0;
GVAR(Index201) = 0;
GVAR(Index301) = 0;
GVAR(Index302) = 0;
GVAR(Stamina) = true;
GVAR(StaminaCoef) = 0.5;

PREP(actions);
PREP(getAttachments);
PREP(Handler);
PREP(Init);
PREP(replaceAttachments);

[
	QGVAR(Blufor), "LIST",
	["Loadout Blufor", "Loadout for blufor units"],
	QUOTE(ADDON),
	[
		[
			"NATO-D",
			"NATO-W",
			"BAF-D",
			"BAF-W",
			"USMC-D",
			"USMC-W",
			"INSURGENT-D",
			"INSURGENT-W",
			"CAMPAIGN-W"
		],
		[
			"NATO-Desert",
			"NATO-Woodland",
			"BAF-Desert",
			"BAF-Woodland",
			"USMC-Desert",
			"USMC-Woodland",
			"INSURGENT-Desert",
			"INSURGENT-Woodland",
			"Campaign-"
		],
		0
	],
	false
] call FUNCMAIN(settingsInit);

[
	QGVAR(Opfor),
	"LIST", ["Loadout Opfor", "Loadout for opfor units"],
	QUOTE(ADDON),
	[
		[
			"CSAT-H",
			"CSAT-W",
			"CSAT-U",
			"RUSSIAN-W",
			"TAKIARMY-D",
			"INSURGENT-D",
			"INSURGENT-W",
			"CAMPAIGN-E"
		],
		[
			"CSAT-Hex",
			"CSAT-Woodland",
			"CSAT-Urban",
			"Russian-Woodland",
			"Takistani Army-Desert",
			"INSURGENT-Desert",
			"INSURGENT-Woodland",
			"Campaign-"
		],
		0
	]
	,
	false
] call FUNCMAIN(settingsInit);

[
	QGVAR(Independent),
	"LIST", ["Loadout Independent", "Loadout for independent units"],
	QUOTE(ADDON),
	[
		[
			"AAF-W",
			"PMC",
			"INSURGENT-D",
			"INSURGENT-W",
			"CAMPAIGN-I"
		],
		[
			"AAF-Woodland",
			"PMC",
			"INSURGENT-Desert",
			"INSURGENT-Woodland",
			"Campaign-"
		],
		0
	],
	false
] call FUNCMAIN(settingsInit);

[
	QGVAR(Auto_Assign), "LIST",
	["Auto assign gear", "automaticly gives gear to spawned units"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(randomZeusGear), "LIST",
	["Random Role for spawned Units", "Should spawned units get random gear"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(BlockAIGear), "LIST",
	["Blocks access to ai Inventories", "Stops players from being able to scavenge dead AI"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);
