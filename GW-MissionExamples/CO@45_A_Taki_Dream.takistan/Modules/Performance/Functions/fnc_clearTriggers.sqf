/*
	Author: GuzzenVonLidl
	Force clear all random triggers that may be performance heavy if stacked

	Usage:
	[] call GW_Performance_Fnc_clearTriggers;

	Arguments: NO

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

{
	if (( _x distance [0,0,0]) isEqualTo 0) then {
		TRACE_1("Deleting Trigger", _x);
		deleteVehicle _x;
	};
} forEach allMissionObjects "EmptyDetector";
