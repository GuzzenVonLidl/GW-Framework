#include "scriptComponent.hpp"

[{
	if ((count EGVAR(headlessController,headlessList)) > 0) then {
		if (isServer) then {
			setViewDistance 500;
			setTerrainGrid 0;
		};
		if (CBA_isHeadlessClient) then {
			setViewDistance 1500;
			setTerrainGrid 25;
		};
	};
	if (isServer && GVAR(Enabled)) then {
		[] call FUNC(clearLoop);
	};
}, [], GVAR(Delay)] call CBA_fnc_waitAndExecute;
