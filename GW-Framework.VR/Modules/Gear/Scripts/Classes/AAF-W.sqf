
_goggles = "";
_helmet = selectRandom ["H_HelmetIA_net","H_HelmetIA_camo","H_HelmetIA"];
_uniform = selectRandom ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt"];
_vest = selectRandom ["V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl"];
_backpack = "B_FieldPack_oli";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_anprc155";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "B_Carryall_oli";
};

if (_role isEqualTo "crew") then {
	_helmet = "H_HelmetCrew_I";
	_vest = "V_TacVest_oli";
};

if (_role isEqualTo "p") then {
	_helmet = "H_PilotHelmetHeli_I";
	_uniform = "U_I_HeliPilotCoveralls";
	_vest = "V_TacVest_oli";
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
	_uniform = "U_I_pilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["arifle_Mk20_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["arifle_Mk20C_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["arifle_Mk20_GL_F", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_556x45_Stanag";
_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

_LMG = ["LMG_Mk200_F", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "200Rnd_65x39_cased_Box";
_LMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";

_MMG = ["LMG_Mk200_F", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "200Rnd_65x39_cased_Box";
_MMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";

_LAT = ["launch_NLAW_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "NLAW_F";
_LAT_ReUsable = false;

_MAT = ["launch_RPG32_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG32_F";
_MAT_mag_HE = "RPG32_HE_F";

_pistol = ["hgun_ACPC2_F", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "9Rnd_45ACP_Mag";

// MXM Attachments
_silencer = "muzzle_snds_B_khk_F";
_pointer = "acc_pointer_IR";
_sight = "optic_LRPS_tna_F";
_bipod = "bipod_03_F_oli";

// MXM
_rifleMXM = ["srifle_DMR_03_woodland_F", _silencer, _pointer, _sight, _bipod];
_rifle_MXM_mag = "20Rnd_762x51_Mag";
_rifle_MXM_mag_tr = "20Rnd_762x51_Mag";

// SMG Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

// SMG
_smg = ["hgun_PDW2000_F", _silencer, _pointer, _sight, _bipod];
_smg_mag = "30Rnd_9x21_Mag";
_smg_mag_tr = "30Rnd_9x21_Red_Mag";