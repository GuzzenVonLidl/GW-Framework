#include "..\scriptComponent.hpp"

params ["_unit"];

if (GVAR(useSmoke)) then {
	_unit fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
	_unit selectWeapon _currentWeapon;
};
