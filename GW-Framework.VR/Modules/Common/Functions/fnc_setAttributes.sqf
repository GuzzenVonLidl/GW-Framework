#include "..\scriptComponent.hpp"

params [
	"_object",
	"_specials"
];

{
	private _value = (_x select 1);
	switch (_x select 0) do {
		case 0: {
			[] call (compile (format ["%1", (toString(toArray(format ["%1", [_value, "this", "_object"] call CBA_fnc_replace])))]));
		};
		case 1: {
			_object allowDamage _value;
		};
		case 2: {
			_object enableSimulationGlobal _value;
		};
		case 3: {
			_object lock _value;
		};
		case 4: {
			_object enableDynamicSimulation _value;
		};
		case 5: {
		};
	};
} forEach _specials;
