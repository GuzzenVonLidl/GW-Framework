/*
	[true, (getPosATL player), 200] call GW_Effects_Fnc_destroyLights;
*/

#include "..\scriptComponent.hpp"

params ["_enable","_pos",["_radius",500]];
private _allLamps = ["Lamps_Base_F","PowerLines_base_F","PowerLines_Small_base_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_F","Land_LampHarbour_F","Land_LampShabby_F","Land_PowerPoleWooden_small_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampSolar_F","Land_LampStreet_small_F","Land_LampStreet_F","Land_LampAirport_F"];

private _nearStreetLights = nearestObjects [_pos, _allLamps, _radius];

{
	params ["_lamp"];
	if (_enable) then {
		_x setHit["light_1_hitpoint",0.97];
		_x setHit["light_2_hitpoint",0.97];
		_x setHit["light_3_hitpoint",0.97];
		_x setHit["light_4_hitpoint",0.97];
	} else {
		_x setHit["light_1_hitpoint",0];
		_x setHit["light_2_hitpoint",0];
		_x setHit["light_3_hitpoint",0];
		_x setHit["light_4_hitpoint",0];
	};
} forEach _nearStreetLights;
