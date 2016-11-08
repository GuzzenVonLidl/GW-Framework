#include "scriptComponent.hpp"

PREP(Behaviour);
PREP(FiredEH);
PREP(Init);
PREP(LMG);

GVAR(USESMOKE) = true;				// Set to false to disable AI popping smoke.
GVAR(EVASIVEANIMATIONS) = false;		// Set to false to disable AI evasive animations.
GVAR(WAYPOINTS) = true;				// Set to false to disable FFIS' waypoints.
GVAR(LMGINFINITEAMMO) = true;		// Set to false to disable infinite ammo for LMG's (Infinite ammo helps make LMG units useful for suppression!).
GVAR(LMGSUPPRESSION) = true;		// Set to false to disable the forced full auto fire from LMG units.
GVAR(SwitchMovePVEH) = [];

QGVAR(SwitchMovePVEH) addPublicVariableEventHandler {
	((_this select 1) select 0) switchMove ((_this select 1) select 1);
};

["CAManBase", "init", {
	[{
		_this call FUNC(Init);
	}, _this, 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addClassEventHandler;

/*
*	Fire-Fight Improvement System by Zooloo75
*	Causes incoming gunfire to scramble a group, simulating panic, fear, and surprise.
*	Units may accidentally fire their weapon out of fear from incoming fire (possibly resulting in friendly fire).
*	Units do evasive maneuvers to avoid gunfire.
*	Suppression is now effective against AI.
*	Higher skilled soldiers tend to regain focus quicker.
*	AI can now suppress other AI.
*	Units lose focus as they take fire, making them difficult to command.
*	Firefights last longer.
*	Groups attempt to flank their shooter(s) and continue engagement.
*	Units will pop smoke when under fire.
*	Sniper units react differently than non-sniper units.
*	AI can call in artillery support.
*/
