#include "script_Component.hpp"
/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_HeadlessController_fnc_getTransfered

	Arguments: NO

	Return Value: YES <ARRAY>

	Public: NO
*/

allGroups select {_x getVariable [QGVAR(Transfered), false]}
