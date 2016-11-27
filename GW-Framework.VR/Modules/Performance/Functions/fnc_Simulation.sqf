/*
	Author: GuzzenVonLidl
	Makes it so that you can spawn in a group without any performance impacts for players
	Is only active if set to true at time of calling function

	Usage:
	[this] call GW_Performance_Fnc_Simulation;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params ["_unit"];
if (!(GVAR(Simulation)) || (time < 5) || !(local _unit) || (isPlayer _unit) || !((vehicleVarName _unit) isEqualType "") || !(alive _unit)) exitWith {false};

if !((vehicle _unit) isEqualTo _unit) then {
	_unit enableSimulationGlobal false;

	[{
		_this enableSimulationGlobal true;
		_this setPosATL (getPosATL _this);
	}, _unit, (2 + (random 3))] call CBA_fnc_waitAndExecute;
};
