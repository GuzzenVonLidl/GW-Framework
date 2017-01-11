
_goggles = "";
_helmet = "H_HelmetB";
_uniform = "U_B_CombatUniform_mcam";
_vest = "V_PlateCarrier2_rgr";
_backpack = "B_FieldPack_khk";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_rt1523g_big";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "B_Kitbag_rgr";
};
if (_role isEqualTo "crew") then {
	_helmet = "H_HelmetCrew_B";
	_vest = "V_BandollierB_khk";
};
if (_role isEqualTo "p") then {
	_helmet = "H_PilotHelmetHeli_B";
	_uniform = "U_B_PilotCoveralls";
	_vest = "V_TacVest_blk";
};

// Detect Dragon Gunners and change backpack accordingly
if (_role isEqualTo "dragon2") then {
	_backpack = "B_Mortar_01_weapon_F";
};

// Detect Dragon Asst. Gunners and change backpack accordingly
if (_role isEqualTo "dragon3") then {
	_backpack = "B_Mortar_01_support_F";
};

// Detect Jet Pilot and change uniform/helmet/vest accordingly
if (_role isEqualTo "jetp") then {
	_helmet = "H_PilotHelmetFighter_B";
	_uniform = "U_B_PilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

_silencer = "";
_pointer = "";
_sight = "optic_Aco";
_bipod = "";

_rifle = ["arifle_MX_Black_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["arifle_MXC_Black_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["arifle_MX_GL_Black_F", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_65x39_caseless_mag";
_rifle_mag_tr = "30Rnd_65x39_caseless_mag_Tracer";

_LMG = ["arifle_MX_SW_Black_F", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "100Rnd_65x39_caseless_mag";
_LMG_mag_tr = "100Rnd_65x39_caseless_mag_Tracer";

_MMG = ["LMG_Mk200_F", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "200Rnd_65x39_cased_Box";
_MMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";

_sight = "";

_LAT = ["launch_NLAW_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "NLAW_F";
_LAT_ReUsable = false;
if (GVARMAIN(mod_ACE3)) then {
	_LAT_ReUsable = true;
};

_MAT = ["launch_RPG32_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG32_F";
_MAT_mag_HE = "RPG32_HE_F";

_pistol = ["hgun_Pistol_heavy_01_F", _silencer, _pointer, "optic_MRD", _bipod];
_pistol_mag = "11Rnd_45ACP_Mag";

// MXM Attachments
_silencer = "muzzle_snds_338_sand";
_pointer = "acc_pointer_IR";
_sight = "optic_LRPS";
_bipod = "bipod_01_F_snd";

// MXM
_rifleMXM = ["srifle_DMR_02_sniper_F", _silencer, _pointer, _sight, _bipod];
_rifle_MXM_mag = "10Rnd_338_Mag";
_rifle_MXM_mag_tr = "10Rnd_338_Mag";

///////////////////////////////////////////////////////////////////////////////////////

// SMG Attachments
_silencer = "muzzle_snds_L";
_pointer = "acc_pointer_IR";
_sight = "";
_bipod = "";

// SMG
_smg = ["SMG_05_F", _silencer, _pointer, _sight, _bipod];
_smg_mag = "30Rnd_9x21_Mag_SMG_02";
_smg_mag_tr = "30Rnd_9x21_Mag_SMG_02_Tracer_Red";