
/*
	https://community.bistudio.com/wiki/setSkill_array

	Novice < 0.25
	Rookie >= 0.25 and <= 0.45
	Recruit > 0.45 and <= 0.65
	Veteran > 0.65 and <= 0.85
	Expert > 0.85
*/
#include "scriptComponent.hpp"

PREP(HandlerRespawn);
PREP(Init);
FUNC(Get) = {
	switch (GVAR(difficulty)) do {	// 1:Easy	2:Medium	3:Hard
		case 1: {
			GVAR(easy)
		};
		case 2: {
			GVAR(medium)
		};
		case 3: {
			GVAR(hard)
		};
	};
};

//	[aiming, general, spotting]
GVAR(easy) 	 = [0.20, 0.50, 0.80];
GVAR(medium) = [0.30, 0.60, 0.80];
GVAR(hard) 	 = [0.35, 0.70, 1.00];

[
	QGVAR(difficulty), "LIST",
	["Difficulty", "Sets the difficulty of newly spawned units"],
	QUOTE(ADDON), [[0,1,2,3], ["Disable","Easy","Medium","Hard"], 2], true
] call FUNCMAIN(settingsInit);

[
	QGVAR(playerDetection), "SLIDER",
	["Detect player skill", "How easily a player gets detected, lower value harder to detect"],
	QUOTE(ADDON), [0.5, 2, 1.0, 1], true
] call FUNCMAIN(settingsInit);

if (isClass ((missionConfigFile >> "GW_Modules" >> "VCOMAI"))) then {
	[
		QEGVAR(VCOMAI,Enabled), "LIST",
		["Enable advanced AI", "Might cause a slowdown in larger scales"],
		QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], true
	] call FUNCMAIN(settingsInit);
};
