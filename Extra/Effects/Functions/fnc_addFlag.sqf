/*
	Author: GuzzenVonLidl
	Spawns a flag and attaches it to a vehicle relative to the input position
	Flag Texture requires full path and can include custom mission textures

	Usage:
	[cursorObject, "\A3\Data_F\Flags\Flag_nato_CO.paa", [selectRandom [-0.75,0.75], -2, 0.5]] call GW_Effects_Fnc_addFlag;	// Offroad
	[cursorObject, "\A3\Data_F\Flags\Flag_nato_CO.paa", [selectRandom [-0.6,0.6], -0.7, 0]] call GW_Effects_Fnc_addFlag;	// Prawler

	Arguments:
	0: Flag Parent <OBJECT>
	1: Flag Texture <STRING>
	2: Attach Position (local to parent) <ARRAY>

	Return Value: NO

	Public: No

*/
#include "..\scriptComponent.hpp"

params ["_vehicle","_flagTexture","_pos"];

if (_vehicle getVariable [QGVAR(hasFlag), fase]) then {
	deleteVehicle (_vehicle getVariable [QGVAR(currentFlag), nil]);
	_vehicle setVariable [QGVAR(hasFlag), false, true];
	_vehicle setVariable [QGVAR(currentFlag), nil, true];
};

private _flagType = "FlagChecked_F";
if (GVARMAIN(mod_RHS)) then {
//	_flagType = "rhs_Flag_chdkz";
};

private _flag = _flagType createVehicle _pos; // create a flag at position _pos
_flag setFlagTexture _flagTexture; // set the flag texture as image in mission folder "img" folder
_flag attachTo [_vehicle, _pos]; // attach the flag to a position that makes sense
_vehicle setVariable [QGVAR(currentFlag), _flag, true];
_vehicle setVariable [QGVAR(hasFlag), true, true];
