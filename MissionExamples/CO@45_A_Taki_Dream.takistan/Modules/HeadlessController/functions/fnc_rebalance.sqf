/*
	Author: GuzzenVonLidl
	Force a rebalance for each group between headless clients

	Usage:
	[true] spawn GW_HeadlessController_Fnc_Rebalance;

	Arguments: NO

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

if !(isServer) exitWith {false};
params [["_forceRebalance", false]];
private ["_headlessArray"];
if (count GVAR(ToTransfer) > 0) then {
	GVAR(TrasfererActive) = true;
};

_headlessArray = [];
if (_forceRebalance) then {
	GVAR(ToTransfer) = (GVAR(ToTransfer) + GVAR(TransferedFailed) + GVAR(Transfered));
	GVAR(TransferedFailed) = [];
	GVAR(Transfered) = [];

	LOG_ADMIN("Forcing a rebalance on all groups");
	{
		_x setVariable [QGVAR(currentUnits), 0, true];
	} forEach GVAR(headlessList);
} else {
	{
		(_x select 1) setVariable [QGVAR(currentUnits), (_x select 0), true];
	} forEach (call FUNC(countBalance));
};

{
	private ["_group","_headless","_headlessArray"];
	_group = _x;
	_groupOwner = (_group getVariable QGVAR(currentOwner));
	if ((count GVAR(headlessList)) > 0) then {
		_headlessArray = [];
		{
			_headlessArray pushBack [(_x getVariable QGVAR(currentUnits)), _x];
		} forEach GVAR(headlessList);
		_headlessArray sort true;
		_headless = ((_headlessArray select 0) select 1);
		_headless setVariable [QGVAR(currentUnits), ((_headless getVariable QGVAR(currentUnits)) + 1), true];
		if (_groupOwner isKindOf "HeadlessClient_F") then {
			_groupOwner setVariable [QGVAR(currentUnits), ((_groupOwner getVariable QGVAR(currentUnits)) - 1), true];
		};
		_group setGroupOwner (owner _headless);
		_group setVariable [QGVAR(Transfered), true];
		_group setVariable [QGVAR(currentOwner), _headless, true];
		if !(_group in GVAR(Transfered)) then {
			GVAR(Transfered) pushBack _group;
		};
		LOG(FORMAT_2("%2 moved to %1", _headless, _group));
	} else {
		LOG_ADMIN("Forcing Server as owner - Could not find any Headless clients");
		_group setGroupOwner (owner GVARMAIN(Gamelogic));
		if !(_group in GVAR(TransferedFailed)) then {
			GVAR(TransferedFailed) pushBack _group;
		};
	};
	GVAR(ToTransfer) deleteAt (GVAR(ToTransfer) find _group);
} forEach GVAR(ToTransfer);

if (count GVAR(ToTransfer) > 0) then {
	LOG(FORMAT_1("%1", GVAR(ToTransfer)));
	[false] call FUNC(Rebalance);
} else {
	GVAR(TrasfererActive) = false;
};
