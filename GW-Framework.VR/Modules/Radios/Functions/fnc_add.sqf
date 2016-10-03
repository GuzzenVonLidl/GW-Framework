/*
	Author: GuzzenVonLidl
	Gives the unit the radios from his role in Gear handlern

	Usage:
	["sl", "TF_rt1523g"] call GW_Radios_fnc_add;

	Arguments:
	0: Role <STRING>
	1: Classname(Backpack) <STRING>

	Return Value: NO

	Public: NO
*/
#include "..\scriptComponent.hpp"

params ["_unit","_type",["_radioBackPack", "", [""]]];
private ["_radio1000a","_radio152","_radioBP","_backpackInventory"];

_radio1000a = ["pl","fac","sl","ftl","r","g","ag","ar"];
_radio152 = ["ftl","p"];
_radioBP = ["pl","fac","sl","p"];

if (GVARMAIN(mod_TFAR)) then {
	if ({_x call TFAR_fnc_isRadio} count (items _unit + assignedItems _unit) > 0) then {
		{
			if (_x call TFAR_fnc_isRadio || _x isEqualTo "ItemRadio") then {
				_unit removeItem _x;
				_unit unlinkItem _x;
			};
		} forEach (items _unit + assignedItems _unit);
	};

	if (_type in _radio1000a) then {
		_unit linkItem "tf_pnr1000a";
	};
	if (_type in _radio152) then {
		_unit addItem "tf_anprc152";
	};
/*
	if (_type in _radioBP) then {
		_backpackInventory = backpackItems _unit;
		removeBackpackGlobal _unit;
//		_unit addBackpack EGVAR(Gear,RadioBackpack);
		_unit addBackpack _radioBackPack;
		clearItemCargoGlobal (unitBackpack _unit);
		clearMagazineCargoGlobal (unitBackpack _unit);
		clearWeaponCargoGlobal (unitBackpack _unit);
		{_unit addItemToBackpack _x} forEach _backpackInventory;
	};
*/
} else {
	if (GVARMAIN(mod_ACRE)) then {

	};
};
