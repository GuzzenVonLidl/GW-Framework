/*
pl		- Platoon leader
fac		- Forward Air Controller
sl		- Squad leader
ftl		- Fire team leader
r		- Rifleman
mat		- Rifleman AT Medium
amat	- Asst. Rifleman AT
g		- Grenadier
ag		- Asst. Gunner
ar		- Automatic Rifleman
mmg		- Medium Machine Gunner
ammg	- Asst. Medium Machine Gunner
crew	- Crew memeber
p		- Pilot
*/

switch (toLower(_role)) do {

	case "pl": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,3]] call _addToUniform;
		[[_smokegrenadeG,5],[_grenademini,2],[_rifle_mag_tr,5]] call _addToVest;
		[[_smokegrenadeG,5]] call _addToBackpack;
		_rangefinder call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "fac": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_rifleGL, _rifle_mag_tr, _glsmokeR] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_grenademini,2]] call _addToUniform;
		[[_rifle_mag_tr,3],[_smokegrenadeY,6],[_smokegrenadeG,6],[_smokegrenadeB,2],[_smokegrenadeP,2]] call _addToVest;
		[[_glsmokeR,5],[_glsmokeG,2],[_smokegrenadeG,5]] call _addToBackpack;
		if (call EFUNC(Common,isNight)) then {
			[[_chemG,5],[_chemR,5],[_handFlareG,2],[_IRStrobe,3]] call _addToBackpack;
		};
		_laserDesignator call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "sl": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_rifleGL, _rifleGL_mag, _glHE] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4]] call _addToUniform;
		[[_smokegrenadeG,3],[_grenademini,2],[_grenade,2],[_rifleGL_mag_tr,4]] call _addToVest;
		[[_rifleGL_mag,4],[_glHE,7],[_glsmokeR,5]] call _addToBackpack;
		_rangefinder call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "sm": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, _glHE] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4]] call _addToUniform;
		[[_smokegrenadeG,3],[_grenademini,2],[_rifle_mag_tr,2]] call _addToVest;
		_FAKBig call _addToBackpack;
		_rangefinder call _addBino;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "ftl": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifleGL, _rifleGL_mag, _glHE] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4]] call _addToUniform;
		[[_smokegrenadeG,3],[_grenademini,2],[_grenade,2],[_rifleGL_mag_tr,4]] call _addToVest;
		[[_rifleGL_mag,4],[_glHE,7],[_glsmokeR,5]] call _addToBackpack;
		_rangefinder call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "r": {
		[_goggles,_helmet,_uniform,_vest] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,3]] call _addToUniform;
		[[_grenademini,2],[_grenade,2],[_rifle_mag,4],[_rifle_mag_tr,4]] call _addToVest;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
		if (isPlayer _unit) then {
			["","","","",_backpack] call _addEquipment;
			[_LAT, _LAT_mag, ""] call _addLaunchers;
			[[_cables,1],[_defusalKit,1],[_clacker,1],[_demoCharge,2],[_satchelCharge,1]] call _addToBackpack;
			[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
			if (_LAT_ReUsable) then {
				[[_LAT_mag,1]] call _addToBackpack;
			};
		} else {
			if ((random 1) >= 0.7) then {
				[_LAT, _LAT_mag, ""] call _addLaunchers;
				if (_LAT_ReUsable) then {
					["","","","",_backpack] call _addEquipment;
					[[_LAT_mag,2]] call _addToBackpack;
				};
			};
		};
	};

	case "g": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifleGL, _rifleGL_mag, _glHE] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,3]] call _addToUniform;
		[[_grenademini,2],[_grenade,2],[_rifleGL_mag,4],[_rifleGL_mag_tr,4]] call _addToVest;
		[[_glHE,7],[_glsmokeR,3],[_glsmokeY,3]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
		if (_LAT_ReUsable) then {
			[[_LAT_mag,1],[_LAT_mag_HE,1]] call _addToBackpack;
		};
	};

	case "ag": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4],[_grenademini,2]] call _addToUniform;
		[[_grenade,1],[_rifle_mag,4],[_rifle_mag_tr,4]] call _addToVest;
		(_FAKSmall + [[_LMG_mag_tr,COUNT_AG_MAGS(_LMG_mag_tr)]]) call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
		_rangefinder call _addBino;
	};

	case "ar": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_LMG, _LMG_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,2]] call _addToUniform;
		[[_grenade,2],[_grenademini,2]] call _addToVest;
		[[_LMG_mag,COUNT_AR_MAGS(_LMG_mag)],[_LMG_mag_tr,COUNT_AR_MAGS(_LMG_mag_tr)]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "crew": {
		[_goggles,_helmet,_uniform,_vest] call _addEquipment;
		[_smg, _smg_mag_tr, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,2]] call _addToUniform;
		[[_smg_mag_tr,3],[_smokegrenadeP,3],[_grenademini,1]] call _addToVest;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "p": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_smg, _smg_mag_tr, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_smokegrenadeY,2],[_smokegrenadeP,3],[_grenademini,1]] call _addToUniform;
		[[_smg_mag_tr,4]] call _addToVest;
		_FAKBig call _addToBackpack;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};
	
	case "hunter": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_rifleMXM, _rifle_MXM_mag_tr, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_grenademini,2],[_rifleRangecard,1]] call _addToUniform;
		[[_rifle_MXM_mag_tr,3],[_smokegrenadeY,6],[_smokegrenadeG,6],[_smokegrenadeB,2],[_smokegrenadeP,2]] call _addToVest;
		[[_rifle_MXM_mag_tr,2],[_smokegrenadeG,5]] call _addToBackpack;
		if (call EFUNC(Common,isNight)) then {
			[[_chemG,5],[_chemR,5],[_handFlareG,2],[_IRGrenade,3]] call _addToBackpack;
		};
		_laserDesignator call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};
	
	case "dragontl": {
		[_goggles,_helmet,_uniform,_vest,_backpackRadio] call _addEquipment;
		[_rifleGL, _rifle_mag_tr, _glsmokeR] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_grenademini,2]] call _addToUniform;
		[[_rifle_mag_tr,3],[_smokegrenadeY,6],[_smokegrenadeG,6],[_mortarRangecard,1]] call _addToVest;
		[[_glsmokeR,5],[_glsmokeG,2],[_smokegrenadeG,5]] call _addToBackpack;
		if (call EFUNC(Common,isNight)) then {
			[[_chemG,5],[_chemR,5],[_handFlareG,2],[_IRGrenade,3],[_glflareIR,3],[_glflareW,3]] call _addToBackpack;
		};
		_laserDesignator call _addBino;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "dragon2": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4],[_grenademini,2]] call _addToUniform;
		[[_grenade,1],[_rifle_mag,4],[_mortarRangecard,1]] call _addToVest;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "dragon3": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4],[_grenademini,2]] call _addToUniform;
		[[_grenade,1],[_rifle_mag,4],[_mortarRangecard,1]] call _addToVest;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "jetp": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_smokegrenadeG,2]] call _addToUniform;
		[[_smokegrenadeG,2]] call _addToVest;
		[_map, _gps, "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "mat": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_MAT, _MAT_mag, ""] call _addLaunchers;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,3]] call _addToUniform;
		[[_grenademini,2],[_grenade,2],[_rifle_mag_tr,5]] call _addToVest;
		[[_MAT_mag,1],[_MAT_mag_HE,2]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "amat": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,3]] call _addToUniform;
		[[_grenademini,2],[_grenade,2],[_rifle_mag_tr,6]] call _addToVest;
		[[_MAT_mag,2],[_MAT_mag_HE,2]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	case "ammg": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_rifle, _rifle_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,4],[_grenademini,2]] call _addToUniform;
		[[_grenade,1],[_rifle_mag_tr,7]] call _addToVest;
		[[_MMG_mag_tr,COUNT_AG_MAGS(_MMG_mag_tr)]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
		_rangefinder call _addBino;
	};

	case "mmg": {
		[_goggles,_helmet,_uniform,_vest,_backpack] call _addEquipment;
		[_MMG, _MMG_mag, ""] call _addPrimary;
		[_pistol, _pistol_mag, ""] call _addHandGun;
		_IFAK call _addToUniform;
		[[_pistol_mag,2],[_smokegrenadeY,2],[_grenademini,2]] call _addToUniform;
		[[_grenade,2],[_MMG_mag,COUNT_AR_MAGS(_MMG_mag)]] call _addToVest;
		[[_MMG_mag_tr,COUNT_AR_MAGS(_MMG_mag_tr)]] call _addToBackpack;
		[_map, "", "", _compass, _watch, _nvg] call _addLinkedItems;
	};

	default {
		ERROR(FORMAT_2("ERROR: Unit: %1 Role does not exist: %2", _unit, _role));
		[_unit, "r"] call FUNC(Handler);
	};
};

if ((call EFUNC(Common,isNight)) && (isPlayer _unit)) then {
	[[_mapFlashLight,1],[_IRStrobe,1]] call _addToUniform;
};
