
/*
	https://community.bistudio.com/wiki/setSkill_array

	Novice < 0.25
	Rookie >= 0.25 and <= 0.45
	Recruit > 0.45 and <= 0.65
	Veteran > 0.65 and <= 0.85
	Expert > 0.85
*/
#include "script_Component.hpp"

PREP(init);
//PREP(setActiveSkillTree);
PREP(setDetectionCoef);
PREP(setSkill);

GVAR(detectionCoef) = 1.0;
GVAR(unitTrainingBackup) = "";

#define	BEHAVIOURS	(missionConfigFile >> "GW_FRAMEWORK" >> "Behaviour")
private _index = [];
private _names = [];
for "_i" from 0 to ((count BEHAVIOURS) - 1) step 1 do {
	_index pushBack _i;
	_names pushBack (configName (BEHAVIOURS select _i));
};

[
	QGVAR(unitTraining), "LIST",
	["set Unit Training", "Sets the difficulty of newly spawned units"],
	QUOTE(ADDON), [_index, _names, 2], true
] call FUNCMAIN(settingsInit);

[
	QGVAR(randomSkill), "LIST",
	["Use Random Skill", "Makes each unit have slightly diffrent skill levels within a defined %"],
	QUOTE(ADDON),
	[
		[true,false],
		["enabled","disabled"],
		1
	],
	true
] call FUNCMAIN(settingsInit);

if (isClass ((missionConfigFile >> "GW_Modules" >> "VCOMAI"))) then {
	[
		QEGVAR(VCOMAI,Enabled), "LIST",
		["Enable advanced AI", "Might cause a slowdown in larger scales"],
		QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], true
	] call FUNCMAIN(settingsInit);
};
