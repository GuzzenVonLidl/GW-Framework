#include "..\scriptComponent.hpp"

params [
	["_unit", objNull, [objNull]]
];

if (!(isPlayer _unit) && !(local _unit)) exitWith {false};

if (isMultiplayer) then {
	cutText ["","BLACK IN", 9999];
	_unit setVariable [QGVAR(unitGear), (getUnitLoadout _unit)];
};
