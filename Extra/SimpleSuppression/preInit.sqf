#include "scriptComponent.hpp"

//	PREP(LMG);
/*
[target1, player] call GW_FFIS_Fnc_DoEvasive;
[target1, player] call GW_FFIS_Fnc_DoFlank;
[target1, player] call GW_FFIS_Fnc_DoRelocate;
[target1, player] call GW_FFIS_Fnc_DoSmoke;
[target1, player] spawn GW_FFIS_Fnc_DoSuppress;
*/

PREP(DoEvasive);
PREP(DoFlank);
PREP(DoRelocate);
PREP(DoSmoke);
PREP(DoSuppress);

PREP(HandleEffect);
PREP(HandleFired);
PREP(HandlePFH);
PREP(Init);

//GVAR(enableSuppression) = true;
GVAR(BulletArray) = [];

GVAR(Messages) = true;
GVAR(evasiveAnimations) = true;		// Set to false to disable AI evasive animations.
GVAR(useSmoke) = false;				// Set to false to disable AI popping smoke.
GVAR(waypoints) = true;				// Set to false to disable FFIS' waypoints.

GVAR(LMGINFINITEAMMO) = false;		// Set to false to disable infinite ammo for LMG's (Infinite ammo helps make LMG units useful for suppression!).
GVAR(LMGSUPPRESSION) = false;		// Set to false to disable the forced full auto fire from LMG units.

[
	QGVAR(enableSuppression), "LIST",
	["Enable Suppression", "WARNING: Experimental!, Enable suppression for ai units"],
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false
] call FUNCMAIN(settingsInit);

/*
*	Fire-Fight Improvement System by GuzzenVonLidl
*	Causes incoming gunfire to scramble a group, simulating panic, fear, and surprise.
*	Units do evasive maneuvers to avoid gunfire.
*	Suppression is now effective against AI.
*	Higher skilled soldiers tend to regain focus quicker.
*	Firefights last longer.
*	Groups attempt to flank their shooter(s) and continue engagement.
*	Units will pop smoke when under fire.
*/
