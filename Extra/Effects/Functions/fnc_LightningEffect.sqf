/*
	Author: GuzzenVonLidl
	Creates random lightnings around players that can kill/injure anyone & thing

	Usage:
	[100, getpos player] call GW_Effects_Fnc_LightningEffect;

	Arguments:
	0: Radius around players lightning can hit (Default: 500m) <NUMBER>
	1: Base position for lightning strike <ARRAY>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

if !(isServer) exitWith {false};

params [
	["_radius", 500, [0]],
	["_target", []]
];
private ["_moduleGroup","_logic"];

_moduleGroup = createGroup sideLogic;
_logic = _moduleGroup createUnit["Logic",[0,0,0],[],0,"NONE"];
_logic setPosATL _target;
_logic setPosATL (_logic getPos [floor(random(_radius)),floor(random(360))]);
[_logic,nil,true] spawn BIS_fnc_moduleLightning;
