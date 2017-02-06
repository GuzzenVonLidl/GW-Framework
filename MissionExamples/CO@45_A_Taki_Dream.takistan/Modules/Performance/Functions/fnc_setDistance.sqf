#include "..\scriptComponent.hpp"

private ["_getAvg","_changeView","_changeTo","_diff","_changeToObject"];
//_getAvg = ((GVAR(getAvgFPS)) call GW_Common_Fnc_findAverage);
_getAvg = (GVAR(getAvgFPS) call GW_Common_Fnc_findAverage);
GVAR(getAvgFPS) = [];
TRACE_1("FPS",_getAvg);

_changeView = 0;
if (_getAvg >= 30) then {
	_changeView = 1;
};
if (_getAvg <= 20) then {
	_changeView = -1;
};

_diff = 100;
_changeTo = (viewDistance - _diff);
if (_changeView isEqualTo 1) then {
	_changeTo = (viewDistance + _diff);
};

if (!(_changeView isEqualTo 0) && (_changeTo > 500) && (_changeTo < 2000)) then {
	setViewDistance _changeTo;
	switch (_changeTo) do {
		case 500: {
			_changeToObject = 500;
		};
		case 1000: {
			_changeToObject = 835;
		};
		case 1200: {
			_changeToObject = 925;
		};
		case 1500: {
			_changeToObject = 1060;
		};
		case 2000: {
			_changeToObject = 1286;
		};
	};

	if !(isNil "_changeToObject") then {
		setObjectViewDistance [_changeToObject, 100];
	};
};
TRACE_3("Dynamic FPS", _getAvg, _changeView, _changeTo);

if (GVAR(EnabledDistance)) then {
	[{
		[] call FUNC(setDistance);
	}, [], 1] call CBA_fnc_waitAndExecute;
};
