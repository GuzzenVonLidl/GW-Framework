#include "script_Component.hpp"

#ifdef LOAD_MODULES
	class COMPONENT: GW_Modules_Base {
		name = COMPONENT;
		Authors[] = {"GuzzenVonLidl"};
		version = 3.7.0;
		description = "Configures all ACE settings";
		postInit = "";
		hasSettings = 1;
	};
#endif
