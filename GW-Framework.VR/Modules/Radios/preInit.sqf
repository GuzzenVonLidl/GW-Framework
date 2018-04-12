#include "script_Component.hpp"

PREP(add);
PREP(jammer);

if (GVARMAIN(mod_ACRE)) then {
	#include "Functions\Init_ACRE.sqf"
};

if (GVARMAIN(mod_TFAR)) then {
	#include "Functions\Init_TFAR.sqf"
};
