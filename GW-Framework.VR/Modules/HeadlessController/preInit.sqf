#include "scriptComponent.hpp"

PREP(addHC);
PREP(BlackList);
PREP(countBalance);
PREP(HandlePFH);
PREP(transferer);
PREP(UpdateBalance);

GVAR(ForceRebalance) = false;
GVAR(HeadlessList) = [];
GVAR(Transfered) = [];
GVAR(ToTransfer) = [];

if (isServer && isMultiplayer) then {
	["CAManBase", "init", {
		[{
			_this call FUNC(transferer);
		}, _this, 2.5] call CBA_fnc_waitAndExecute;
	}] call CBA_fnc_addClassEventHandler;

	[{
		[] call FUNC(HandlePFH);
//		[] call FUNC(UpdateBalance);
	}, 15, []] call CBA_fnc_addPerFrameHandler;
};

[QGVAR(addHC), {
	TRACE_1("QGVAR(addHC)", _this);
	_this call FUNC(addHC);
}] call CBA_fnc_addEventHandler;
