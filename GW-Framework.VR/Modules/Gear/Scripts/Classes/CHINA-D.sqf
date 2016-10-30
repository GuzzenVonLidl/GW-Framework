_loadoutFile = "CHINA";

_glHE = "VME_1Rnd_HE_GL";
_glsmokeW = "VME_1Rnd_Smoke_GL";
_glsmokeB = "";
_glsmokeG = "";
_glsmokeO = "";
_glsmokeP = "";
_glsmokeR = "";
_glsmokeY = "";

_glflareG = "";
_glflareR = "";

_goggles = "";
_helmet = "VME_PLA_Helmet_D_R";
_uniform = "PLA_CombatUniform_HM_SBCB";
_vest = "PLA_T15Vest_RD_D";
_backpack = "B_AssaultPack_rgr";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_rt1523g_big_bwmod_tropen";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "B_Carryall_khk";
};
if (_role in ["ar","mmg"]) then {
	_vest = "PLA_B04_MG_D";
};
if (_role isEqualTo "crew") then {
	_helmet = "H_HelmetCrew_O_ghex_F";
	_uniform = "U_O_T_Soldier_F";
};
if (_role isEqualTo "p") then {
	_helmet = "H_PilotHelmetHeli_O";
	_uniform = "U_I_pilotCoveralls";
	_vest = "V_TacVest_oli";
};

_silencer = "VME_QBZ95_1_Silencer";
_silencerC = "VME_QCW05_Silencer";
_pointer = "VME_QBZ95_laser_RED_flashlight";
_sight = "VME_Eotech553";
_bipod = "VME_rail_scopes";
_bipodC = "VME_qcw05_rail_scopes";
_bipodLMG = "VME_QJB95_1_bipod_rail";
_bipodMMG = "VME_QJY88_bipod";

_rifle = ["vme_pla_qbz95_1", _silencer, _pointer, _sight, _bipod];
_rifleC = ["vme_pla_qcw05", _silencerC, _pointer, _sight, _bipodC];
_rifleGL = ["vme_pla_qbz95_1GL", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "VME_QBZ95_1_30Rnd_DBP87";
_rifle_mag_tr = "VME_QBZ95_1_30Rnd_DBP10_Tracer_Green";
_rifleC_mag = "VME_QCW05_50Rnd_DCV05";
_rifleC_mag_tr = "VME_QCW05_50Rnd_DAP92";

_LMG = ["vme_pla_qjb95_1", _silencer, _pointer, _sight, _bipodLMG];
_LMG_mag = "VME_QJB95_1_75Rnd_DBP87";
_LMG_mag_tr = "VME_QJB95_1_75Rnd_DBP10_Tracer_Green";

_MMG = ["VME_PLA_QJY88", _silencer, _pointer, _sight, _bipodMMG];
_MMG_mag = "VME_QJY88_200Rnd_DBP10";
_MMG_mag_tr = "VME_QJY88_200Rnd_DBP10_Tracer_Green";

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_LAT = ["vme_pla_PF89B", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "";
_LAT_ReUsable = false;

_MAT = ["vme_pla_PF98", _silencer, _pointer, "VME_PF98_Scope_FCS", _bipod];
_MAT_mag = "vme_pla_PF98_AT_Rocket";
_MAT_mag_HE = "";

_pistol = ["hgun_Rook40_F", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "16Rnd_9x21_Mag";
