/*
	Author: GuzzenVonLidl

	Usage:
	[] call GW_MiscSettings_fnc_customMenu_Example;

	Arguments: NO

	Return Value: NO

	Public: NO
*/
#include "script_component.hpp"

_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params isEqualTo typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

_list = (allPlayers apply {rankId _x});
_list sort false;

private _menuDef = [];
private _menus = [
	[
		["framework", "Framework Menu", _menuRsc],
		[
			[
				"Start the mission",
				{[QEGVAR(GameLoop,removeAdminTimer), true] call CBA_fnc_globalEvent;},
				"","","",-1,((rankID player) isEqualTo (_list select 0)),
				!isNil QEGVAR(GameLoop,PFH_Adminhandle)
			]
		]
	]
];

{
	if (((_x select 0) select 0) isEqualTo _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if ((count _menuDef) isEqualTo 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName isEqualTo "") then {_this}else{""},__FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef
