/*
	Author: GuzzenVonLidl
	Disable or Enable lights in a location to effect example the town atmosphere

	Usage:
	[true, (getPosATL player), 200] call GW_Effects_Fnc_toggleLights;

	Arguments:
	0: Toggle Lights <BOOL>
	1: Location <ARRAY | OBJECT | STRING>
	2: Radius to effect <NUMBER>

	Return Value: <BOOL>

	Public: No

*/

#include "script_Component.hpp"

params ["_enable","_pos",["_radius",500]];

private _allLamps = ["Lamps_Base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_F","Land_LampHarbour_F","Land_LampShabby_F","Land_PowerPoleWooden_small_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampSolar_F","Land_LampStreet_small_F","Land_LampStreet_F","Land_LampAirport_F"];
private _nearStreetLights = nearestObjects [_pos, _allLamps, _radius];
private _damage = [0.97,0] select _enable;

{
	params ["_lamp"];
	{
		_lamp setHit [gettext (_x >> "hitpoint"),_damage];
	} foreach configProperties [configfile >> "CfgVehicles" >> (typeof _lamp) >> "Reflectors","isclass _x"];
} forEach _nearStreetLights;

_enable
