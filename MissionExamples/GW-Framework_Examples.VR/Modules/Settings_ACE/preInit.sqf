#include "script_Component.hpp"

if (!GVARMAIN(mod_ACE3)) exitWith {false};

[
	QGVAR(medical_level), "LIST",
	["Medical Level", "Configures ACE Medical with GOL settings"],
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
	], CBA_SERVEROVERWRITE, {
		[QGVAR(setMedical), GVAR(medical_level)] call CBA_fnc_localEvent;
	}
] call FUNCMAIN(settingsInit);

[
	QGVAR(revive), "LIST",
	["Enable Revive", "Configures ACE Revive with GOL settings"],
	QUOTE(ADDON),
	[
		[
			0,
			1,
			2
		],
		[
			"Disabled",
			"Enabled",
			"Enabled (One Life)"
		],
		0
	], CBA_SERVEROVERWRITE, {
		[QGVAR(setRevive), GVAR(revive)] call CBA_fnc_localEvent;
	}
] call FUNCMAIN(settingsInit);

[QGVAR(setMedical), {
	params ["_type"];
	if (_type isEqualTo 1) then {
		["ACE_Medical_level", 1, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_medicSetting", 1, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_enableOverdosing", true, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_bleedingCoefficient", 5, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_painCoefficient", 3, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_playerDamageThreshold", 1.5, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_AIDamageThreshold", 1, 1, "server"] call CBA_settings_fnc_set;
	//	ACE_Medical_allowDeadBodyMovement = false;		// Does nothing
	} else {
		["ACE_Medical_level", 2, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_medicSetting", 2, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_enableOverdosing", true, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_bleedingCoefficient", 0.5, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_painCoefficient", 2, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_playerDamageThreshold", 1.5, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_AIDamageThreshold", 1, 1, "server"] call CBA_settings_fnc_set;
		["ACE_Medical_enableUnconsciousnessAI", 0, 1, "server"] call CBA_settings_fnc_set;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(setRevive), {
	switch (GVAR(revive)) do {
		case 1: {
			["ace_medical_enableRevive", 1, 1, "server"] call CBA_settings_fnc_set;
			["ace_medical_amountOfReviveLives", -1, 1, "server"] call CBA_settings_fnc_set;
		};
		case 2: {
			["ace_medical_enableRevive", 1, 1, "server"] call CBA_settings_fnc_set;
			["ace_medical_amountOfReviveLives", 1, 1, "server"] call CBA_settings_fnc_set;
		};
		default {
			["ace_medical_enableRevive", 0, 1, "server"] call CBA_settings_fnc_set;
			["ace_medical_amountOfReviveLives", -1, 1, "server"] call CBA_settings_fnc_set;
		};
	};
}] call CBA_fnc_addEventHandler;

["CBA_settingsInitializedDelayed", {
	ACE_MaxWeightDrag = 100000;
	ACE_MaxWeightCarry = 10000;
//	ACE_Hearing_enableCombatDeafness = false;
	[QGVAR(setMedical), GVAR(medical_level)] call CBA_fnc_localEvent;
	[QGVAR(setRevive), GVAR(revive)] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
