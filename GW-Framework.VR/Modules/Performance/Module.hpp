#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;
		description = "Cleans up the mission for performance";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
		requiredModules[] = {};
	};
#endif

