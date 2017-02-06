/*
	Author: GuzzenVonLidl
	Moves all players to first assembled mhq upon respawn
	Blacklisted will players will not be affected

	Usage:
	[player] call GW_MHQ_Fnc_HandlerRespawn;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"
#define	BLACKLIST ["echo1","echo2","echo3","echo4","echo4","echo5","echo6"]

params [["_unit", objNull, [objNull]]];
if (!(isPlayer _unit) && !(local _unit)) exitWith {false};
if (([format ["%1", _unit], 1] call BIS_fnc_trimString) in BLACKLIST) exitWith {false};

{
	if ((_x getVariable QGVAR(Side)) isEqualTo toLower(GETSIDESTRING(_unit))) exitWith {
		_unit setPosATL (_x getRelPos [(sizeOF(typeOf _x)/2) + 1, 180]);
		_unit setDir (getDir _x) + 180;
	};
} count GVAR(AssembledArray);
