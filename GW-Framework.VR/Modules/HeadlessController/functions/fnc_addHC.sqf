/*
	Author: GuzzenVonLidl
	Function will transfer units group to a headless under the right conditions

	Usage:
	[this] spawn GW_HeadlessController_Fnc_addHC;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params ["_headless"];
LOG_ADMIN(FORMAT_1("Headless Client: %1 Connected", _headless));
_headless setVariable [QGVAR(currentUnits), 0, true];

GVAR(headlessList) pushBack _headless;
publicVariable QGVAR(headlessList);

if (didJIPOwner _headless) then {
	if !((count GVAR(headlessList)) isEqualTo 0) then {
		GVAR(forceRebalance) = true;
	};
};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit","_id","_uid","_name"];
	if !(_unit isKindOf "HeadlessClient_F") exitWith {false};

	GVAR(headlessList) deleteAt (GVAR(headlessList) find _unit);
	publicVariable QGVAR(headlessList);
	LOG_ADMIN(FORMAT_1("Headless Client: %1 Disconnected", _unit));
	LOG_ADMIN(FORMAT_1("There are %1 Headless left in the mission", count GVAR(headlessList)));
	if !((count GVAR(headlessList)) isEqualTo 0) then {
		GVAR(forceRebalance) = true;
	} else {
		GVAR(Transfered) = [];
		{
			_x setVariable [QGVAR(Transfered), false];
		} forEach allGroups;
	};
}];
