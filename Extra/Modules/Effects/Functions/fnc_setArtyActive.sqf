/*
	Author: GuzzenVonLidl
	Spawns a single artillary round, falling from 1000m

	Usage:
	[mortar_1, 55, 7000] call GW_Effects_fnc_setArtyActive;

	Arguments:
	0: Center Position <ARRAY, OBJECT, STRING>

	Return Value: NO

	Public: No

*/
#include "script_Component.hpp"

params ["_mortar","_heading","_distance"];

_target = (_mortar getPos [_distance, _heading]);
_target params ["_posX","_posY"];

_mortar setDamage 0;
_mortar enableSimulationGlobal true;

_mortar doWatch [_posX,_posY,150];
_mortar setBehaviour "AWARE";

_mortar allowCrewInImmobile true;
{
	_x disableAI "FSM";
	_x setBehaviour "CARELESS";
} forEach (crew _mortar);

_mortar addEventHandler ["Fired", {
	_this spawn {
		sleep 15;
		deleteVehicle (_this select 6);
	};
}];

sleep (7 + random 5);

while {(alive (gunner _mortar))} do {
	_mortar fire (currentWeapon _mortar);
	_mortar setvehicleammo 1;
	_mortar setWeaponReloadingTime [gunner (vehicle _mortar), currentMuzzle (gunner (vehicle _mortar)), 0.0];

	sleep (7 + random 5);
	if ((random 1) > 0.5) then {
		_newTarget = ([_posX,_posY] getpos [(random 360), 30]);
		_newTarget params ["_posX","_posY"];
		_mortar doWatch [_posX,_posY,150];
	};
};

/*
[mortar1,"rockets_230mm_GAT","rockets_230mm_GAT","Close","R_230mm_HE","12Rnd_230mm_rockets",27: missile_at_02_fly_f.p3d,mortar1G]
[mortar1,"mortar_82mm","mortar_82mm","Single1","Sh_82mm_AMOS","8Rnd_82mm_Mo_shells",13: shell.p3d,mortar1G]

[[_logic,_sound,"say3D"],"bis_fnc_sayMessage"] call bis_fnc_mp;
*/
