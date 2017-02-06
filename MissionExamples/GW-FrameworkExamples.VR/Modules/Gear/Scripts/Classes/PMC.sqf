_allowedNightStuff = false;

_goggles = selectRandom ["G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli"];
_helmet = selectRandom ["H_Shemag_olive","H_ShemagOpen_tan","H_Bandanna_khk","H_Booniehat_khk","H_Cap_oli","H_Watchcap_blk"];
_uniform = selectRandom ["U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F"];
_vest = "V_TacVest_oli";
_backpack = "B_FieldPack_khk";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_anprc155";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "B_Carryall_oli";
};
if (_role isEqualTo "crew") then {
	_vest = selectRandom ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli"];
};
if (_role isEqualTo "p") then {
	_helmet = "H_PilotHelmetHeli_I";
	_uniform = "U_B_HeliPilotCoveralls";
	_vest = "V_TacVest_blk";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["arifle_AKM_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["arifle_AKS_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["arifle_AK12_GL_F", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_762x39_Mag_F";
_rifle_mag_tr = "30Rnd_762x39_Mag_Tracer_F";
_rifleC_mag = "30Rnd_545x39_Mag_F";
_rifleC_mag_tr = "30Rnd_545x39_Mag_Tracer_F";

_LMG = ["LMG_03_F", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "200Rnd_556x45_Box_Red_F";
_LMG_mag_tr = "200Rnd_556x45_Box_Tracer_Red_F";

_MMG = ["LMG_Mk200_F", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "200Rnd_65x39_cased_Box";
_MMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";

_LAT = ["launch_NLAW_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "NLAW_F";
_LAT_ReUsable = false;

_MAT = ["launch_RPG32_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG32_F";
_MAT_mag_HE = "RPG32_HE_F";

_pistol = ["hgun_Pistol_01_F", _silencer, _pointer, "optic_MRD", _bipod];
_pistol_mag = "10Rnd_9x21_Mag";

_silencer = "muzzle_snds_B";
_pointer = "acc_pointer_IR";
_sight = "optic_LRPS";
_bipod = "bipod_01_F_blk";

_rifleMarksman = ["srifle_DMR_03_F", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "20Rnd_762x51_Mag";
_rifleMarksman_mag_tr = "20Rnd_762x51_Mag";
