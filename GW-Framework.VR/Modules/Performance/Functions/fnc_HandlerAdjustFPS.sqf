/*
	Author: GuzzenVonLidl
	Dynamicly changes view distance depending on your current fps

	Usage:
	[] call GW_Performance_Fnc_HandlerAdjustFPS;

	Arguments: NO

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

GVAR(getAvgFPS) pushBack diag_fps;

if ((count GVAR(getAvgFPS)) isEqualTo 5) then {
	private ["_getAvg","_changeView","_changeTo","_diff","_changeToObject"];
	_getAvg = (GVAR(getAvgFPS) call EFUNC(Common,findAverage));
	GVAR(getAvgFPS) = [];
	TRACE_1("FPS",_getAvg);
	_diff = 50;
	_changeView = 0;	// 0: keep 1: Increase -1: Decrease
	if ((_getAvg >= (GVAR(AvgTargetDistance) + 5)) && (viewDistance < 3000)) then {
		_changeView = 1;
		_changeTo = (viewDistance + _diff);
	};

	if ((_getAvg <= (GVAR(AvgTargetDistance) - 5)) && (viewDistance > 500)) then {
		_changeView = -1;
		_changeTo = (viewDistance - _diff);
	};

	if !(_changeView isEqualTo 0) then {
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
			case 1750: {
				_changeToObject = 1173;
			};
			case 2000: {
				_changeToObject = 1286;
			};
			case 2250: {
				_changeToObject = 1398;
			};
			case 2500: {
				_changeToObject = 1511;
			};
			case 2750: {
				_changeToObject = 1624;
			};
			case 3000: {
				_changeToObject = 1736;
			};
		};

		if !(isNil "_changeToObject") then {
			setObjectViewDistance [_changeToObject, 100];
		};
		TRACE_3("Dynamic FPS", _getAvg, _changeView, _changeTo);
	};
};
