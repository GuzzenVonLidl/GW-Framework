#include "scriptComponent.hpp"

PREP(setGroupColor);
PREP(setGroupid);
PREP(simpleRoster);

[QGVAR(update), {
	[{
		[] call FUNC(simpleRoster);
	}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
	if (didJip && time > 1) then {
		[{
			[QEGVAR(roster,update), []] call CBA_fnc_globalEvent;
		}, [], 1] call CBA_fnc_waitAndExecute;
	} else {
		[QGVARMAIN(missionStarted), {
			[QGVAR(update), []] call CBA_fnc_localEvent;
			[{
				[player] call FUNC(setGroupColor);
				if (leader (group player) isEqualTo player) then {
					[player] call FUNC(setGroupID);
				};
			}, [], 1] call CBA_fnc_waitAndExecute;
		}] call CBA_fnc_addEventHandler;

	};
};
