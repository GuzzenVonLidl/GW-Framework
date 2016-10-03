/*
	Author: GuzzenVonLidl
	Applies gear to aa soldier automaticly appon spawning it.
	Players are not affected by this
	Disable autogear by setting it to false

	Usage:
	[player] call GW_Gear_Fnc_Test;

	Arguments:
	0: Unit <OBJECT>
	1: Role <STRING>	NOTE: THIS PARAM IS OPTIONAL AND SHOULD ONLY BE USED IF YOU WANT TO FORCE A ROLE

	Return Value: NO

	Public: NO
*/
//#define DEBUG_MODE_FULL
#include "..\scriptComponent.hpp"

params ["_shooter","_projectile"];

{
	_x params ["_unit"];

	if (!(alive _projectile) || (isPlayer _unit)) exitWith {false};

	_effect = (getSuppression _unit);
	_unit setVariable [QGVAR(progress), (_unit getVariable QGVAR(progress)) + _effect];
	_unit setVariable [QGVAR(lastTime), (time + 1)];
	TRACE_2("nearEntities", _unit, _effect);
	if ((_unit getVariable QGVAR(progress)) > 0.05) then {

		if ((_unit getVariable QGVAR(progress)) > 0.9) then {
			_unit setVariable [QGVAR(isSuppresed), true];
			_unit setVariable [QGVAR(lastTime), (time + (3 +(floor(random 2))))];

			if ((_unit getVariable QGVAR(lastTimeEvent)) < time) then {	// delay before new order
				TRACE_1("newEvent", _shooter);
				_unit setVariable [QGVAR(lastTimeEvent), (time + 5)];
				_unit setUnitPos "Down";
			};
		} else {
			_unit setVariable [QGVAR(isSuppresed), false];
			if ((_unit getVariable QGVAR(progress)) > 0.3) then {
				if ((_unit getVariable QGVAR(lastTimeEvent)) < time) then {
					_unit setVariable [QGVAR(lastTimeEvent), (time + 3)];
					if ((_unit getVariable QGVAR(lastUnitStance)) isEqualTo "STAND") then {
					};
					if ((_unit getVariable QGVAR(lastUnitStance)) isEqualTo "CROUCH") then {
					};
				};
			} else {
				if ((_unit getVariable QGVAR(progress)) > 0.7) then {
				};
			};
		};

		if !((_unit getVariable QGVAR(running))) then {	// Activate end
			_unit setVariable [QGVAR(running), true];
			[{(_unit getVariable QGVAR(lastTime)) < time}, {
				params ["_unit"];
				_unit setVariable [QGVAR(progress), 0];
				_unit setSuppression 0;
				_unit setVariable [QGVAR(running), false];
				_unit setUnitPos (_unit getVariable QGVAR(lastUnitStance));
			}, [_unit]] call CBA_fnc_waitUntilAndExecute;
		};
	} else {
		_unit setVariable [QGVAR(progress), 0];
	};
} forEach (_projectile nearEntities ["Man", 10]);
