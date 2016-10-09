#include "scriptComponent.hpp"

#ifdef LOAD_MODULES
	class COMPONENT {
		name = COMPONENT;
		authors = "GuzzenVonLidl";
		version = 1;
		description = "Sets the time of day and weather from params";
		preInit = "preInit.sqf";
		postInit = "postInit.sqf";
		requiredModules[] = {};
	};
#endif

#ifdef LOAD_PARAMS
	#include "params.cpp"
#endif
