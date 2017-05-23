#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

if (!((count GVAR(ToTransfer)) isEqualTo 0) || GVAR(forceRebalance)) then {
	private _groupsTransfered = [];

	if (GVAR(forceRebalance)) then {
		GVAR(forceRebalance) = false;
		GVAR(ToTransfer) = (GVAR(ToTransfer) + GVAR(Transfered));
		GVAR(Transfered) = [];
//		LOG_ADMIN("Forcing a rebalance on all groups");
		{
			_x setVariable [QGVAR(currentUnits), 0, true];
		} forEach GVAR(headlessList);
	} else {
		{
			(_x select 1) setVariable [QGVAR(currentUnits), (_x select 0), true];
//			TRACE_2("Headless Stats", (_x select 0), (_x select 1));
		} forEach (call FUNC(countBalance));
	};

	{
		_x params ["_group"];
		private _headlessArray = [];
		private _groupOwner = (_group getVariable [QGVAR(currentOwner), GVARMAIN(Gamelogic)]);

		if (!((count GVAR(headlessList)) isEqualTo 0) && !((count (units _group)) isEqualTo 0)) then {
			{
				_headlessArray pushBack [(_x getVariable QGVAR(currentUnits)), _x];
			} forEach GVAR(headlessList);
			_headlessArray sort true;
			_headless = ((_headlessArray select 0) select 1);
			_headless setVariable [QGVAR(currentUnits), ((_headless getVariable QGVAR(currentUnits)) + 1), true];

			if ((_groupOwner isKindOf "HeadlessClient_F") && !GVAR(forceRebalance)) then {
				_groupOwner setVariable [QGVAR(currentUnits), ((_groupOwner getVariable QGVAR(currentUnits)) - 1), true];
			};

			_group setGroupOwner (owner _headless);
			_group setVariable [QGVAR(currentOwner), _headless, true];
			{
				if (_x getVariable [QEGVAR(Common,disableAI_Path), false]) then {
					[QEGVAR(Common,disableAICommand), _x, _headless] call CBA_fnc_targetEvent;
				};
			} forEach (units _group);

			_groupsTransfered pushBack _group;
			LOG(FORMAT_2("%2 moved to %1", _headless, _group));
		} else {
//			LOG_ADMIN("Forcing Server as owner - Could not find any Headless clients");
			_group setGroupOwner (owner GVARMAIN(Gamelogic));
		};
	} count +GVAR(ToTransfer);

	{
		GVAR(Transfered) pushBack _x;
		GVAR(ToTransfer) deleteAt (GVAR(ToTransfer) find _x);
	} forEach _groupsTransfered;
};
