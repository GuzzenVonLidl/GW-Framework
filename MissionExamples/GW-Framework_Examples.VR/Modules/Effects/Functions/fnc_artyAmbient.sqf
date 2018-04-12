/*
	Author: GuzzenVonLidl
	Spawns a single artillary round, falling from 1000m

	Usage:
	[getpos player, 100, "light"] call GW_Effects_Fnc_artyAmbient;

	Example 1:
		[] spawn {
			artyZone1 = true;
			while {artyZone1} do {
				[(getPosATL player), 200, "light"] call GW_Effects_Fnc_artyAmbient;
				sleep (floor(random 4) + 3);
			};
		};

	Example 2 (Advanced):
		artyZone1 = true;
		ArtyLoop_1 = [{
			if (artyZone1) then {
				[(getPosATL player), 200] call GW_Effects_Fnc_artyAmbient;
			} else {
				[ArtyLoop_1] call CBA_fnc_removePerFrameHandler;
				ArtyLoop_1 = nil;
			};
		}, 3, []] call CBA_fnc_addPerFrameHandler;

	Arguments:
	0: Center Position <ARRAY, OBJECT, STRING>
	1: Radius (Default: 500m) <NUMBER>
	2: Artillery Ammo (Light, Medium, Heavy, Smoke, Flare) <STRING>

	Return Value: NO

	Public: No

*/
#include "script_Component.hpp"

params ["_pos",["_radius",500],"_ammo"];
private _location = _pos getpos [floor(random _radius), floor(random 360)];

private _Light = "Sh_82mm_AMOS";
private _Medium = "Sh_120mm_HE";
private _Heavy = "Sh_155mm_AMOS";
private _Smoke = "Smoke_82mm_AMOS_White";
private _Flare = "F_40mm_White";

private _ammoType = _Light;
private _altitude = 1000;
private _velocity = -300;
private _enableSound = true;

switch toLower(_ammo) do {
	case "medium": {
		_ammoType = _Medium;
	};
	case "heavy": {
		_ammoType = _Heavy;
	};
	case "smoke": {
		_ammoType = _Smoke;
		_velocity = -280;
	};
	case "flare": {
		_ammoType = _Flare;
		_altitude = 140;
		_velocity = -10;
		_enableSound = false;
	};
};

_location set [2, _altitude];
_projectile = createvehicle [_ammoType, [0,0,0], [], 0, "CAN_COLLIDE"];
_projectile setpos _location;
_projectile setvelocity [0, 0, _velocity];

if (_enableSound) then {
	_location set [2, 150];
	playSound3D ["A3\Sounds_F\weapons\mortar\mortar1.wss", _x, false, ATLToASL(_location), 1, 1, 100];	// Untested
};

/*
	_heliPad = createVehicle ["Land_HelipadEmpty_F", _location, [], 10, "CAN_COLLIDE"];
//	_heliPad say3D ["mortar1", 50];
//	playSound3D ["A3\Sounds_F\weapons\mortar\mortar1.wss", _x, false, ([_heliPad] call EFUNC(Common,getPosASL)), 1, 1, 100];	// Untested
	[{
		deleteVehicle (_this select 0);
	}, [_heliPad], 2] call CBA_fnc_waitAndExecute;
*/

