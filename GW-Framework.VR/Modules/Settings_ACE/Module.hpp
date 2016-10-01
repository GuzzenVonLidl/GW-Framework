#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 3.7.0;
		description = "Description of this module";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
	};
#endif

#ifdef LOAD_ACE		// ACE3 - Version 3.6.2
	#include "ACE\Common.hpp"	// Everything else
	#include "ACE\Medical.hpp"	// Only medical
#endif
