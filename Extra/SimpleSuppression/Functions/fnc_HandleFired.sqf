#include "..\scriptComponent.hpp"

params ["_unit","","","","","_magazine","_projectile"];

if (isPlayer _unit) then {
	TRACE_1("Fired",_projectile);
};
	GVAR(BulletArray) pushBack [_unit, _projectile];
