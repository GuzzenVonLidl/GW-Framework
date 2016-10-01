/*
	Author: GuzzenVonLidl
	Creates random lightnings around players that can kill/injure anyone & thing

	Usage:
	[100] spawn GW_Environment_Fnc_LightningLoop;

	Arguments:
	0: Radius around players lightning can hit (Default: 500m) <NUMBER>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

if !(isServer) exitWith {false};

private ["_players","_sleep"];
params [
	["_radius", 700, [0]]
];
_players = [];
_sleep = (5 + floor(random 120));

if (lightnings > 0.1) then {
	if (GVAR(AdvLightningWeather)) then {
		_sleep = (30/lightnings);
	};

	{
		if !(vehicle _x != _x) then {
			_players pushback _x;
		};
	} forEach allPlayers;

	[_radius, (selectRandom _players) call EFUNC(Common,GetPosATL)] call FUNC(LightningEffect);
};

[{
	[700] call FUNC(LightningLoop);
}, [], _sleep] call CBA_fnc_waitAndExecute;
