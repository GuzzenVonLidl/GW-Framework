//#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

[{
	{
		_x params ["_unit","_projectile"];
		drawLine3D [getPosATL _unit, getPos _projectile, [1,0,0,1]];
		if (isPlayer _unit) then {
		};

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
			[_unit, (getPosATL _projectile)] call FUNC(HandleEffect);
		};
	} count +GVAR(BulletArray);
}, 0.02, []] call CBA_fnc_addPerFrameHandler;
