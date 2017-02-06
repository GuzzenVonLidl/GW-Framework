/*
	Author: GuzzenVonLidl
	Sets the correct gear for soldier, cargo for vehicles and ammo boxes

	Usage:
	[player, "sl"] call GW_Gear_Fnc_Handler;

	Arguments:
	0: Unit <OBJECT>
	1: Type of gear unit will get <STRING>

	Return Value: NO

	Public: YES

	Available Roles:
	pl		- Platoon leader			(Player)
	fac		- Forward Air Controller	(Player)
	sl		- Squad Leader				(Player)
	ftl		- Fire team leader			(Both)
	r		- Rifleman
	rat		- Rifleman AT				(Player)
	hat		- Rifleman AT Heavy
	ahat	- Asst. Rifleman AT
	g		- Grenadier					(Both)
	ag		- Asst. Gunner				(Both)
	ar		- Automatic Rifleman		(Both)
	mmg		- Medium Machine Gunner
	ammg	- Asst. Medium Machine Gunner
	crew	- Crew memeber				(Both)
	p		- Pilot						(Both)
*/
#include "..\scriptComponent.hpp"
#include "Functions.hpp"

private [
	"_isMan","_isCar","_isTank","_type","_nightTime","_side","_errorCode","_loadout","_loadoutFile",
	"_addEquipment","_addLinkedItems","_addPrimary","_addLaunchers","_addHandGun","_addToUniform","_addToVest","_addToBackPack","_addBino",
	"_grenade","_grenademini",
	"_smokegrenadeW","_smokegrenadeB","_smokegrenadeG","_smokegrenadeO","_smokegrenadeP","_smokegrenadeR","_smokegrenadeY",
	"_chemB","_chemG","_chemR","_chemY",
	"_glHE","_glsmokeW","_glsmokeB","_glsmokeG","_glsmokeO","_glsmokeP","_glsmokeR","_glsmokeY","_glflareG","_glflareR",
	"_map","_gps","_radio","_compass","_watch","_nvg","_demoCharge","_satchelCharge",
	"_cTab","_Android","_microDAGR","_HelmetCam",
	"_bandage","_blood","_epi","_morph","_IFAK","_FAKSmall","_FAKBig",
	"_barrel","_cables","_clacker","_defusalKit","_IRStrobe","_mapFlashLight","_mapTools","_rangefinder",
	"_flashBang","_handFlareG","_handFlareR","_handFlareW","_handFlareY",
	"_goggles","_helmet","_uniform","_vest","_backpack","_backpackRadio",
	"_silencer","_pointer","_sight","_bipod",
	"_rifle","_rifleC","_rifleGL",
	"_rifle_mag","_rifle_mag_tr",
	"_rifleC_mag","_rifleC_mag_tr",
	"_rifleGL_mag","_rifleGL_mag_tr",
	"_LMG","_LMG_mag","_LMG_mag_tr",
	"_MMG","_MMG_mag","_MMG_mag_tr",
	"_LAT","_LAT_mag","_LAT_ReUsable",
	"_MAT","_MAT_mag","_MAT_mag_HE",
	"_pistol","_pistol_mag","_pistol_mag_tr"
];

params [
	["_unit", objNull, [objNull]],
	["_role", "", ["",[]]],
	["_forceFaction", "", ["",[]]]
];

if !(_unit isEqualType objNull) exitWith {false};
if !(local _unit) exitWith {false};
_isMan = _unit isKindOf "CAManBase";
_isCar = _unit isKindOf "Car";
_isTank = _unit isKindOf "Tank";
_errorCode = 0;

if (_isMan) then {
	if (getNumber(configfile >> "CfgVehicles" >> (typeOf _unit) >> "side") isEqualTo 3) exitWith {false};	// Civilians
	_loadout = [[],[],[],[],[],[],"","",[],[]];
	_loadoutFile = "Default";

	_unit setVariable ["BIS_enableRandomization", false];
	_unit setVariable ["ACE_Medical_MedicClass", 1];
	_unit setVariable [QGVAR(Loadout), _role];

	if (_forceFaction isEqualTo "") then {
		switch (GETSIDE(_unit)) do {
			case 0: {
				_side = toUpper(GVAR(Opfor));
			};
			case 1: {
				_side = toUpper(GVAR(Blufor));
			};
			case 2: {
				_side = toUpper(GVAR(Independent));
			};
			case 3: {
				_side = toUpper(GVAR(Civilian));
			};
		};
	} else {
		_side = _forceFaction;
	};

	#include "..\Scripts\Classes\Common.sqf"
	#include "..\Scripts\factions.sqf"
	#include "isNilCheck.hpp"

	switch (_loadoutFile) do {
		default {
			#include "..\Scripts\Default.sqf"
		};
	};

	if (_errorCode isEqualTo 0) then {
		_unit setUnitLoadout _loadout;

		if (isPlayer _unit) then {
			if (isClass ((missionConfigFile >> "GW_Modules" >> "Radios"))) then {
				[{
					_this call EFUNC(Radios,add);
				}, [_unit, _role], 0.1] call CBA_fnc_waitAndExecute;
			};
		};
		LOG(FORMAT_2("Unit: %1, Role: %2", _unit, _role));
	};
} else {
	_role params [
		["_class", "", [""]],
		["_side", "west", [""]],
		["_movable", true, [true]]
	];

	_isVehicle = _unit isKindOf "AllVehicles";
	if !(_isVehicle) Then {
		[_unit, _movable] call ACE_Dragging_fnc_setCarryable;
		[_unit, _movable] call ACE_Dragging_fnc_setDraggable;
		if !(_movable) then {  // Enable Move Object
			_unit enableRopeAttach false;
		};
	} else {
		if (locked _unit >= 2) then {
			_class = "locked";
		};
	};

	switch (toLower(_side)) do {
		case "west": {
			_side = toUpper(GVAR(Blufor));
		};

		case "east": {
			_side = toUpper(GVAR(Opfor));
		};

		case "indep": {
			_side = toUpper(GVAR(Independent));
		};

		case "independent": {
			_side = toUpper(GVAR(Independent));
		};

		default {
			_side = toUpper(GVAR(Civilian));
		};
	};

	#include "..\Scripts\Classes\Common.sqf"
	#include "..\Scripts\factions.sqf"
	#include "isNilCheck.hpp"

	ClearWeaponCargoGlobal _unit;
	ClearMagazineCargoGlobal _unit;
	ClearItemCargoGlobal _unit;
	ClearBackpackCargoGlobal _unit;

	if (_errorCode isEqualTo 0) then {
		switch (_class) do {
			case "gearbox": {
				[_unit, _glsmokeY, 20] call _fnc_AddObjectsCargo;
				[_unit, _glflareW, 20] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeY, 20] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeG, 5] call _fnc_AddObjectsCargo;
				[_unit, "ACE_EarBuds", 100] call _fnc_AddObjectsCargo;
				[_unit] remoteExecCall [QFUNC(actions), 0, true];
			};

			case "small_box": {
				[_unit, _glHE, 20] call _fnc_AddObjectsCargo;
				[_unit, _glsmokeY, 20] call _fnc_AddObjectsCargo;
				[_unit, _glflareW, 20] call _fnc_AddObjectsCargo;
				[_unit, _grenade, 20] call _fnc_AddObjectsCargo;
				[_unit, _grenademini, 20] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeY, 20] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeG, 5] call _fnc_AddObjectsCargo;

				[_unit, _bandage, 40] call _fnc_AddObjectsCargo;
				[_unit, _morph, 20] call _fnc_AddObjectsCargo;

				[_unit, _pistol_mag, 10] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag, 9] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag_tr, 9] call _fnc_AddObjectsCargo;
				[_unit, _rifleC_mag, 3] call _fnc_AddObjectsCargo;
				[_unit, _rifleC_mag_tr, 3] call _fnc_AddObjectsCargo;
				[_unit, _rifleGL_mag, 7] call _fnc_AddObjectsCargo;
				[_unit, _rifleGL_mag_tr, 7] call _fnc_AddObjectsCargo;
				[_unit, _LMG_mag_tr, 12] call _fnc_AddObjectsCargo;

				[_unit, (_LAT select 0), 3] call _fnc_AddObjectsCargo;
				if (_LAT_ReUsable) then {
					[_unit, _LAT_mag, 3] call _fnc_AddObjectsCargo;
				};

				[_unit, _demoCharge, 4] call _fnc_AddObjectsCargo;
				[_unit, _satchelCharge, 2] call _fnc_AddObjectsCargo;
			};

			case "big_box": {
				[_unit, _glHE, 50] call _fnc_AddObjectsCargo;
				[_unit, _glsmokeY, 40] call _fnc_AddObjectsCargo;
				[_unit, _glflareW, 40] call _fnc_AddObjectsCargo;
				[_unit, _grenade, 60] call _fnc_AddObjectsCargo;
				[_unit, _grenademini, 60] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeY, 60] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeG, 15] call _fnc_AddObjectsCargo;

				[_unit, _bandage, 50] call _fnc_AddObjectsCargo;
				[_unit, _morph, 20] call _fnc_AddObjectsCargo;
				[_unit, _epi, 20] call _fnc_AddObjectsCargo;
				[_unit, _blood, 10] call _fnc_AddObjectsCargo;

				[_unit, _pistol_mag, 20] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag, 15] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag_tr, 15] call _fnc_AddObjectsCargo;
				[_unit, _rifleC_mag, 10] call _fnc_AddObjectsCargo;
				[_unit, _rifleC_mag_tr, 10] call _fnc_AddObjectsCargo;
				[_unit, _rifleGL_mag, 15] call _fnc_AddObjectsCargo;
				[_unit, _rifleGL_mag_tr, 15] call _fnc_AddObjectsCargo;
				[_unit, _LMG_mag_tr, 24] call _fnc_AddObjectsCargo;

				[_unit, (_LAT select 0), 6] call _fnc_AddObjectsCargo;
				if (_LAT_ReUsable) then {
					[_unit, _LAT_mag, 8] call _fnc_AddObjectsCargo;
				};


				[_unit, _demoCharge, 8] call _fnc_AddObjectsCargo;
				[_unit, _satchelCharge, 4] call _fnc_AddObjectsCargo;
			};

			case "med_box": {
				[_unit, _bandage, 100] call _fnc_AddObjectsCargo;
				[_unit, _morph, 50] call _fnc_AddObjectsCargo;
				[_unit, _epi, 50] call _fnc_AddObjectsCargo;
				[_unit, _blood, 50] call _fnc_AddObjectsCargo;
				if ((EGVAR(Settings_ACE,medical_level) isEqualTo 2) || (ace_medical_level isEqualTo 2)) then {
					[_unit, "ACE_elasticBandage", 100] call _fnc_AddObjectsCargo;
					[_unit, "ACE_tourniquet", 50] call _fnc_AddObjectsCargo;
					[_unit, "ACE_quikclot", 50] call _fnc_AddObjectsCargo;
					[_unit, "ACE_atropine", 50] call _fnc_AddObjectsCargo;
					[_unit, "ACE_salineIV", 50] call _fnc_AddObjectsCargo;
					[_unit, "ACE_surgicalKit", 50] call _fnc_AddObjectsCargo;
				};
			};

			case "car": {
				[_unit, _bandage, 5] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeY, 6] call _fnc_AddObjectsCargo;

				[_unit, _pistol_mag, 10] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag, 10] call _fnc_AddObjectsCargo;
				[_unit, _LMG_mag_tr, 3] call _fnc_AddObjectsCargo;

				[_unit, _demoCharge, 1] call _fnc_AddObjectsCargo;
				[_unit, (_LAT select 0), 2] call _fnc_AddObjectsCargo;
				if (_LAT_ReUsable) then {
					[_unit, _LAT_mag, 4] call _fnc_AddObjectsCargo;
				};
			};

			case "tank": {
				[_unit, _bandage, 5] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeY, 2] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeP, 2] call _fnc_AddObjectsCargo;
				[_unit, _pistol_mag, 3] call _fnc_AddObjectsCargo;
				[_unit, _rifle_mag, 4] call _fnc_AddObjectsCargo;
			};

			case "heli": {
				[_unit, "B_Parachute", (count fullCrew [_unit,"",true])] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeP, 2] call _fnc_AddObjectsCargo;
				[_unit, _bandage, 10] call _fnc_AddObjectsCargo;
				[_unit, _morph, 5] call _fnc_AddObjectsCargo;
				[_unit, _epi, 5] call _fnc_AddObjectsCargo;
				[_unit, _blood, 5] call _fnc_AddObjectsCargo;
			};

			case "plane": {
				[_unit, "B_Parachute", (count fullCrew [_unit,"",true])] call _fnc_AddObjectsCargo;
				[_unit, _smokegrenadeP, 2] call _fnc_AddObjectsCargo;
				[_unit, _bandage, 10] call _fnc_AddObjectsCargo;
				[_unit, _morph, 5] call _fnc_AddObjectsCargo;
				[_unit, _epi, 5] call _fnc_AddObjectsCargo;
				[_unit, _blood, 5] call _fnc_AddObjectsCargo;
			};

			case "locked": {
				LOG(FORMAT_1("Vehicle is locked: %1", _unit));
			};

			default {
				LOG("Error in Cargo faction");
			};
		};
	};
};
