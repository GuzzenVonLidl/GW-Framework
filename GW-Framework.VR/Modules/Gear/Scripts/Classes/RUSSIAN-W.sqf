
_glHE = "CUP_1Rnd_HE_GP25_M";
_glsmokeW = "CUP_1Rnd_SMOKE_GP25_M";
_glsmokeB = "";
_glsmokeG = "CUP_1Rnd_SmokeGreen_GP25_M";
_glsmokeO = "";
_glsmokeP = "";
_glsmokeR = "CUP_1Rnd_SmokeRed_GP25_M";
_glsmokeY = "CUP_1Rnd_SmokeYellow_GP25_M";

_glflareG = "CUP_FlareGreen_GP25_M";
_glflareR = "CUP_FlareRed_GP25_M";

_goggles = "";
_helmet = "CUP_H_RUS_6B27";
_uniform = "CUP_U_O_RUS_EMR_2_VDV";
_vest = "CUP_V_RUS_6B3_1";
_backpack = "CUP_B_AlicePack_Khaki";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_anprc155";
};

if (_role in ["r","rat","mat","amat"]) then {
	_backpack = "CUP_B_RUS_Pack_AT";
};
if (_role in ["ag","ammg"]) then {
	_vest = "CUP_V_RUS_6B3_3";
	_backpack = "CUP_B_RUS_Pack_Medic";
};
if (_role in ["ar","mmg"]) then {
	_uniform = "CUP_U_O_RUS_EMR_1_VDV";
	_vest = "CUP_V_RUS_6B3_2";
	_backpack = "CUP_B_RUS_Pack_AR";
};
if (_role isEqualTo "crew") then {
	_helmet = "CUP_H_RUS_TSH_4_Brown";
	_vest = "CUP_V_RUS_6B3_3";
};
if (_role isEqualTo "p") then {
	_helmet = "CUP_H_RUS_ZSH_Shield_Up";
	_uniform = "CUP_U_O_RUS_EMR_1_VDV";
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

_rifle = ["CUP_arifle_AK74M", _silencer, _pointer, _sight, _bipod];
_rifleC = ["CUP_arifle_AKS74U", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["CUP_arifle_AK74M_GL", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "CUP_30Rnd_545x39_AK_M";
_rifle_mag_tr = "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";

_LMG = ["CUP_arifle_RPK74M", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";

_MMG = ["CUP_lmg_Pecheneg", _silencer, _pointer, _sight, _bipod];
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