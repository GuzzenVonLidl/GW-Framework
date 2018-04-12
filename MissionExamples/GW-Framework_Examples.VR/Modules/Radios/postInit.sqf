#include "script_Component.hpp"

if (GVARMAIN(mod_ACRE)) then {
};

if (GVARMAIN(mod_TFAR)) then {

	["CAManBase", "init", {
		[{
			_this call FUNC(groupInit);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	[QGVAR(setRadioLoss), {
		params ["_unit","_radioLossReceiving","_radioLossSending"];
		_unit setVariable ["tf_receivingDistanceMultiplicator", _radioLossReceiving];
		_unit setVariable ["TF_sendingDistanceMultiplicator", _radioLossSending];	// 0.001 min for radio
//		systemChat format ["RadioLoss:%1, %2", _radioLossReceiving, _radioLossSending]
	}] call CBA_fnc_addEventHandler;
};
/*
// Testing
[] spawn {
	while {true} do {
		_reciving = (player getVariable "tf_receivingDistanceMultiplicator");
		_sending = (player getVariable "TF_sendingDistanceMultiplicator");
		hintSilent format ["%1  |  %2", _reciving, _sending];
		sleep 0.1;
	};
};
*/
