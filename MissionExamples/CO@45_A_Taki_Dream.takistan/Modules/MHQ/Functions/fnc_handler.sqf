/*
	Author: GuzzenVonLidl
	initialize a vehicle to create a mhq

	Usage:
	[mhq, "car"] call GW_MHQ_Fnc_Handler;

	Arguments:
	0: Unit <OBJECT>
	1: MHQ when assembled <STRING>
		"car"
		"truck"

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"
if (!isServer) exitWith {false};

[{
	params ["_mhq",["_type","",[""]],["_side","west",[""]]];

	_mhq setVariable [QGVAR(Info), [(typeOf _mhq),(getPosATL _mhq),(getdir _mhq),(vehicleVarName _mhq), _type]];	// Store for respawn
	_mhq setVariable [QGVAR(Fuel), (fuel _mhq)];
	_mhq setVariable [QGVAR(Side), toLower(_side), true];
	[QGVAR(Enabled), [_mhq, false]] call CBA_fnc_LocalEvent;
	[QGVAR(Actions), [_mhq], format ["GW_MHQ_JIP_%1", _mhq]] call CBA_fnc_globalEventJIP;

	_mhq addEventHandler ["Killed", {
		[{
			private ["_mhqInfo","_mhq"];
			params ["_mhqOld"];
			removeAllActions _mhqOld;
			_mhqInfo = (_mhqOld getVariable QGVAR(Info));
			[QGVAR(Actions), format ["GW_MHQ_JIP_%1", _mhq]] call CBA_fnc_removeEventHandler;
			if ((_mhqOld distance (_mhqInfo select 1)) < 50) then {
				deleteVehicle _mhqOld;
			};
			_mhq = createVehicle [(_mhqInfo select 0), [0,0,0], [], 10, "NONE"];
			_mhq setPosATL (_mhqInfo select 1);
			_mhq setDir (_mhqInfo select 2);
			_mhq setVehicleVarName (_mhqInfo select 3);
			Call Compile Format ["%1 = _mhq; PublicVariable '%1';", (_mhqInfo select 3)];
			[_mhq] call FUNC(Handler);
		}, _this, 5] call CBA_fnc_waitAndExecute;
	}];
}, _this, 1] call CBA_fnc_waitAndExecute;
