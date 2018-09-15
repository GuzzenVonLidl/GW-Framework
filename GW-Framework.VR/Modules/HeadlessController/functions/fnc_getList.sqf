#include "script_Component.hpp"
/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_HeadlessController_fnc_getList

	Arguments: NO

	Return Value: YES <ARRAY>

	Public: NO

*/

(switchableUnits + allPlayers) select {(_x isKindOf "HeadlessClient_F")}
