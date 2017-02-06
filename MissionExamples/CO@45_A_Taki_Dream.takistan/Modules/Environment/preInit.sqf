#include "scriptComponent.hpp"

PREP(LightningEffect);
PREP(LightningLoop);
PREP(fullMoonDates);

GVAR(AdvLightning) = true;			//	Enable advanced lightning that everytime it hits does damage to objects & units.
GVAR(AdvLightningWeather) = true;	//	Enabled: only when weather is cloudy enought to have lightning, Disabled: ignores weather params

[
	QGVAR(AdvLightning), "LIST",
	["Advanced Lightning", "Creates deadly lightnings that effects the environment"],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false,
	{ params ["_value"]; GVAR(AdvLightning) = _value;}
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
