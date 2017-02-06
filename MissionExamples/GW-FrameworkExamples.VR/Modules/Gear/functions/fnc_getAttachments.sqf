/*
	Author: GuzzenVonLidl
	Sets the correct gear for the soldier

	Usage:
	["LMG_MK200_F"] call GW_Gear_Fnc_getAttachments;
	[currentWeapon player] call GW_Gear_Fnc_getAttachments;

	Arguments:
	0: Weapon <STRING>

	Return Value: <ARRAY>

	Public: No
*/
#include "..\scriptComponent.hpp"
#define	GETOPTIC(VAR_1)	(((_Optics select 0) >> VAR_1) call BIS_fnc_getCfgData)

params [["_weapon", "", [""]]];
private _muzzle = [];
private _optic = [];
private _pointer = [];
private _bipod = [];
private _blackList = [];	// Classnames to blacklist
private _whiteList = [];	// Classnames to whitelist

{
	private _temp = _x;
	if !(_temp in _blackList) then {
		switch (getNumber (configFile >> "CfgWeapons" >> _temp >> "itemInfo" >> "type")) do {
			case 101: {
				_muzzle pushback _temp;
			};
			case 201: {
				private _Optics = (configFile >> "CfgWeapons" >> _temp >> "ItemInfo" >> "OpticsModes");
				if ((count _Optics) isEqualTo 1) then {
					if (((GETOPTIC("distanceZoomMin") isEqualTo GETOPTIC("distanceZoomMax")) && (count(GETOPTIC("visionMode")) isEqualTo 0) && (GETOPTIC("memoryPointCamera") isEqualTo "eye")) || (_temp in _whiteList)) then {
						_optic pushback _temp;
					};
				};
			};
			case 301: {
				_pointer pushback _temp;
			};
			case 302: {
				_bipod pushback _temp;
			};
		};
	};
} forEach ([_weapon] call CBA_fnc_compatibleItems);

[_muzzle,_optic,_pointer,_bipod]
