
_goggles = "";
_helmet = "CUP_H_USArmy_HelmetMICH";
_uniform = "CUP_U_B_USArmy_TwoKnee";
_vest = "CUP_V_B_IOTV_TL";
_backpack = "CUP_B_AssaultPack_ACU";
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_mr3000_multicam";
};

if (_role in ["r","rat","mat","amat"]) then {
	_vest = "CUP_V_B_IOTV_AT";
};
if (_role in ["ag","ammg"]) then {
	_vest = "CUP_V_B_IOTV_Medic";
	_backpack = "CUP_B_MedicPack_ACU";
};
if (_role in ["ar","mmg"]) then {
	_vest = "CUP_V_B_IOTV_MG";
};
if (_role isEqualTo "crew") then {
	_helmet = "CUP_H_USMC_Crew_Helmet";
	_vest = "CUP_V_B_IOTV_Rifleman";
};
if (_role isEqualTo "p") then {
	_helmet = "CUP_H_USMC_Helmet_Pilot";
	_uniform = "CUP_U_B_USArmy_PilotOverall";
	_vest = "CUP_V_B_USArmy_PilotVest";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["CUP_arifle_Mk16_STD_FG", _silencer, _pointer, _sight, _bipod];
_rifleC = ["CUP_arifle_Mk16_CQC", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["CUP_arifle_Mk16_STD_EGLM", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_556x45_Stanag";
_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

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

_silencer = "muzzle_snds_B";
_pointer = "";
_sight = "optic_LRPS";
_bipod = "CUP_bipod_Harris_1A2_L";

_rifleMarksman = ["CUP_srifle_M14_DMR", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "CUP_20Rnd_762x51_DMR";
_rifleMarksman_mag_tr = "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
