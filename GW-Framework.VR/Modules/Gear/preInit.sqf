#include "scriptComponent.hpp"

GVAR(Stamina) = true;
GVAR(StaminaCoef) = 0;

PREP(actions);
PREP(getAttachments);
PREP(Handler);
PREP(Init);
PREP(replaceAttachments);

["AllVehicles", "init", {
	[{
		_this call FUNC(Init);
	}, _this, 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

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
	["Random Role for Zeus Units", "Should Zeus units get random gear"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);
