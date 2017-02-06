#include "..\scriptComponent.hpp"

params ["_unit"];

_unit setVariable [QGVAR(animationDone), false];

private _delay = (floor(random 10) + 5);	// Next tacticle movement
private _selectRandom = (selectRandom [true, false]);

private _animation = selectRandom [
	["AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", "Front-Kneeling", "Middle"],
	["AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon", "Right-Kneeling", "Middle"],
	["AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon", "Left-Kneeling", "Middle"]
];

switch (stance _unit) do {
	case "STAND": {
		if (_selectRandom) then {
			_animation = selectRandom [
				["AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon", "Front-Prone", "Down"],
				["AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright", "Right-Prone", "Down"],
				["AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft", "Left-Prone", "Down"]
			];
			if !((_animation select 1) isEqualTo "Front-Prone") then {
				[{
					params ["_unit"];
					_unit playMoveNow "AmovPpneMstpSrasWrflDnon";
				}, [_unit], (_delay / 2)] call CBA_fnc_waitAndExecute;
			};

		};
	};

	case "CROUCH": {
		_animation = selectRandom [
			["AmovPknlMevaSrasWrflDf", "Front-CROUCH", "Middle"],
			["AmovPknlMevaSrasWrflDfr", "Right-CROUCH", "Middle"],
			["AmovPknlMevaSrasWrflDfl", "Left-CROUCH", "Middle"]
		];
	};

	case "PRONE": {
		_delay = 3;
		_animation = selectRandom [
//					["AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", "Front-PRONE", "Down"],
			["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr", "Right-PRONE", "Down"],
			["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl", "Left-PRONE", "Down"]
		];
		if (_selectRandom) then {
			[{
				params ["_unit", "_animation"];
				_unit playMoveNow _animation;
			}, [_unit, (_animation select 0)], 1] call CBA_fnc_waitAndExecute;
		};
	};
};

_unit setUnitPos (_animation select 2);
_unit playMoveNow (_animation select 0);

if (GVAR(Messages)) then {
	diag_log format ["playMoveNow; %1", (_animation select 1)];
	systemChat format ["playMoveNow; %1", (_animation select 1)];
};

[{
	params ["_unit", "_newPos"];
//	_unit doMove _newPos;
	_unit setUnitPos (_unit getVariable QGVAR(unitPos)); // back to default

	(group _unit) setSpeedMode "FULL";
	_unit setVariable [QGVAR(animationDone), true];
	_unit doTarget _shooter;
}, [_unit, _newPos], _delay] call CBA_fnc_waitAndExecute;
