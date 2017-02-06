#include "..\scriptComponent.hpp"
//	https://github.com/TMF3/TMF/blob/master/addons/ai/functions/fn_doArty.sqf
params ["_pos",["_radius",700],"_type","_event"];
private _location = _pos getpos [_radius, floor(random 360)];
private _players = [];

if (GVAR(derp)) then {
	GVAR(derpSleep) = (time + (30/lightnings));

	{
		if (isNull (objectParent player)) then {
			_players pushback _x;
		};
	} forEach allPlayers;

	[_radius, (selectRandom _players) call EFUNC(Common,GetPosATL)] call FUNC(LightningEffect);
};

/*
GVAR(artyAreaPFP) = [{
}, 1, []] call CBA_fnc_addPerFrameHandler;
*/


_altitude = 1000;
_velocity = [0,0,-100];
_radio = "SentGenIncoming";
_sounds = if (getnumber (_cfgAmmo >> "hit") < 200) then {["mortar1","mortar2"]} else {["shell1","shell2","shell3","shell4"]};
_sound = _sounds call bis_fnc_selectrandom;
_hint = ["Curator","PlaceOrdnance"];
_shakeStrength = 0.01;
_shakeRadius = 300;

_posAmmo set [2,_altitude];
_projectile = createvehicle [_ammo,_posAmmo,[],0,"none"];
_projectile setpos _posAmmo;
_projectile setvelocity _velocity;
