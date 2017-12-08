#include "script_Component.hpp"

PREP(add);
//PREP(getJammer);
PREP(groupInit);
PREP(jammer);

if (GVARMAIN(mod_ACRE)) then {
	#include "Functions\ACRE_Init.sqf"
};

if (GVARMAIN(mod_TFAR)) then {
	if (GVARMAIN(mod_TFAR_CORE)) then {
		#include "Functions\TFAR_Init_New.sqf"
	} else {
		#include "Functions\TFAR_Init.sqf"
	};

	["CAManBase", "init", {
		[{
			_this call FUNC(groupInit);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	[QGVAR(setRadioLoss), {
		params ["_unit","_radioLossReceiving","_radioLossSending"];
		_unit setVariable ["tf_receivingDistanceMultiplicator", _radioLossReceiving];
		_unit setVariable ["TF_sendingDistanceMultiplicator", _radioLossSending];
//		systemChat format ["RadioLoss:%1, %2", _radioLossReceiving, _radioLossSending]
	}] call CBA_fnc_addEventHandler;
};
/*
[] spawn {	// Testing
	while {true} do {
		_reciving = (player getVariable "tf_receivingDistanceMultiplicator");
		_sending = (player getVariable "TF_sendingDistanceMultiplicator");
		hintSilent format ["%1  |  %2", _reciving, _sending];
		sleep 0.1;
	};
};
*/
