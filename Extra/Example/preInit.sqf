#include "scriptComponent.hpp"

// Global function name will be GW_Example_Fnc_returnTrue
// With Macros it will be FUNC(returnTrue)
// With Macros from diffrent component it will be EFUNC(Example,returnTrue)
PREP(returnTrue);

// Global Variable name will be GW_Example_Variable
// With Macros it will be GVAR(Variable)
// With Macros from diffrent component it will be EGVAR(Example,Variable)
GVAR(Variable) = true;