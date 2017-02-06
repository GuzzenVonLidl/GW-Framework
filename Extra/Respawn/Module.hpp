#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT: GW_Modules_Base {
		name = COMPONENT;
		Authors[] = {"GuzzenVonLidl"};
		version = 1.1;
		description = "Handles respawn gear";
		requiredModules[] = {"Gear"};
	};
#endif
