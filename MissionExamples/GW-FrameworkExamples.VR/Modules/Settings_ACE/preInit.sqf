#include "scriptComponent.hpp"

if (!GVARMAIN(mod_ACE3)) exitWith {false};

[
	QGVAR(medical_level), "LIST",
	["Medical Level", "Medical difficulty (Only works at mission start)"],
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

[QGVARMAIN(missionStarted), {
	ACE_MaxWeightDrag = 100000;
	ACE_MaxWeightCarry = 10000;
//	ACE_Hearing_enableCombatDeafness = false;
	private _level = 1;
	if (GVAR(medical_level) isEqualTo 2) then {
		_level = 2;
	};
	[QGVAR(setMedical), _level] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(setMedical), {
	if (_this isEqualTo 1) then {
		ACE_Medical_level = 1;
		ACE_Medical_medicSetting = 1;
		ACE_Medical_enableOverdosing = false;
		ACE_Medical_bleedingCoefficient = 5;
		ACE_Medical_painCoefficient = 3;
		ACE_Medical_playerDamageThreshold = 1.5;
		ACE_Medical_AIDamageThreshold = 1;
	//	ACE_Medical_allowDeadBodyMovement = false;		// Does nothing
	} else {
		ACE_Medical_level = 2;
		ACE_Medical_medicSetting = 2;
		ACE_Medical_enableOverdosing = true;
		ACE_Medical_bleedingCoefficient = 0.5;
		ACE_Medical_painCoefficient = 2;
		ACE_Medical_playerDamageThreshold = 1.5;
		ACE_Medical_AIDamageThreshold = 1;
	};
}] call CBA_fnc_addEventHandler;
