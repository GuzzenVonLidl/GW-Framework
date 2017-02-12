#include "scriptComponent.hpp"

PREP(add);
PREP(groupInit);

if (GVARMAIN(mod_ACRE)) then {
	#include "Functions\ACRE_Init.sqf"
};

if (GVARMAIN(mod_TFAR)) then {
	#include "Functions\TFAR_Init.sqf"


	["CAManBase", "init", {
		[{
			_this call FUNC(groupInit);
		}, _this] call CBA_Fnc_execNextFrame;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
};
