#include "..\scriptComponent.hpp"

if (GVAR(EnabledDistance)) then {
	[{
		GVAR(getAvgFPS) pushBack diag_fps;
		[] call FUNC(getFPS);
	}, [], 0.1] call CBA_fnc_waitAndExecute;
};
