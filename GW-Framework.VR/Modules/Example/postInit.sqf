#include "scriptComponent.hpp"

[] spawn {
	sleep 5;

	if (GVAR(messageInit)) then {
		systemChat "Test Init";
		LOG("Test Init");
	};
	if (GVAR(messageFnc)) then {
		[] spawn GOL_Fnc_Example;
	};
};
