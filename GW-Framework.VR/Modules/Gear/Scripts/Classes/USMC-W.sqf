
_goggles = "";
_helmet = "CUP_H_USMC_HelmetWDL";
_uniform = "CUP_U_B_USMC_MARPAT_WDL_TwoKneepads";
_vest = "CUP_V_B_MTV_TL";
_backpack = "CUP_B_USMC_AssaultPack";
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_mr3000_multicam";
};

if (_role in ["r","rat","mat","amat"]) then {
	_vest = "CUP_V_B_MTV_Pouches";
};
if (_role in ["ag","ammg"]) then {
	_vest = "CUP_V_B_MTV_LegPouch";
	_backpack = "CUP_B_USMC_MOLLE";
};
if (_role in ["ar","mmg"]) then {
	_vest = "CUP_V_B_MTV_MG";
};
if (_role isEqualTo "crew") then {
	_helmet = "CUP_H_USMC_Crew_Helmet";
	_uniform = "CUP_U_B_USMC_MARPAT_WDL_Sleeves";
	_vest = "CUP_V_B_MTV";
};
if (_role isEqualTo "p") then {
	_helmet = "CUP_H_USMC_Helmet_Pilot";
	_uniform = "CUP_U_B_USMC_PilotOverall";
	_vest = "CUP_V_B_PilotVest";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["CUP_arifle_M16A4_Base", _silencer, _pointer, _sight, _bipod];
_rifleC = ["SMG_05_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["CUP_arifle_M16A4_GL", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_556x45_Stanag";
_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_rifleC_mag = "30Rnd_9x21_Mag_SMG_02";
_rifleC_mag_tr = "30Rnd_9x21_Mag_SMG_02";

_LMG = ["CUP_lmg_M249", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";

_MMG = ["CUP_lmg_M240", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";

_LAT = ["CUP_launch_M136", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "";
_LAT_ReUsable = false;

_MAT = ["CUP_launch_Mk153Mod0", _silencer, _pointer, "CUP_optic_SMAW_Scope", _bipod];
_MAT_mag = "CUP_SMAW_HEDP_M";
_MAT_mag_HE = "CUP_SMAW_HEAA_M";

_pistol = ["CUP_hgun_M9", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "CUP_15Rnd_9x19_M9";
