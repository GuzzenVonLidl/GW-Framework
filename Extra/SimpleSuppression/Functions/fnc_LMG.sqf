#include "..\scriptComponent.hpp"


params ["_unit", "_target"];

private _initPos = position _unit;
private _lastPos = (position _target);
private _fireRate = 0.03 + random 0.2;

sleep (2 + random 2);
_unit doWatch _target;
sleep (2 + random 1);
for "_i" from 0 to (30 + round(random 200)) do {
	if ((_initPos distance (position _unit) > 3) || (lineIntersects [eyePos _unit, _lastPos, _unit]) || !alive _unit) exitWith {false};
	if (GVAR(LMGINFINITEAMMO)) then {
		_unit setVehicleAmmo 1;
	};
	_unit doWatch _lastPos;
	_unit forceWeaponFire [currentWeapon _unit, "FullAuto"];
	sleep _fireRate + random 0.1;
};
