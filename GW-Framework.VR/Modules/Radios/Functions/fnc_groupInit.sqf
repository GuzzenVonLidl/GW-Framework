#include "script_Component.hpp"

[{
	params ["_unit"];
	if (isPlayer _unit) then {
		private _group = (group _unit);

		_group setVariable ["TF_sw_frequency", TF_freq_west];
		_group setVariable ["TF_dd_frequency", TF_freq_west];
		_group setVariable ["TF_lr_frequency", TF_freq_west_lr];
		[{
			params ["_unit"];
			private _group = group _unit;
			if !((_group getVariable "TF_lr_frequency") isEqualTo TF_freq_west_lr) then {
				_group setVariable ["TF_sw_frequency", TF_freq_west];
				_group setVariable ["TF_dd_frequency", TF_freq_west];
				_group setVariable ["TF_lr_frequency", TF_freq_west_lr];
				ERROR("Radio frequency failed, launching backup");
			};
			_unit setVariable ["TF_receivingDistanceMultiplicator", 0.4];
			_unit setVariable ["TF_sendingDistanceMultiplicator", 0.5];
			_unit setVariable [QGVAR(receiving), (_unit getVariable "TF_receivingDistanceMultiplicator")];
			_unit setVariable [QGVAR(sending), (_unit getVariable "TF_sendingDistanceMultiplicator")];
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}, _this] call CBA_fnc_execNextFrame;
