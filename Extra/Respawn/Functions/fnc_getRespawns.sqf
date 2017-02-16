/*
	Author: GuzzenVonLidl
	Returns lives remaining for correct respawn mode and side related to player

	Usage:
	[player] call GW_Respawn_Fnc_getRespawns;

	Arguments:
	0: Unit <OBJECT>

	Return Value: YES <NUMBER>

	Public: No
*/
#include "..\scriptComponent.hpp"

params [
	["_unit", objNull, [objNull]]
];
private _respawns = -1;

if (GVAR(Mode) isEqualTo 1) then {
	_respawns = (_unit getVariable [QGVAR(Count), -1]);
};

if (GVAR(Mode) isEqualTo 2) then {
	switch (GETSIDE(_unit)) do {
		case 0: {
			_respawns = GVAR(CountTeamEast);
		};
		case 1: {
			_respawns = GVAR(CountTeamWest);
		};
		case 2: {
			_respawns = GVAR(CountTeamIndependent);
		};
		case 3: {
			_respawns = GVAR(CountTeamCivilian);
		};
	};
};

_respawns
