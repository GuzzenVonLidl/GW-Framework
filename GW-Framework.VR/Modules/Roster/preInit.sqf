#include "scriptComponent.hpp"

PREP(setGroupColor);
PREP(setGroupid);
PREP(simpleRoster);

[QGVAR(update), {
	[{
		[] call FUNC(simpleRoster);
	}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(missionStarted), {
	if (hasInterface) then {
		[{
			[player] call FUNC(setGroupColor);
			if (leader (group player) isEqualTo player) then {
				[player] call FUNC(setGroupID);
			};
			if (didJip) then {
				[QEGVAR(roster,update), []] call CBA_fnc_globalEvent;
			} else {
				[QGVAR(update), []] call CBA_fnc_localEvent;
			};
		}, [], 1] call CBA_fnc_waitAndExecute;
	};
}] call CBA_fnc_addEventHandler;
