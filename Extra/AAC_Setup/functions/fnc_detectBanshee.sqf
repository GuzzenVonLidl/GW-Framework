/*
 * Module Function that detects and stores all laptops on the map
 * 
 */

private ["_arr","_done"];

_arr = [];

//Start the loop
_i = 0;
_done = false;

if (typeName _this != typeName []) then {
	_this = [_this];
};

{
	while {true} do {
		_obj = "";

		if (_i > 0) then {
			_obj = format ["%1_%2",_x,_i];
		} else {
			_obj = format ["%1",_x];
		};

		if (isNil _obj || _i > 500) exitWith {_i = 0;};

		// If the object exists, add it to the array
		call compile format ["_arr append [%1]",_obj];
		_i = _i + 1;
	};
} forEach _this;

{GW_AAC_Setup_Banshee pushBack _x}foreach _arr;
