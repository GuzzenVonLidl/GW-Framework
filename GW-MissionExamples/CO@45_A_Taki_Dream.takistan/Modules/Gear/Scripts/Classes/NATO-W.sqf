
_goggles = "";
_helmet = "H_HelmetB_tna_F";
_uniform = "U_B_T_Soldier_F";
_vest = "V_PlateCarrier2_tna_F";
_backpack = "B_ViperHarness_oli_F";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_anprc155";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "B_Carryall_ghex_F";
};
if (_role isEqualTo "crew") then {
	_uniform = "U_B_T_Soldier_SL_F";
	_vest = "V_BandollierB_oli";
};
if (_role isEqualTo "p") then {
	_helmet = "H_PilotHelmetHeli_B";
	_uniform = "U_B_HeliPilotCoveralls";
	_vest = "V_TacVest_blk";
};

_silencer = "";
_pointer = "";
_sight = "optic_Aco";
_bipod = "";

_rifle = ["arifle_MX_khk_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["arifle_MXC_khk_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["arifle_MX_GL_khk_F", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_65x39_caseless_mag";
_rifle_mag_tr = "30Rnd_65x39_caseless_mag_Tracer";

_LMG = ["arifle_MX_SW_khk_F", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "100Rnd_65x39_caseless_mag";
_LMG_mag_tr = "100Rnd_65x39_caseless_mag_Tracer";

_MMG = ["LMG_Mk200_F", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "200Rnd_65x39_cased_Box";
_MMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_LAT = ["launch_NLAW_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "NLAW_F";
_LAT_ReUsable = false;

_MAT = ["launch_RPG32_ghex_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG32_F";
_MAT_mag_HE = "RPG32_HE_F";

_pistol = ["hgun_P07_khk_F", _silencer, _pointer, "optic_MRD", _bipod];
_pistol_mag = "16Rnd_9x21_Mag";
