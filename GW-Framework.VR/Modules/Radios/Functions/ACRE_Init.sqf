
/*
	private _setupBabel = false;
	private _setupPerSideRadios = true;
	[_setupBabel, _setupPerSideRadios] call acre_api_fnc_setupMission;
	[false] call acre_api_fnc_setInterference;
	[true] call acre_api_fnc_setFullDuplex;
	[true] call acre_api_fnc_ignoreAntennaDirection;

		[_x, "default", 1, "label", "1-1 NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 2, "label", "1-2 NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 3, "label", "1-3 NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 4, "label", "CONVOY NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 5, "label", "PLATOON NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 6, "label", "FAC NET"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 7, "label", "AAC NET"] call acre_api_fnc_setPresetChannelField;
*/

[{
	// Indiciates how much terrian loss should be modelled. Values: 0 no loss, 1 full terrian loss, default: 1
	[0.8] call acre_api_fnc_setLossModelScale;

	// Sets the duplex of radio transmissions. If set to true, it means that you will receive transmissions even while talking and multiple people can speak at the same time.
	[false] call acre_api_fnc_setFullDuplex;

	// Sets whether transmissions will interfere with eachother. This, by default, causes signal loss when multiple people are transmitting on the same frequency.
	[true] call acre_api_fnc_setInterference;

	// False - AI not hear players, true - AI hear players.
	[true] call acre_api_fnc_setRevealToAI;

	[true] call acre_api_fnc_ignoreAntennaDirection;

	{
		[_x, "default", 1, "label", "NET-1-1"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 2, "label", "NET-1-2"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 3, "label", "NET-1-3"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 4, "label", "NET-CONVOY"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 5, "label", "NET-PLATOON"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 6, "label", "NET-FAC"] call acre_api_fnc_setPresetChannelField;
		[_x, "default", 7, "label", "NET-AAC"] call acre_api_fnc_setPresetChannelField;
	} forEach ["ACRE_PRC148","ACRE_PRC152","ACRE_PRC117F"];	// No ACRE_PRC343
}, [], 1] call CBA_fnc_waitAndExecute;
