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
GVAR(headlessList) pushBack _headless;
publicVariable QGVAR(headlessList);
LOG_ADMIN(FORMAT_1("Headless Client: %1 Connected", _headless));
_headless setVariable [QGVAR(currentUnits), 0, true];

if (didJIPOwner _headless) then {
	if (count GVAR(headlessList) >= 1) then {
		[true] call FUNC(Rebalance);
	};
};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit","_id","_uid","_name"];
	if !(_unit isKindOf "HeadlessClient_F") exitWith {false};

	GVAR(headlessList) deleteAt (GVAR(headlessList) find _unit);
	publicVariable QGVAR(headlessList);
	LOG_ADMIN(FORMAT_1("Headless Client: %1 Disconnected", _unit));
	LOG_ADMIN(FORMAT_1("There are %1 Headless left in the mission", count GVAR(headlessList)));
	if (count GVAR(headlessList) >= 1) then {
		[true] call FUNC(Rebalance);
	} else {
		GVAR(Transfered) = [];
		GVAR(TransferedFailed) = [];
		{
			_x setVariable [QGVAR(Transfered), false];
		} forEach allGroups;
	};
}];
