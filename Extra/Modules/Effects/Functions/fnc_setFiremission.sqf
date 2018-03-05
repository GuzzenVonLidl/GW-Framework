/*
	Author: GuzzenVonLidl
	Spawns a single artillary round, falling from 1000m

	Usage:
	[getpos player, 100, "light"] call GW_Effects_fnc_setFiremission;

	Arguments:
	0: Center Position <ARRAY, OBJECT, STRING>

	Return Value: NO

	Public: No

*/
#include "script_Component.hpp"

params ["_pos",["_radius",500],"_ammo"];

// Shell
_target = player;
_pos = (getPosATL _target);
_posAmmo = _pos;
_altitude = 1000;
_posAmmo set [2,_altitude];
_velocity = [0,0,-100];
_projectile = createvehicle ["Sh_82mm_AMOS", [0,0,0], [], 0, "CAN_COLLIDE"];
_projectile setpos _posAmmo;
_projectile setvelocity _velocity;

// Rocket
_target = player;
_pos = (getPosATL _target);
_posAmmo = (_target getRelPos [500, 180]);
_altitude = 1000 - ((getterrainheightasl _posAmmo) - (getterrainheightasl _pos));
_posAmmo set [2,_altitude];
_velocity = [sin (_posAmmo getdir _pos) * 68, cos (_posAmmo getdir _pos) * 68, -100];
_projectile = createvehicle ["R_230mm_HE", [0,0,0], [], 0, "CAN_COLLIDE"];
_projectile setpos _posAmmo;
_projectile setDir (_pos getdir _posAmmo);
_projectile setvelocity _velocity;

_sound = selectRandom ["shell1","shell2","shell3","shell4"];
if (getNumber(configfile >> "cfgammo" >> "R_230mm_HE" >> "hit") < 200) then {
	_sound = selectRandom ["mortar1","mortar2"];
};

_target = player;
_pos = (getPosATL _target);
_logic = createvehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_logic hideObjectGlobal true;
_logic setpos _pos;
_logic say3D _sound;
[QGVAR(say3D), [_logic,_sound]] call CBA_fnc_globalEvent;


/*
[] spawn {
	while {time < 85} do {
		vehicle player setVelocityModelSpace [0, 10, 0];
	};
};


[mortar1,"rockets_230mm_GAT","rockets_230mm_GAT","Close","R_230mm_HE","12Rnd_230mm_rockets",27: missile_at_02_fly_f.p3d,mortar1G]
[mortar1,"mortar_82mm","mortar_82mm","Single1","Sh_82mm_AMOS","8Rnd_82mm_Mo_shells",13: shell.p3d,mortar1G]

[[_logic,_sound,"say3D"],"bis_fnc_sayMessage"] call bis_fnc_mp;
*/
