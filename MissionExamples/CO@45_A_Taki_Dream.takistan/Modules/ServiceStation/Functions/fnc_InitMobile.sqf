#include "..\scriptComponent.hpp"

params [
	["_Object", ObjNull, [ObjNull]],
	["_IsMSS", False, [true]],
	["_Find", ["LANDVEHICLE","AIR"], [[]]]
];

_Object addAction ["<t color='#00FF00'>Activate Service Station</t>", {
	(_this select 3) params ["_Object","_IsMSS","_Find"];

	Hint "Service Station Activated.";
	[[[_Object,_IsMSS,_Find], {_This spawn FUNC(init)}], "BIS_FNC_SPAWN", false] call BIS_FNC_MP;
	[[[_Object,_IsMSS,_Find], {
		params ["_Object","_IsMSS","_Find"];
		removeAllActions _Object;
		sleep 10;

		_Object addAction ["<t color='#FF0000'>Deactivate Service Station</t>", {
			(_this select 3) params ["_Object","_IsMSS","_Find"];

			Hint "Service Station Deactivated.";
			[[[_Object],{removeAllActions (_This select 0)}], "BIS_Fnc_Spawn", true] Call BIS_fnc_MP;
			[[[_Object],{GVAR(Stations) deleteAt (GVAR(Stations) find (_This select 0)); PublicVariable QGVAR(Stations)}], "BIS_FNC_SPAWN", false] call BIS_FNC_MP;

			[[[_Object,_IsMSS,_Find],{sleep 10; _This spawn FUNC(InitMobile)}], "BIS_Fnc_Spawn", true] Call BIS_fnc_MP;
		},[_Object,_IsMSS,_Find],11,false,true];
	}], "BIS_Fnc_Spawn", true] call BIS_fnc_MP;
},[_Object,_IsMSS,_Find],4,false,true];
