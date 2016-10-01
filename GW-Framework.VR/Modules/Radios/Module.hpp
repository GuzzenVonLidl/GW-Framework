#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;
		description = "Configures radio for players";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
		requiredModules[] = {"Gear"};
	};
#endif
