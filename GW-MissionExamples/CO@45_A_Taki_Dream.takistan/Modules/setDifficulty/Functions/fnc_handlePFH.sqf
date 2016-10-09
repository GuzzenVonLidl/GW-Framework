//#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

[{
	{
		_x params ["_unit","_projectile"];

		private _projectileVelocity = velocity _projectile;
		private _projectileSpeed = vectorMagnitude _projectileVelocity;

		TRACE_1("PFH - Loop", _projectile);
		if ((!alive _projectile) || ((_unit distance _projectile) > 500) || {(_projectile isKindOf "BulletBase") && {(_projectileSpeed) < 100}}) then {
			GVAR(BulletArray) deleteAt (GVAR(BulletArray) find _x);
			if !(isNull _projectile) then {
				TRACE_1("PFH - Delete", _projectile);
				deleteVehicle _projectile;
			};
		} else {
			TRACE_1("PFH", (_unit distance _projectile));
			[_unit,_projectile] call FUNC(Suppression);
		};
	} count +GVAR(BulletArray);
}, 0, []] call CBA_fnc_addPerFrameHandler;
