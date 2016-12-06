/*
	Author: GuzzenVonLidl
	When a unit dies it deletes all magazines & items for the unit
	So that players cant loot

	Is only active if set to true at time of calling function
		GW_Performance_Unit_enabled = true;

	Usage:
	[this] call GW_Performance_Fnc_HandlerKilled;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params ["_unit"];
if !(GVAR(UnitEnabled) || !(local _unit)) exitWith {false};
if ((isPlayer _unit) || (_unit isKindOf "HeadlessClient_F")) exitWith {false};

{
	_unit removeMagazine _x;
	_unit removeItem _x;
} forEach ((magazines _unit) + (items _unit) + (assignedItems _unit));

[{
	params ["_unit"];
	if !(simulationEnabled _unit) then {
		_unit enableSimulationGlobal false;
	};
}, [_unit], 5] call CBA_fnc_waitAndExecute;
