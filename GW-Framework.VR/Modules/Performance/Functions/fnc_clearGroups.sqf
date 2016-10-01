/*
	Author: GuzzenVonLidl
	Force clear all empty groups

	Usage:
	[] call GW_Performance_Fnc_clearGroups;

	Arguments: NO

	Return Value: NO

	Public: YES

*/
#include "..\scriptComponent.hpp"

{
	if (count (units _x) == 0) then {
		TRACE_1("Deleting group", _x);
		_x remoteExecCall ["deleteGroup", (groupOwner _x)];
	};
} forEach allGroups;
