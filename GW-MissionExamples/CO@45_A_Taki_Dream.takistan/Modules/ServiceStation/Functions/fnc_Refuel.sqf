#include "..\scriptComponent.hpp"

params ["_Veh","_SS","_FullService"];
private _Fuel = fuel _veh;

if !(_FullService) then {
	GVAR(Active) PushBack _SS;
	PublicVariable QGVAR(Active);
};

if (_fuel < 0.98) then {
	while {_fuel < 0.98} do {
		if (!(_Veh in GVAR(Actions))) exitWith {[_SS,true] call FUNC(Available)};
		["Refueling.", _Veh] spawn FUNC(Hints);
		_veh setfuel (_fuel + GVAR(Refueling));
		sleep 0.33;
		_fuel = fuel _veh;
		["Refueling..", _Veh] spawn FUNC(Hints);
		_veh setfuel (_fuel + GVAR(Refueling));
		sleep 0.33;
		_fuel = fuel _veh;
		["Refueling...", _Veh] spawn FUNC(Hints);
		_veh setfuel (_fuel + GVAR(Refueling));
		sleep 0.33;
		_fuel = fuel _veh;
		["Refueling....", _Veh] spawn FUNC(Hints);
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
