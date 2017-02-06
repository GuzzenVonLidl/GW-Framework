#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT: GW_Modules_Base {
		name = COMPONENT;
		Authors[] = {"GuzzenVonLidl"};
		version = 3.7.0;
		description = "Configures all ACE settings";
		postInit = "";

	};
#endif

#ifdef LOAD_ACE		// ACE3 - Version 3.6.2
	#include "ACE\Settings_Common.hpp"	// Everything else
	#include "ACE\Settings_Medical.hpp"	// Only medical
//	#include "ACE\Medical_Actions.hpp"	// Add CPR
#endif

#ifdef LOAD_ACE_Repair
	#include "ACE\ACE_Repair.hpp"
#endif
