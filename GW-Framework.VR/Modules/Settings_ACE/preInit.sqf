#include "scriptComponent.hpp"

//	if !(GVARMAIN(mod_ACE3)) exitWith {false};
GVAR(medical_level) = 1;
GVAR(medical_medicSetting) = 1;

[
	QGVAR(medical_level), "LIST",
	["Medical Level", "Medical difficulty"],
	QUOTE(ADDON),
	[
		[
			1,
			2
		],
		[
			"Basic",
			"Advanced"
		],
		0
	],
	false
] call FUNCMAIN(settingsInit);
