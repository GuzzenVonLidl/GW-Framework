#include "scriptComponent.hpp"

PREP(simpleRoster);

[QGVAR(update), {
	[] call FUNC(simpleRoster);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
	[QGVARMAIN(mapLoaded), {
		[{time >= 1}, {
			[QGVAR(update), []] call CBA_fnc_localEvent;
		}, []] call CBA_fnc_waitUntilAndExecute;
	}] call CBA_fnc_addEventHandler;

	if (didJip) then {
		[{
			[QEGVAR(roster,update), []] call CBA_fnc_globalEvent;
		}, [], 1] call CBA_fnc_waitAndExecute;
	};
};
