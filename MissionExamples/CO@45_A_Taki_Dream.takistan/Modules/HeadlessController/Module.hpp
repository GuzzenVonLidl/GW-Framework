#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;
		description = "Auto transfers units to a headless client";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
		requiredModules[] = {};
	};
#endif
