#include "..\scriptComponent.hpp"

params ["_unit","","","","","_magazine","_projectile"];

TRACE_1("Fired",_projectile);
GVAR(BulletArray) pushBack [_unit, _projectile];
//	drawLine3D [getPos _unit, getPos _projectile, [1,0,0,1]];
