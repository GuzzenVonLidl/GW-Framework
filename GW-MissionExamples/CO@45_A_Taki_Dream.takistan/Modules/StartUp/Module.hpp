#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;
		description = "Disables weapons and damage and displays intro text";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
		requiredModules[] = {};
	};
#endif
