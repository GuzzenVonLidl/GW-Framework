#include "scriptComponent.hpp"

["CAManBase", "init", {
	if (GVAR(Enabled)) then {
		[{
			params ["_unit"];
			if ((_unit getVariable ["NOAI",false]) || ((vehicle _unit) isKindOf "Plane")) then {
				_unit setvariable ["NOAI",true];
			} else {
				VCOMAI_ActiveList pushBack _unit;
				if (side _unit in VCOMAI_SideBasedExecution) then {
					[_unit] execFSM "Modules\VCOMAI\AIBEHAVIORNEW.fsm";
				};
			};
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	if (GVAR(Enabled)) then {
		[{
			params ["_unit"];
			VCOMAI_ActiveList deleteAt (VCOMAI_ActiveList find _unit);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;
