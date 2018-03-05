#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;			// Current version of this module, used to keep track of every update for all mission makers
		description = "Description of this module";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
	};
#endif

#ifdef LoadParams	// Params should be put here
	#include "params.hpp"
#endif