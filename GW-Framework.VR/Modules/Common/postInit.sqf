#include "scriptComponent.hpp"

[QGVAR(update), {
	[{
		[] call FUNC(simpleRoster);
	}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	if (hasInterface) then {
		[player] call FUNC(setGroupColor);
		if (leader (group player) isEqualTo player) then {
			[player] call FUNC(setGroupID);
		};
		if (didJip) then {
			[QGVAR(update), []] call CBA_fnc_globalEvent;
		} else {
			[QGVAR(update), []] call CBA_fnc_localEvent;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(serverReady), {
	["AllVehicles", "init", {
		[{
			_this call GW_Common_fnc_addToCurators;
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

[QGVAR(disableAICommand), {
	params ["_unit"];
	_unit setVariable [QGVAR(disableAI_Path), true, true];
	_unit disableAI "PATH";
	doStop _unit;
}] call CBA_fnc_addEventHandler;
