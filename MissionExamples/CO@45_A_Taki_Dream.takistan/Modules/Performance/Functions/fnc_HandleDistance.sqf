#include "..\scriptComponent.hpp"
params ["_toggle"];

if (_toggle && GVAR(EnabledDistance)) then {
	GVAR(EnabledDistance) = true;
	[{
		setViewDistance 1000;
		setObjectViewDistance [835, 100];
		[] call FUNC(getFPS);
		[{
			[] call FUNC(setDistance);
		}, [], 1] call CBA_fnc_waitAndExecute;
	}, [], 1] call CBA_fnc_waitAndExecute;
};

if !(_toggle && GVAR(EnabledDistance)) then {
	GVAR(EnabledDistance) = false;
};
