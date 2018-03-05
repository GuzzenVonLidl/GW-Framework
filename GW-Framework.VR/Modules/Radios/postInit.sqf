#include "script_Component.hpp"

if (GVARMAIN(mod_ACRE)) then {
};

if (GVARMAIN(mod_TFAR)) then {
	[QGVARMAIN(missionLoaded), {
		private _group = (group player);
		_group setVariable ["TF_sw_frequency", TF_freq_west];
		_group setVariable ["TF_dd_frequency", TF_freq_west];
		_group setVariable ["TF_lr_frequency", TF_freq_west_lr];
	}] call CBA_fnc_addEventHandler;

	[QGVARMAIN(playerReady), {
		player setVariable ["TF_receivingDistanceMultiplicator", 2];
		player setVariable ["TF_sendingDistanceMultiplicator", 0.5];
		player setVariable [QGVAR(receiving), (player getVariable "TF_receivingDistanceMultiplicator")];

		private _group = (group player);
		if !((_group getVariable "TF_lr_frequency") isEqualTo TF_freq_west_lr) then {
			_group setVariable ["TF_sw_frequency", TF_freq_west];
			_group setVariable ["TF_dd_frequency", TF_freq_west];
			_group setVariable ["TF_lr_frequency", TF_freq_west_lr];
			ERROR("Radio frequency failed, launching backup");
		};
	}] call CBA_fnc_addEventHandler;

	[QGVAR(setRadioLoss), {
		params ["_unit","_radioLossReceiving","_radioLossSending"];
		_unit setVariable ["TF_receivingDistanceMultiplicator", _radioLossReceiving];
//		systemChat format ["RadioLoss:%1, %2", _radioLossReceiving, _radioLossSending]
	}] call CBA_fnc_addEventHandler;
};
/*
// Testing
[] spawn {
	while {true} do {
		_reciving = (player getVariable "TF_receivingDistanceMultiplicator");
		_sending = (player getVariable "TF_sendingDistanceMultiplicator");
		hintSilent format ["%1  |  %2", _reciving, _sending];
		sleep 0.1;
	};
};
*/
