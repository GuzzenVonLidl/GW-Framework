
_goggles = "";
_helmet = "";
_uniform = "";
_vest = "";
_backpack = "";

_goggles = "rhs_googles_clear";
_helmet = selectRandom ["rhsusf_lwh_helmet_marpatwd_ess","rhsusf_lwh_helmet_marpatwd"];
_uniform = "rhs_uniform_FROG01_wd";
//_vest = "rhsusf_spc_rifleman";
_vest = "rhsusf_spc_light";
_backpack = "rhsusf_falconii_coy_gr";
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_mr3000_multicam";
};

if (_role in ["ftl","sl"]) then {
	_vest = "rhsusf_spc_teamleader";
};

if (_role in ["r","rat","mat","amat"]) then {
	_vest = "CUP_V_B_MTV_Pouches";
};
if (_role in ["ag","ammg"]) then {
	_vest = "rhsusf_spc_corpsman";
	_backpack = "rhsusf_assault_eagleaiii_coy_medic";
};
if (_role in ["ar","mmg"]) then {
	_vest = "rhsusf_spc_mg";
	_backpack = "rhsusf_assault_eagleaiii_coy_mg";
};

if (_role isEqualTo "crew") then {
	_helmet = "rhsusf_cvc_green_helmet";
	_vest = "rhsusf_spc_crewman";
};
if (_role isEqualTo "p") then {
	_helmet = "rhsusf_hgu56p";
	_vest = "rhsusf_spc_crewman";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["arifle_SPAR_01_blk_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["SMG_05_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["arifle_SPAR_01_GL_blk_F", _silencer, _pointer, _sight, _bipod];
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

_silencer = "muzzle_snds_B";
_pointer = "";
_sight = "optic_LRPS";
_bipod = "CUP_bipod_Harris_1A2_L";

_rifleMarksman = ["CUP_srifle_M14_DMR", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "CUP_20Rnd_762x51_DMR";
_rifleMarksman_mag_tr = "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
