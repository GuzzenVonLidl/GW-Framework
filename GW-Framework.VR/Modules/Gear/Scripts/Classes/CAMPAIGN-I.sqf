
// Cloths
_goggles = "";
_helmet = "";
_uniform = "";
_vest = "";
_backpack = "";
_backpackRadio = _backpack;
if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "";
};

if (_role in ["ag","ammg"]) then {
	_backpack = "";
};
if (_role isEqualTo "crew") then {
	_helmet = "";
	_vest = "";
};
if (_role isEqualTo "p") then {
	_helmet = "";
	_uniform = "";
	_vest = "";
};

// Detect Dragon Gunners and change backpack accordingly
if (_role isEqualTo "dragon2") then {
	_backpack = "";
};

// Detect Dragon Asst. Gunners and change backpack accordingly
if (_role isEqualTo "dragon3") then {
	_backpack = "";
};

// Detect Jet Pilot and change uniform/helmet/vest accordingly
if (_role isEqualTo "jetp") then {
	_helmet = "";
	_uniform = "";
	_vest = "";
	_backpack = "";
};

// Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

// Primary Weapon
_rifle = ["", _silencer, _pointer, _sight, _bipod];
_rifleC = ["", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "";
_rifle_mag_tr = "";

_LMG = ["", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "";
_LMG_mag_tr = "";

_MMG = ["", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "";
_MMG_mag_tr = "";

// Launchers
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_LAT = ["", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "";
_LAT_ReUsable = false;

_MAT = ["", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "";
_MAT_mag_HE = "";

// Pistol
_pistol = ["", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "";

// MXM Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

// MXM
_rifleMXM = ["", _silencer, _pointer, _sight, _bipod];
_rifle_MXM_mag = "";
_rifle_MXM_mag_tr = "";

///////////////////////////////////////////////////////////////////////////////////////

// SMG Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

// SMG
_smg = ["", _silencer, _pointer, _sight, _bipod];
_smg_mag = "";
_smg_mag_tr = "";