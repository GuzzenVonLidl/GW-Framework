#include "script_Component.hpp"

//PREP(addUnitToArty);

PREP(addAlarmLocation);
PREP(addFlag);
PREP(addObjectAction);
PREP(agentHandler);
PREP(artyAmbient);
//PREP(artyShelling);
//PREP(artySite);
PREP(createAgent);
PREP(getAlarm);
//PREP(setArtyActive);
//PREP(initFireSupport);
//PREP(setFireSupport);
PREP(setArtyActive);
PREP(setFiremission);
PREP(startAlarm);
PREP(stopAlarm);
PREP(toggleLights);

GVAR(AdvLightningSleep) = 60;
GVAR(AdvLightningActive) = false;

GVAR(Alarm) = false;
GVAR(AlarmLocations) = [];

GVAR(ambientLife) = false;
GVAR(AllAgents) = [];

[QGVAR(disableRedOffroads), "CHECKBOX", ["Disable Red Offroads", "Make Armed Offroad vehicles have camoflage instead of red color"], QUOTE(ADDON), true, CBA_SERVEROVERWRITE] call FUNCMAIN(settingsInit);
[QGVAR(AdvLightning), "CHECKBOX", ["Advanced Lightning", "Creates deadly lightnings that effects the environment"], QUOTE(ADDON), true, CBA_SERVEROVERWRITE] call FUNCMAIN(settingsInit);

[
	QGVAR(ppEffects), "LIST",
	["Postprocess effect", "Changes the look on the environment"],
	QUOTE(ADDON), [["Default","BlackAndWhite","EastWind","Mediterranean","RealIsBrown"], ["Default","BlackAndWhite","Warm","Cold","Brown"], 0], CBA_SERVEROVERWRITE,
	{
		[{
		 	params ["_ppEffectsValue"];
			[FORMAT_1("%1",_ppEffectsValue), 0, true] call BIS_fnc_setPPeffectTemplate;
			LOG(FORMAT_1("PostProcess Effect set to %1", _ppEffectsValue));
		}, _this, 1] call CBA_fnc_waitAndExecute;
	}
] call FUNCMAIN(settingsInit);
