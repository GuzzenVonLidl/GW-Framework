#include "..\scriptComponent.hpp"

params [
	["_unit", objNull, [objNull]]
];

if (!(isPlayer _unit) && !(local _unit)) exitWith {false};

[{
	params [
		["_unit", objNull, [objNull]]
	];

	_unit setUnitLoadout (_unit getVariable QGVAR(unitGear));
	_unit selectWeapon (primaryWeapon _unit);
	[] call EFUNC(Gear,setGroupColor);
	[(_unit getVariable QEGVAR(Gear,Loadout))] call EFUNC(Radios,add);

	if (EGVAR(Gear,Stamina)) then {
		_unit setUnitTrait ["loadCoef", EGVAR(Gear,StaminaCoef)];
		_unit setFatigue 0;
	};

	if !(GVAR(Mode) isEqualTo 0) then {
		[QGVAR(Events), [_unit, "respawnServer"]] call CBA_fnc_serverEvent;
	};
	cutText ["","BLACK IN", 5];

}, _this] call CBA_fnc_execNextFrame;
