/*
	TFAR_fnc_processRespawn = GW_fnc_Dummy;
	TFAR_fnc_processGroupFrequencySetting = GW_fnc_Dummy;
	TFAR_fnc_sessionTracker = GW_fnc_Dummy;
*/

	TF_west_radio_code = "_golclan";
	TF_east_radio_code = "_golclan";
	TF_guer_radio_code = "_golclan";
	TF_give_personal_radio_to_regular_soldier = false;
	TF_give_microdagr_to_soldier = false;
	TF_no_auto_long_range_radio = true;
	TF_same_sw_frequencies_for_side = true;
	TF_same_lr_frequencies_for_side = true;
	TF_same_dd_frequencies_for_side = true;

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
	TF_terrain_interception_coefficient = 9.0;	// 7.0
	TF_max_voice_volume = 80;					// 60
	TF_speakerDistance = 15;					// 20
