// Place mission parameters here

#ifdef EnableParam1
	class testParam1 {
		title = "Test Param 1";
		values[] = {0};
		texts[] = {"Useless param for testing"};
	};
#endif

#ifdef EnableParam2
	class testParam2 {
		title = "Test Param 2"; 					// Param name visible in the list
		values[] = {0,1,2};							// Values; must be integers; has to have the same number of elements as 'texts'
		texts[] = {"Useless param for testing"};	// Description of each selectable item
		default = 60;								// Default value; must be listed in 'values' array, otherwise 0 is used
		function = "GOL_fnc_TestParam";				// (Optional) Function called when player joins, selected value is passed as an argument
 		isGlobal = 1;								// (Optional) 1 to execute script / function locally for every player who joins, 0 to do it only on server
// 		file = "setViewDistance.sqf";				// (Optional) Script called when player joins, selected value is passed as an argument
	};
#endif