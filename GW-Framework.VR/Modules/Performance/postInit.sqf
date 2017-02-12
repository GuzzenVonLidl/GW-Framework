#include "scriptComponent.hpp"

if (isServer) then {
	["CAManBase", "init", {
		[{
			_this call FUNC(Simulation);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
	["CAManBase", "KILLED", {
		[{
			_this call FUNC(HandlerKilled);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
};

[QGVAR(removeGroup), {
	deleteGroup _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(adjustViewDistance), {
	if ((count EGVAR(headlessController,headlessList)) > 0) then {
		if (isServer) then {
			setViewDistance 1000;
			setObjectViewDistance [835,100];
			setTerrainGrid 25;
		};
		if (CBA_isHeadlessClient) then {
			setViewDistance 2000;
			setObjectViewDistance [1286,100];
			setTerrainGrid 25;
		};
	} else {
		if (isServer) then {
			setViewDistance 1500;
			setObjectViewDistance [1060,100];
			setTerrainGrid 25;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[QGVAR(adjustViewDistance), []] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
	if (isNil QGVAR(CleanUp_PFH)) then {
		GVAR(CleanUp_PFH) = [{
			if (GVAR(Enabled)) then {
				[] call FUNC(HandlerCleanUp);
			};
		}, GVAR(Delay), []] call CBA_fnc_addPerFrameHandler;
	};
	[QGVAR(adjustViewDistance), []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
