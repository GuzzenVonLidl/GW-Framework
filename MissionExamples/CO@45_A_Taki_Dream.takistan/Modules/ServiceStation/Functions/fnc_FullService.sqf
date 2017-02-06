#include "..\scriptComponent.hpp"

params ["_Veh","_SS"];

GVAR(Active) PushBack _SS;
PublicVariable QGVAR(Active);

["Full service selected", _Veh] spawn FUNC(Hints);
sleep 2;
[_Veh,_SS,true] call FUNC(Repair);
