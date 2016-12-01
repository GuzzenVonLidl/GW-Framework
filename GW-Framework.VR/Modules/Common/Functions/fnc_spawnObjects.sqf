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
	private "_veh";
	private _class = (_x select 0);
	private _posATL = (_x select 1);
//	private _specials = (_x select 3);
	private _simpleObject = false;
	_simpleObject = (_x select 4);

	if (_simpleObject) then {
		_veh = _class createVehicleLocal [0,0,0];
		_veh setposATL _posATL;
		private _posASL = (getPosWorld _veh);
		_model = ((getModelInfo _veh) select 1);
		deleteVehicle _veh;
		_veh = createSimpleObject [_model, _posASL];
	} else {
		_veh = createVehicle [_class, [0,0,0], [], 0, "NONE"];
		_veh setPosATL _posATL;
	};

	_veh setVectorDirAndUp (_x select 2);
	_objects pushBack _veh;
	{
		private _value = (_x select 1);
		switch (toLower(_x select 0)) do {
			case "damage": {
				_veh allowDamage _value;
			};
			case "simulation": {
				_veh enableSimulationGlobal _value;
			};
			case "lock": {
				_veh lock _value;
			};
		};
	} forEach (_x select 3);
} forEach _this;

_objects
