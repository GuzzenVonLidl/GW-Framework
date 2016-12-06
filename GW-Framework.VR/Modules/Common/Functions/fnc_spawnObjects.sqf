/*
	Author: GuzzenVonLidl
	From array spawns objects and vehicles and adds them to a array

	Usage:
	[] call GW_Common_fnc_spawnObjects;

	Arguments:
	#0:	ARRAY - objects location and dir

	Return Value: <ARRAY>
	Objects spawned

	Public: NO
*/
#include "..\scriptComponent.hpp"

private _objects = [];
{
	private "_object";
	_x params ["_class","_posATL","_vector","_specials","_simpleObject"];

	if (_simpleObject) then {
		_object = _class createVehicleLocal [0,0,0];
		_object setposATL _posATL;
		private _posASL = (getPosWorld _object);
		_model = ((getModelInfo _object) select 1);
		deleteVehicle _object;
		_object = createSimpleObject [_model, _posASL];
	} else {
		_object = createVehicle [_class, [0,0,0], [], 0, "NONE"];
		_object setPosATL _posATL;
	};
	_object setVectorDirAndUp _vector;
	[_object, _specials] call FUNC(setAttributes);
	_objects pushBack _object;
} forEach _this;

_objects
