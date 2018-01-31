#include "script_Component.hpp"

[QGVARMAIN(playerReady), {
	[(group player), true] call FUNC(BlackList);
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(headlessReady), {
	[(group player), true] call FUNC(BlackList);
	[{
		[QGVAR(addHC), player] call CBA_fnc_serverEvent;
		[QGVAR(adjustViewDistance), [], GVAR(headlessList)] call CBA_fnc_targetEvent;
		[QGVAR(adjustViewDistance), []] call CBA_fnc_serverEvent;
	}, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
	["CAManBase", "init", {
		[{
			_this call FUNC(addToList);
		}, _this, 3] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	["CAManBase", "Local", {
		[{
			if (_this getVariable [QEGVAR(Common,disableAI_Path), false]) then {
				[QEGVAR(Common,disableAICommand), _this] call CBA_fnc_localEvent;
			};
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	[{
		[{
			if (!((count GVAR(headlessList)) isEqualTo 0) && !((count GVAR(ToTransfer)) isEqualTo 0)) then {
				[] call FUNC(HandlePFH);
			};
		}, 30, []] call CBA_fnc_addPerFrameHandler;
	}, [], 15] call CBA_fnc_waitAndExecute;	// Add delay before first event

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
}] call CBA_fnc_addEventHandler;

[QGVAR(addHC), {
	params ["_headless"];
	LOG_ADMIN(FORMAT_1("Headless Client: %1 Connected", _headless));
	_headless setVariable [QGVAR(currentUnits), 0, true];

	GVAR(headlessList) pushBack _headless;
	publicVariable QGVAR(headlessList);	// why share?

	if (didJIPOwner _headless) then {
		if !((count GVAR(headlessList)) isEqualTo 0) then {
			GVAR(forceRebalance) = true;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(adjustViewDistance), {
	if ((count GVAR(headlessList)) > 0) then {
		if (isServer) then {
			setViewDistance 3000;
			setObjectViewDistance [1500,0];
			setTerrainGrid 25;
		};
		if (CBA_isHeadlessClient) then {
			setViewDistance 3000;
			setObjectViewDistance [1500,0];
			setTerrainGrid 25;
		};
	} else {
		if (isServer) then {
			setViewDistance 3000;
			setObjectViewDistance [1500,0];
			setTerrainGrid 25;
		};
	};
}] call CBA_fnc_addEventHandler;
