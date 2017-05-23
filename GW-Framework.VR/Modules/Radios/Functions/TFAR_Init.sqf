
[QGVARMAIN(missionLoaded), {	// TFAR calls cba settings in postInit so this needs a delay
	[{
		_disableAutoLongRange = true;
		_givePersonalRadio = false;
		_giveMicroDager = false;
		_same_SW_Freq = true;
		_same_LR_Freq = true;
		_same_DD_Freq = true;

		["TF_no_auto_long_range_radio", _disableAutoLongRange, true, "server"] call CBA_settings_fnc_set;
		["TF_give_personal_radio_to_regular_soldier", _givePersonalRadio, true, "server"] call CBA_settings_fnc_set;
		["TF_give_microdagr_to_soldier", _giveMicroDager, true, "server"] call CBA_settings_fnc_set;
		["TF_same_sw_frequencies_for_side", _same_SW_Freq, true, "server"] call CBA_settings_fnc_set;
		["TF_same_lr_frequencies_for_side", _same_LR_Freq, true, "server"] call CBA_settings_fnc_set;
		["TF_same_dd_frequencies_for_side", _same_DD_Freq, true, "server"] call CBA_settings_fnc_set;
	}, [], 0.1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

TF_west_radio_code = "_golclan";
TF_east_radio_code = "_golclan";
TF_guer_radio_code = "_golclan";

TF_freq_west =    [0 ,6, ["10","20","30","40","50.1","50.2","50.3","50.5"],0, nil, -1, 0];
TF_freq_west_lr = [4 ,6, ["10","20","30","40","50.1","50.2","50.3","50.4","50.5"],0, nil, -1, 0];
TF_freq_east  =   TF_freq_west;
TF_freq_east_lr = TF_freq_west_lr;
TF_freq_guer  =   TF_freq_west;
TF_freq_guer_lr = TF_freq_west_lr;

TF_defaultWestAirborneRadio = "TF_rt1523g";
TF_defaultWestBackpack = "TF_rt1523g";

TF_defaultWestPersonalRadio = "TF_anprc152";
TF_defaultWestRiflemanRadio = "TF_pnr1000a";

TF_defaultEastAirborneRadio = TF_defaultWestAirborneRadio;
TF_defaultEastBackpack = TF_defaultWestBackpack;
TF_defaultEastPersonalRadio = TF_defaultWestPersonalRadio;
TF_defaultEastRiflemanRadio = TF_defaultWestRiflemanRadio;

TF_defaultGuerAirborneRadio = TF_defaultWestAirborneRadio;
TF_defaultGuerBackpack = TF_defaultWestBackpack;
TF_defaultGuerPersonalRadio = TF_defaultWestPersonalRadio;
TF_defaultGuerRiflemanRadio = TF_defaultWestRiflemanRadio;

//	NOTE: Experamental values
 // 7.0
TF_terrain_interception_coefficient = 10.0;
TF_max_voice_volume = 40;
TF_speakerDistance = 15;
