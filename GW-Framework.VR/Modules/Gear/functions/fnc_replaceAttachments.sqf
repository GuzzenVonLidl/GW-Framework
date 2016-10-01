#include "..\scriptComponent.hpp"

#define	getName(Var1)	format ["%1",getText(configfile >> "CfgWeapons" >> Var1 >> "displayName")]
#define	getPicture(Var1)	format ["%1",getText(configfile >> "CfgWeapons" >> Var1 >> "picture")]
#define	setItem(Var1,Var2)	compile Format ["player addPrimaryWeaponItem '%1';", Var1, ["player", [], -100, ["_this call GW_Gear_Fnc_replaceAttachments",Var2]]]

//	[currentWeapon player] call GW_Gear_Fnc_getAttachments; -> [_muzzle,_optic,_pointer,_bipod]

private ["_params","_menuName","_menuRsc","_suboptions_101","_suboptions_201","_suboptions_301","_suboptions_302","_allAttatchments","_menus","_menuDef"];
_params = _this select 1;
_menuName = "";
_menuRsc = "popup";
_suboptions_101 = [];
_suboptions_201 = [];
_suboptions_301 = [];
_suboptions_302 = [];
_allAttatchments = ([currentWeapon player] call GW_Gear_Fnc_getAttachments);

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

_menus =
[
	[
		["main", "Attachment Menu", _menuRsc],
		[
			[
				"Replace Muzzle >",
				"","","",
				["_this call GW_Gear_Fnc_replaceAttachments","101", 1]
			],
			[
				"Replace Optic >",
				"","","",
				["_this call GW_Gear_Fnc_replaceAttachments","201", 1]
			],
			[
				"Replace Pointer >",
				"","","",
				["_this call GW_Gear_Fnc_replaceAttachments","301", 1]
			],
			[
				"Replace Bipod >",
				"","","",
				["_this call GW_Gear_Fnc_replaceAttachments","302", 1]
			]
		]
	]
];

// -------------------------------- Player Actions ----------------------------------- \\

if (_menuName == "101") then {
	{
		_suboptions_101 pushBack [getName(_x),setItem(_x,"101"),getPicture(_x),"",""];
	} forEach (_allAttatchments select 0);
	_menus pushBack [["101", "Muzzle List", _menuRsc],_suboptions_101];
};

if (_menuName == "201") then {
	{
		_suboptions_201 pushBack [getName(_x),setItem(_x,"201"),getPicture(_x),"",""];
	} forEach (_allAttatchments select 1);
	_menus pushBack [["201", "Optics List", _menuRsc],_suboptions_201];
};

if (_menuName == "301") then {
	{
		_suboptions_301 pushBack [getName(_x),setItem(_x,"301"),getPicture(_x),"",""];
	} forEach (_allAttatchments select 2);
	_menus pushBack [["301", "Pointer List", _menuRsc],_suboptions_301];
};

if (_menuName == "302") then {
	{
		_suboptions_302 pushBack [getName(_x),setItem(_x,"302"),getPicture(_x),"",""];
	} forEach (_allAttatchments select 3);
	_menus pushBack [["302", "Bipod List", _menuRsc],_suboptions_302];
};

_menuDef = [];
{
  if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
  hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""},__FILE__];
  diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};
_menuDef
