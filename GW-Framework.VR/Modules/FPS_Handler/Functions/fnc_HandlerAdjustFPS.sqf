#include "..\scriptComponent.hpp"

private _updated = [];

{
	if ((player distance _x) < (getObjectViewDistance select 0)) then {
		if (_x getVariable [QGVAR(isHidden), false]) then {
			_x setVariable [QGVAR(isHidden), false];
			_x enableSimulation true;
//			_x hideObject false;
			_updated pushBack _x;
		};
	} else {
		if !(_x getVariable [QGVAR(isHidden), false]) then {
			_x setVariable [QGVAR(isHidden), true];
			_x enableSimulation false;
//			_x hideObject true;
			_updated pushBack _x;
		};

		if (time > (_x getVariable [QGVAR(nextUpdate), 0])) then {
			_x setVariable [QGVAR(nextUpdate), (time + 30)];
			_x enableSimulation true;
			[{
				_this enableSimulation false;
			}, _x, 1] call CBA_fnc_waitAndExecute;
		};
	};
} forEach GVAR(Objects);

//	systemChat format ["%1, %2, %3, %4", time, {simulationEnabled _x} count allUnits, {!simulationEnabled _x} count allUnits, (count _updated)];
