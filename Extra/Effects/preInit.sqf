#include "scriptComponent.hpp"

//PREP(addUnitToArty);
PREP(addFlag);
PREP(addObjectAction);
PREP(artyAmbient);
PREP(createInit);
PREP(destroyLights);
PREP(getfullMoonDates);
PREP(LightningEffect);

GVAR(LightningSleep) = 0;
GVAR(AdvLightningActive) = false;

[
	QGVAR(AdvLightning), "LIST",
	["Advanced Lightning", "Creates deadly lightnings that effects the environment"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], true,
	{ [QGVAR(lightning), []] call CBA_fnc_serverEvent; }
] call FUNCMAIN(settingsInit);

[
	QGVAR(ppEffects), "LIST",
	["Postprocess effect", "Changes the look on the environment"],
	QUOTE(ADDON), [["Default","BlackAndWhite","Warm","Cold","Brown"], ["Default","BlackAndWhite","Warm","Cold","Brown"], 0], true,
	{
		[{
		 	params ["_ppEffectsValue"];
			[FORMAT_1("%1",_ppEffectsValue), 0, true] call BIS_fnc_setPPeffectTemplate;
			LOG(FORMAT_1("PostProcess Effect set to %1", _ppEffectsValue));
		}, _this, 1] call CBA_fnc_waitAndExecute;
	}
] call FUNCMAIN(settingsInit);

[
	QGVAR(snowEnabled), "LIST",
	["Enable Snow Effects", "WARNING! Highly unstable"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 1], true
] call FUNCMAIN(settingsInit);
