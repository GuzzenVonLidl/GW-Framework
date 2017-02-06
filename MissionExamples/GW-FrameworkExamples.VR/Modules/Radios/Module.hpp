#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT: GW_Modules_Base {
		name = COMPONENT;
		Authors[] = {"GuzzenVonLidl"};
		version = 2;
		description = "Configures radio for players, Supports ACRE2 and TFAR";
		postInit = "";
		requiredModules[] = {"Gear"};
	};
#endif
