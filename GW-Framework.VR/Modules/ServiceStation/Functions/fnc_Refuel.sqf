#include "..\scriptComponent.hpp"

params ["_Veh","_SS","_FullService"];

if !(_FullService) then {
	GVAR(Active) PushBack _SS;
	PublicVariable QGVAR(Active);
};

if ((fuel _veh) < 0.98) then {
	while {(fuel _veh) < 0.98} do {
		if !(_Veh in GVAR(Array)) exitWith {[_SS,true] call FUNC(Available)};
		["Refueling.", _Veh] spawn FUNC(Hints);
		_veh setfuel ((fuel _veh) + REFUELING);
		sleep 1;
	};
} else {
	["Refueling not needed", _Veh] spawn FUNC(Hints);
};
sleep 2;
if !(_FullService) then {
	[_SS,false] call FUNC(Available);
} else {
	[_Veh,_SS,true] call FUNC(Rearm);
};
