/*
	Author: GuzzenVonLidl

	Usage:
	[5] call GW_StartUp_Fnc_displayText;

	Arguments:
	0: Time Left (In Minutes) <NUMBER>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

params["_number"];
if !(hasInterface) exitWith {false};

if (_number isEqualTo -1) then {
	systemChat "SAFE START: Weapons are now active";
} else {
	systemChat format ["SAFE START: Time Remaining until weapons are live: %1 min", _number];
};
