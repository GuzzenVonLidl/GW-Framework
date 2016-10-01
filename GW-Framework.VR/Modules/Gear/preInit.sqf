#include "scriptComponent.hpp"

GVAR(Blufor) = "NATO-D";
GVAR(Opfor) = "CSAT-H";
GVAR(Independent) = "AAF-W";
GVAR(Civilian) = "CIVI";
GVAR(Auto_Assign) = true;

GVAR(Stamina) = true;
GVAR(StaminaCoef) = 0;

PREP(actions);
PREP(getAttachments);
PREP(Handler);
PREP(Init);
PREP(replaceAttachments);
PREP(setGroupColor);

["AllVehicles", "init", {
	_this call FUNC(Init);
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
			"INSURGENT-D",
			"INSURGENT-W"
		],
		[
			"NATO-Desert",
			"NATO-Woodland",
			"BAF-Desert",
			"BAF-Woodland",
			"INSURGENT-Desert",
			"INSURGENT-Woodland"
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
			"INSURGENT-D",
			"INSURGENT-W"
		],
		[
			"CSAT-Hex",
			"CSAT-Woodland",
			"CSAT-Urban",
			"Russian-Woodland",
			"INSURGENT-Desert",
			"INSURGENT-Woodland"
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
			"INSURGENT-W"
		],
		[
			"AAF-Woodland",
			"PMC",
			"INSURGENT-Desert",
			"INSURGENT-Woodland"
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

/*
	[
		QGVAR(Civilian),
		"LIST", ["Loadout Civilian", "Loadout for civilian units"],
		QUOTE(ADDON),
		[
			["urban","workers"],
			["Urban","Workers"],
			0
		],
		false
	] call FUNCMAIN(settingsInit);
*/
