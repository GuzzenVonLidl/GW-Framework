#include "scriptComponent.hpp"

[QGVAR(addHC), {
	TRACE_1("QGVAR(addHC)", _this);
	_this call FUNC(addHC);
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[(group player), true] call FUNC(BlackList);
	if (CBA_isHeadlessClient) then {
		[QGVAR(addHC), player] call CBA_fnc_serverEvent;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
	["CAManBase", "init", {
		[{
			_this call FUNC(transferer);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	["CAManBase", "Local", {
		[{
			_this call FUNC(transferer);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	[{
		[] call FUNC(HandlePFH);
	}, 15, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
