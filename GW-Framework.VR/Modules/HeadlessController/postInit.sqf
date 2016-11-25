#include "scriptComponent.hpp"

if (hasInterface || CBA_isHeadlessClient) then {
	[{
		[(group player), true] call FUNC(BlackList);
		if (CBA_isHeadlessClient) then {
			[QGVAR(addHC), player] call CBA_fnc_serverEvent;
		};
	}, _this, 1] call CBA_fnc_waitAndExecute;
};
