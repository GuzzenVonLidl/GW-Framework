#include "..\scriptComponent.hpp"

[{
	params ["_unit"];
	if (isPlayer _unit) then {
		_unit setVariable ["TF_receivingDistanceMultiplicator", 1.2];
		_unit setVariable ["TF_sendingDistanceMultiplicator", 0.7];
		private _group = group _unit;

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
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}, _this] call CBA_fnc_execNextFrame;
