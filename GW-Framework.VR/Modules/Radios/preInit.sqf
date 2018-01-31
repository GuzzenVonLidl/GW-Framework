#include "script_Component.hpp"

PREP(add);
//PREP(getJammer);
PREP(groupInit);
PREP(jammer);

if (GVARMAIN(mod_ACRE)) then {
	#include "Functions\ACRE_Init.sqf"
};

if (GVARMAIN(mod_TFAR)) then {
	#include "Functions\TFAR_Init.sqf"
};
