#include "scriptComponent.hpp"

PREP(addHC);
PREP(BlackList);
PREP(countBalance);
PREP(rebalance);
PREP(transferer);

GVAR(headlessList) = [];
GVAR(groupCount) = [];
GVAR(TrasfererActive) = false;
GVAR(Transfered) = [];
GVAR(ToTransfer) = [];
GVAR(TransferedFailed) = [];

if (isServer) then {
	["CAManBase", "init", {
		[group (_this select 0)] call FUNC(transferer);
	}] call CBA_fnc_addClassEventHandler;
};
