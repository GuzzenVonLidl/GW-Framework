#include "..\scriptComponent.hpp"


params ["_firer", "", "", "", "", "_mag","_projectile"];

if(!alive _projectile) exitWith {};
while {alive _projectile} do {
	_pos = getPosATL _projectile;
	_nearUnits = nearestObjects [_pos,["CaManBase"],10];
	{
		if(alive _x && side _x != side _firer && _x isKindOf "CaManBase") then {
			[_x,_firer,_mag] spawn FUNC(Behaviour);
		};
	} forEach _nearUnits;
	sleep 0.02;
};
