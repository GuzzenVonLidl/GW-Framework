#include "scriptComponent.hpp"

["CAManBase", "init", {
	if (GVAR(Enabled)) then {
		[{
			params ["_unit"];
			if ((_unit getVariable ["NOAI",false]) || ((vehicle _unit) isKindOf "Plane")) then {
				_unit setvariable ["NOAI",true];
			} else {
				if (side _unit in VCOMAI_SideBasedExecution) then {
					[_unit] execFSM "Modules\VCOMAI\AIBEHAVIORNEW.fsm";
				};
			};
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;
