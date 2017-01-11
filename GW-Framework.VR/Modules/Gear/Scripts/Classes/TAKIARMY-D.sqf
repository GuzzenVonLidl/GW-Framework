_allowedNightStuff = false;

_goggles = "";
_helmet = "CUP_H_TK_Helmet";
_uniform = "CUP_U_O_TK_Green";
_vest = "V_TacVest_oli";
_backpack = "CUP_B_CivPack_WDL";
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_mr6000l";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "CUP_B_ACRPara_m95";
};
if (_role isEqualTo "crew") then {
	_helmet = "CUP_H_TK_TankerHelmet";
	_uniform = "CUP_U_O_TK_MixedCamo";
	_vest = "CUP_V_O_TK_CrewBelt";
};
if (_role isEqualTo "p") then {
	_helmet = "CUP_H_TK_PilotHelmet";
	_uniform = "CUP_U_O_TK_MixedCamo";
	_vest = "CUP_V_O_TK_CrewBelt";
};

// Detect Dragon Gunners and change backpack accordingly
if (_role isEqualTo "dragon2") then {
	_backpack = "I_Mortar_01_weapon_F";
};

// Detect Dragon Asst. Gunners and change backpack accordingly
if (_role isEqualTo "dragon3") then {
	_backpack = "I_Mortar_01_support_F";
};

// Detect Jet Pilot and change uniform/helmet/vest accordingly
if (_role isEqualTo "jetp") then {
	_helmet = "H_PilotHelmetFighter_I";
	_uniform = "U_I_PilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["CUP_arifle_FNFAL", _silencer, _pointer, _sight, _bipod];
_rifleC = ["arifle_AKS_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["CUP_arifle_M16A2_GL", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "CUP_20Rnd_762x51_FNFAL_M";
_rifleC_mag = "30Rnd_545x39_Mag_Tracer_F";
_rifleGL_mag = "30Rnd_556x45_Stanag";
_rifleGL_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

_LMG = ["CUP_arifle_RPK74", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";

_MMG = ["CUP_lmg_PKM", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";

_LAT = ["CUP_launch_RPG18", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "";
_LAT_ReUsable = false;

_MAT = ["launch_RPG7_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG7_F";

_pistol = ["CUP_hgun_PB6P9", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "CUP_8Rnd_9x18_Makarov_M";

// MXM Attachments
_silencer = "";
_pointer = "CUP_SVD_camo_g";
_sight = "CUP_optic_PSO_3";
_bipod = "";

// MXM
_rifleMXM = ["CUP_srifle_SVD", _silencer, _pointer, _sight, _bipod];
_rifle_MXM_mag = "CUP_10Rnd_762x54_SVD_M";
_rifle_MXM_mag_tr = "CUP_10Rnd_762x54_SVD_M";

///////////////////////////////////////////////////////////////////////////////////////

// SMG Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

// SMG
_smg = ["CUP_arifle_AKS74U", _silencer, _pointer, _sight, _bipod];
_smg_mag = "CUP_30Rnd_545x39_AK_M";
_smg_mag_tr = "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M";