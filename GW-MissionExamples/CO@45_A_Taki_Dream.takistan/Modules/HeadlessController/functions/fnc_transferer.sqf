/*
	Author: GuzzenVonLidl
	Function will transfer units group to a headless under the right conditions

	Usage:
	[this] spawn GW_HeadlessController_Fnc_transferer;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

if !(isServer) exitWith {false};
params ["_var"];
private ["_group"];

_group = _var call CBA_fnc_getGroup;

if ((_group getVariable [QGVAR(Transfered), false]) || (_group getVariable [QGVAR(BlackList), false])) exitWith {
	LOG(FORMAT_1("Group: %1 is blacklisted", _group));
	false
};
if ({isPlayer _x} count units _group > 0) exitWith {
	[_group, true] call FUNC(BlackList);
	false
};

_group setVariable [QGVAR(currentOwner), (if (isServer) then {"Server"} else {player}), true];

if (count GVAR(headlessList) > 0) then {
	GVAR(ToTransfer) pushBack _group;
} else {
	GVAR(TransferedFailed) pushBack _group;
};

if !(GVAR(TrasfererActive)) then {
	GVAR(TrasfererActive) = true;
	[FUNC(Rebalance), [false], 10] call CBA_fnc_waitAndExecute;
};
