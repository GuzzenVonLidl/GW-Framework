/*
	Author: GuzzenVonLidl
	Cretes objects around a selected vehicle from a base template

	Usage:
	[mhq, "small"] call GW_MHQ_Fnc_prefabCreate;

	Arguments:
	0: MHQ <OBJECT>
	1: Objects to be created <ARRAY>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"
if (!isServer) exitWith {false};

params ["_mhq","_objects"];
private ["_objectsCreated","_pos","_veh"];
_objectsCreated = [];
_pos = "Land_Compass_F" createVehicle [0,0,0];
_pos setDir (getdir _mhq);
_pos setPosATL (getPos _mhq);
{
	_veh = (_x select 0) createVehicle [0,0,0];
	_veh setDir ((_x select 1) + (getdir _pos));
	_veh setPos (_pos modelToWorld (_x select 2));
	_veh setVectorUp surfaceNormal position _veh;
	_veh allowDamage false;
	if (count _x isEqualTo 4) then {
		[_veh, (_x select 3)] call EFUNC(Gear,Init);
	};
	_objectsCreated pushBack _veh;
} forEach _objects;
_mhq setVariable [QGVAR(objectsCreated), _objectsCreated, true];
deleteVehicle _pos;
