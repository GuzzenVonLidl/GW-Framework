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
	if (count (units _x) isEqualTo 0) then {
		TRACE_1("Deleting group", _x);
		{deleteGroup _x} remoteExecCall ["bis_fnc_call", (groupOwner _x)];
	};
} forEach allGroups;
