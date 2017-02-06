#include "..\scriptComponent.hpp"

params [
	"_object",
	"_specials"
];

{
	private _value = (_x select 1);
	switch (toLower(_x select 0)) do {
		case "damage": {
			_object allowDamage _value;
		};
		case "simulation": {
			_object enableSimulationGlobal _value;
		};
		case "lock": {
			_object lock _value;
		};
		case "init": {
			[] call (compile (format ["%1", (toString(toArray(format ["%1", [_value, "this", "_object"] call CBA_fnc_replace])))]));
		};
	};
} forEach _specials;

/*
		case "addToDyn": {
			_object enableDynamicSimulation _value;
		};
		case "dynamic": {
		};
*/
