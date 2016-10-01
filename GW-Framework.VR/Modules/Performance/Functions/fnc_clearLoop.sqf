/*
	Author: GuzzenVonLidl
	Loops all performance functions using CBA loops

	Usage:
	[] call GW_Performance_Fnc_Loop;

	Arguments: NO

	Return Value: NO

	Public: NO

*/
#include "..\scriptComponent.hpp"

if (!isServer) exitWith {false};

if (GVAR(Enabled)) then {
	[] call FUNC(clearGroups);
	[] call FUNC(clearObjects);
	[] call FUNC(clearTriggers);
};

[{
	[] call FUNC(clearLoop);
}, [], GVAR(Delay)] call CBA_fnc_waitAndExecute;

TRACE_1("Loop", time);
