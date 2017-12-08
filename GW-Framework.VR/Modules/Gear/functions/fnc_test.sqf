#include "script_Component.hpp"
/*
params [
	["_unit", objNull, [objNull]],
	["_role", "", ["",[]]]
];
*/


Tomato = [0,1,2];
Tomato2 = ["0","1","2"];
[
	QGVAR(test1), "LIST",
	["Loadout Blufor", "Loadout for Blufor units"],	// Title
	(QUOTE(ADDON) + "_Blufor"),	// Catagory
	[
		[
			"NATO-W",
			"USMC-W"
		],
		[
			"NATO-Woodland",
			"USMC-Woodland"
		],
		0
	],
	true,	// Global
	{
		Tomato = [3,4,5];
		Tomato2 = ["3","4","5"];
		systemChat str Tomato;
		[] call FUNC(test);
	    {
        	[CBA_Settings_refreshSetting, _x] call CBA_fnc_localEvent;
	    } forEach ["GW_Gear_test1","GW_Gear_test3","GW_Gear_test2"];
//		(findDisplay 4302) closeDisplay 2;
//		(findDisplay 313 call CBA_Settings_fnc_openSettingsMenu);
	}
] call FUNCMAIN(settingsInit);

[
	QGVAR(test3),
	"LIST",
	["Test 3", ""],
	(QUOTE(ADDON) + "_Blufor"),
	[Tomato,Tomato2,0],
	true,
	{systemChat "0"}
] call cba_settings_fnc_init;

[
	QGVAR(test2), "LIST",
	["Test 2", ""],	// Title
	(QUOTE(ADDON) + "_Blufor"),	// Catagory
	[
		Tomato,
		Tomato2,
		0
	],
	true	// Global
] call FUNCMAIN(settingsInit);