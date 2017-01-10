#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 3.7.0;
		description = "Configures all ACE settings";
		preInit = "preInit.sqf";
		postInit = "";
	};
#endif

class ACE_Settings {	// ACE3 - Version 3.6.2
	#include "ACE\Settings_Common.hpp"	// Everything else
	#include "ACE\Settings_Medical.hpp"	// Only medical
};
//#include "ACE\Medical_Actions.hpp" // Add CPR
#include "ACE\ACE_Repair.hpp"
