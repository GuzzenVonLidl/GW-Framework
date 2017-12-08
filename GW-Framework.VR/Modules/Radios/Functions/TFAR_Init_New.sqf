
_disableAutoLongRange = true;
_givePersonalRadio = false;
_giveMicroDager = false;
_same_SW_Freq = true;
_same_LR_Freq = true;
_fullDuplex = true;
_enableIntercom = true;
_objectInterceptionEnabled = true;
_spectatorCanHearEnemyUnits = true;
_spectatorCanHearFriendlies = true;

["TFAR_giveLongRangeRadioToGroupLeaders", _disableAutoLongRange, true, "server"] call CBA_settings_fnc_set;
["TFAR_givePersonalRadioToRegularSoldier", _givePersonalRadio, true, "server"] call CBA_settings_fnc_set;
["TFAR_giveMicroDagrToSoldier", _giveMicroDager, true, "server"] call CBA_settings_fnc_set;
["TFAR_SameSRFrequenciesForSide", _same_SW_Freq, true, "server"] call CBA_settings_fnc_set;
["TFAR_SameLRFrequenciesForSide", _same_LR_Freq, true, "server"] call CBA_settings_fnc_set;
["TFAR_fullDuplex", _fullDuplex, true, "server"] call CBA_settings_fnc_set;
["TFAR_enableIntercom", _enableIntercom, true, "server"] call CBA_settings_fnc_set;
["TFAR_objectInterceptionEnabled", _objectInterceptionEnabled, true, "server"] call CBA_settings_fnc_set;
["TFAR_spectatorCanHearEnemyUnits", _spectatorCanHearEnemyUnits, true, "server"] call CBA_settings_fnc_set;
["TFAR_spectatorCanHearFriendlies", _spectatorCanHearFriendlies, true, "server"] call CBA_settings_fnc_set;

TF_west_radio_code = "_golclan";
TF_east_radio_code = "_golclan";
TF_independent_radio_code = "_golclan";

_SR_Freq = [0 ,TFAR_default_radioVolume, ["10","20","30","40","50.1","50.2","50.3","50.5"],0, nil, -1, 0];
TFAR_defaultFrequencies_sr_west = _SR_Freq;
TFAR_defaultFrequencies_sr_east = _SR_Freq;
TFAR_defaultFrequencies_sr_independent = _SR_Freq;

_LR_Freq = [4 ,TFAR_default_radioVolume, ["10","20","30","40","50.1","50.2","50.3","50.4","50.5"],0, nil, -1, 0];
TFAR_defaultFrequencies_lr_west = _LR_Freq;
TFAR_defaultFrequencies_lr_east = _LR_Freq;
TFAR_defaultFrequencies_lr_independent = _LR_Freq;

_rifleman = "TF_pnr1000a";
TFAR_DefaultRadio_Rifleman_West = _rifleman;
TFAR_DefaultRadio_Rifleman_East = _rifleman;
TFAR_DefaultRadio_Rifleman_Independent = _rifleman;

_personal = "TF_anprc152";
TFAR_DefaultRadio_Personal_West = _personal;
TFAR_DefaultRadio_Personal_East = _personal;
TFAR_DefaultRadio_Personal_Independent = _personal;

_backpack = "TF_rt1523g";
TFAR_DefaultRadio_Backpack_West = _backpack;
TFAR_DefaultRadio_Backpack_East = _backpack;
TFAR_DefaultRadio_Backpack_Independent = _backpack;

TFAR_DefaultRadio_Airborne_West = _backpack;
TFAR_DefaultRadio_Airborne_East = _backpack;
TFAR_DefaultRadio_Airborne_Independent = _backpack;


TF_terrain_interception_coefficient = 10.0;

tf_radio_channel_name = "TaskForceRadio";
tf_radio_channel_password = "123";
