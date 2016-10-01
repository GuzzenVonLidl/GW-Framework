#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1.1;
		description = "Handles respawn gear";
		preInit = "preInit.sqf";
		postInit = "";
		requiredModules[] = {"Gear"};
	};
#endif
