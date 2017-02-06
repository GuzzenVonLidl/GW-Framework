#include "scriptComponent.hpp"

[QGVARMAIN(missionStarted), {
	["CAManBase", "init", FUNC(Init), true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
	if (GVAR(enableSuppression)) then {
		LOG("Event Suppression PFH");
		GVAR(PFH) = [{
			[] call FUNC(handlePFH);
		}, 0, []] call CBA_fnc_addPerFrameHandler;
	};
}, true, [], true] call CBA_fnc_addEventHandler;

/*
["AllVehicles", "init", {
	_this call FUNC(Init);
}] call CBA_fnc_addClassEventHandler;

[QGVARMAIN(missionStarted), {
	LOG("Event Suppression PFH");
	if (GVAR(enableSuppression)) then {
		[] call FUNC(handlePFH);
	};
}] call CBA_fnc_addEventHandler;
*/
