
/*
	https://community.bistudio.com/wiki/setSkill_array

	Novice < 0.25
	Rookie >= 0.25 and <= 0.45
	Recruit > 0.45 and <= 0.65
	Veteran > 0.65 and <= 0.85
	Expert > 0.85
*/
#include "scriptComponent.hpp"

PREP(handleFired);
PREP(handlePFH);
PREP(Init);
PREP(Suppression);
FUNC(Get) = {
	switch (GVAR(difficulty)) do {
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

GVAR(difficulty) = 1;	// 1:Easy	2:Medium	3:Hard

//	[aiming, general, spotting]
GVAR(easy) = [0.20, 0.30, 0.80];
GVAR(medium) = [0.30, 0.50, 0.80];
GVAR(hard) = [0.40, 0.70, 1.0];

GVAR(enableSuppression) = false;
GVAR(BulletArray) = [];

[
	QGVAR(difficulty), "LIST",
	["Difficulty", "Sets the difficulty of newly spawned units"],
	QUOTE(ADDON), [[0,1,2,3], ["Disable","Easy","Medium","Hard"], 2], false
] call FUNCMAIN(settingsInit);
[
	QGVAR(enableSuppression), "LIST",
	["Enable Suppression", "WARNING: Experimental!, Enable suppression for ai units"],
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false
] call FUNCMAIN(settingsInit);

if (isServer) then {
	["CAManBase", "Init", {
		_this call FUNC(Init);
	}] call CBA_fnc_addClassEventHandler;
};

/*
	[QGVARMAIN(missionStarted), {
		LOG("Event Suppression PFH");
		if (GVAR(enableSuppression)) then {
			[] call FUNC(handlePFH);
		};
	}] call CBA_fnc_addEventHandler;
*/
