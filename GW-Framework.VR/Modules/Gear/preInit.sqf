#include "scriptComponent.hpp"

GVAR(Blufor) = "NATO-D";
GVAR(Opfor) = "CHINA-D";
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

["AllVehicles", "init", {
//	[{MAPLOADED}, {
		[{
			_this call FUNC(Init);
		}, _this, 0.1] call CBA_fnc_waitAndExecute;
//	}, _this] call CBA_fnc_waitUntilAndExecute;
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
			"INSURGENT-W"
		],
		[
			"NATO-Desert",
			"NATO-Woodland",
			"BAF-Desert",
			"BAF-Woodland",
			"USMC-Desert",
			"USMC-Woodland",
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
			"CHINA-D",
			"RUSSIAN-W",
			"TAKIARMY-D",
			"INSURGENT-D",
			"INSURGENT-W"
		],
		[
			"CSAT-Hex",
			"CSAT-Woodland",
			"CSAT-Urban",
			"China-Desert",
			"Russian-Woodland",
			"Takistani Army-Desert",
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
