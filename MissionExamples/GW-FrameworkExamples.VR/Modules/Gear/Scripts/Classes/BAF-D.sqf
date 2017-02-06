
_goggles = "";
_helmet = "CUP_H_BAF_Helmet_Net_2_DDPM";
_uniform = "CUP_U_B_BAF_DDPM_S1_RolledUp";
_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier";
_backpack = "CUP_B_USMC_AssaultPack";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_rt1523g_big";
};

if (_role isEqualTo "sl") then {
	_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Officer";
};
if (_role in ["r","rat","mat","amat"]) then {
	_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Soldier2";
};
if (_role in ["ag","ammg"]) then {
	_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Medic";
	_backpack = "CUP_B_AssaultPack_Medic";
};
if (_role isEqualTo "crew") then {
	_helmet = "CUP_H_BAF_Crew_Helmet_DDPM";
	_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Crewman";
};
if (_role isEqualTo "p") then {
	_helmet = "CUP_H_BAF_Helmet_Pilot";
	_uniform = "CUP_U_B_BAF_DDPM_S2_UnRolled";
	_vest = "CUP_V_BAF_Osprey_Mk2_DDPM_Pilot";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["CUP_arifle_L85A2", _silencer, _pointer, _sight, _bipod];
_rifleC = ["SMG_05_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["CUP_arifle_L85A2_GL", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_556x45_Stanag";
_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_rifleC_mag = "30Rnd_9x21_Mag_SMG_02";

_LMG = ["CUP_lmg_L110A1", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1";

_MMG = ["CUP_lmg_L7A2", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";

_LAT = ["launch_NLAW_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "NLAW_F";
_LAT_ReUsable = false;

_MAT = ["CUP_launch_Javelin", _silencer, _pointer, "CUP_optic_SMAW_Scope", _bipod];
_MAT_mag = "CUP_Javelin_M";

_pistol = ["CUP_hgun_M9", _silencer, _pointer, "optic_MRD", _bipod];
_pistol_mag = "CUP_15Rnd_9x19_M9";

_silencer = "CUP_muzzle_snds_AWM";
_pointer = "";
_sight = "optic_LRPS";
_bipod = "CUP_bipod_Harris_1A2_L";

_rifleMarksman = ["CUP_srifle_AWM_des", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "CUP_5Rnd_86x70_L115A1";
_rifleMarksman_mag_tr = "CUP_5Rnd_86x70_L115A1";
