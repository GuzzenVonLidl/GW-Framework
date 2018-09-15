#include "script_Component.hpp"

if (GVARMAIN(mod_ACRE)) then {
};

if (GVARMAIN(mod_TFAR)) then {
	[QGVARMAIN(playerReady), {
		player setVariable ["TF_receivingDistanceMultiplicator", 1];
		player setVariable ["TF_sendingDistanceMultiplicator", 0.9];
		player setVariable [QGVAR(receiving), (player getVariable ["TF_receivingDistanceMultiplicator", 1])];

		_group = (group player);
		_group setVariable ["TF_sw_frequency", TF_freq_west];
		_group setVariable ["TF_dd_frequency", TF_freq_west];
		_group setVariable ["TF_lr_frequency", TF_freq_west_lr];

		[player] spawn FUNC(interference);
	}] call CBA_fnc_addEventHandler;

	[QGVAR(setRadioLoss), {
		params ["_unit","_radioLossReceiving"];
		_unit setVariable ["TF_receivingDistanceMultiplicator", _radioLossReceiving];
		#ifdef DEBUG_MODE_FULL
			systemChat format ["RadioLoss:%1", _radioLossReceiving];
		#endif
	}] call CBA_fnc_addEventHandler;
};

#ifdef DEBUG_MODE_FULL
	[] spawn {
		[mhq_1, 500, 50] spawn GW_Radios_fnc_addJammer;

		while {true} do {
			_reciving = (player getVariable ["TF_receivingDistanceMultiplicator", 1]);
			_arr1 = (GW_Radios_AllJamers apply {_x distance player});
			_arr2 = (GW_Radios_AllJamers apply {_x distance player});
			_arr1 sort true;
			_object = (GW_Radios_AllJamers select (_arr2 find (_arr1 select 0)));

			hintSilent format ["%1  |  %2  |  %3", _reciving, round(player distance mhq_1), _object];
			sleep 0.1;
		};
	};
#endif
