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
	["AllVehicles", "init", GW_Common_fnc_addToCurators, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
