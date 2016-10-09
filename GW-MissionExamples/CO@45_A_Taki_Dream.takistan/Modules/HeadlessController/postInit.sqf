#include "scriptComponent.hpp"

if (hasInterface || CBA_isHeadlessClient) then {
	[(group player), true] call FUNC(BlackList);
};

if (CBA_isHeadlessClient) then {
	[[player], {
		[{_this call GW_HeadlessController_Fnc_addHC}, _this, 1] call CBA_fnc_waitAndExecute;
	}] REMOTEONLYSERVER(QFUNCMAIN(remoteCommand));
};

