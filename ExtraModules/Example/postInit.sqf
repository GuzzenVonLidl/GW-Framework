#include "scriptComponent.hpp"

[] spawn {
	sleep 5;

	systemChat format ["GVAR(Variable): %1", GVAR(Variable)];
	systemChat format ["FUNC(returnTrue): %1", call FUNC(Init)];
};