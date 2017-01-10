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

[{
	params ["_unit"];
	{
		_unit removeItem _x;
	} forEach (itemsWithMagazines _unit);
	{
		_unit unlinkItem _x;
	} forEach (assignedItems _unit);
}, [_unit], 5] call CBA_fnc_waitAndExecute;
