#include "scriptComponent.hpp"

//PREP(addUnitToArty);
//PREP(artyArea);
PREP(LightningEffect);
PREP(getfullMoonDates);
PREP(snow);

GVAR(LightningSleep) = 0;

GVAR(snowEnabled) = true;
GVAR(snowIntensity) = 300;
GVAR(snowTempIntensity) = 300;
GVAR(snowVelocity) = 1;
GVAR(snowFidelity) = 5;
GVAR(snowMaxDistance) = 30;

[
	QGVAR(AdvLightning), "LIST",
	["Advanced Lightning", "Creates deadly lightnings that effects the environment"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false,
	{ params ["_value"]; GVAR(AdvLightning) = _value;}
] call FUNCMAIN(settingsInit);

[
	QGVAR(snowEnabled), "LIST",
	["Enable Snow fall", "Replaces rain with snow"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(ppEffects), "LIST",
	["Postprocess effect", "Changes the look on the environment"],
	QUOTE(ADDON), [["Default","BlackAndWhite","Warm","Cold","Brown"], ["Default","BlackAndWhite","Warm","Cold","Brown"], 0], false,
	{
		[{
		 	params ["_ppEffectsValue"];
			[FORMAT_1("%1",_ppEffectsValue), 0, true] call BIS_fnc_setPPeffectTemplate;
			LOG(FORMAT_1("PostProcess Effect set to %1", _ppEffectsValue));
		}, _this, 1] call CBA_fnc_waitAndExecute;
	}
] call FUNCMAIN(settingsInit);
