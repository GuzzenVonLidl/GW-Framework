/*

	1. Object name, the name of the object.
		a. Can be the actual name of the Object. Generally used when activating Service Stations later in to the mission.
 		b. This, when entered in the init line of an object, activates the Service Station instantly.
	2. OPTIONAL: If it is a Mobile Service Station. True/False.
		a. Defaults to false, Always use false. If you want to use a Mobile Service Station use the extension NEKY_MobileSS.sqf.
		b. True, when this script is being executed via NEKY_MobileSS.sqf.
	3. OPTIONAL: Objects to scan for, an array of strings that will scan for types of vehicles ( https://community.bistudio.com/wiki/nearestObjects ).
		a. This decides what "TYPES" of vehicles the Service Station will look for/work with. ["CAR","AIR","PLANE","HELICOPTER","TANK"] are some examples.
		b. Defaults to all land vehicles and all aerial vehicles.

//	How To
	1. Place an object or vehicle that you want to be the Mobile Service Station (Vehicle Ammo Crate for slingloading or any truck for a vehicle).
	2. Modify the code to your liking.
	3. Place the code in the init line of the object or vehicle you want to be the Mobile Service Station.

//	Examples:
	null = [this, false, ["LandVehicle","AIR"]] spawn GW_ServiceStation_fnc_Init;
	null = [helipad, false, ["LandVehicle"]] spawn GW_ServiceStation_fnc_Init;
	null = [this] spawn GW_ServiceStation_fnc_Init;

	Made by NeKo-ArroW with help from GuzzenVonLidl
  Thanks to MacGregor and Parker for helping me out testing this on dedicated server
	version 2.0
*/
#include "..\scriptComponent.hpp"

if (isServer) then { // To avoid having all players loop the scanners
	params [
		["_SS", ObjNull, [ObjNull]],
		["_IsMSS", False, [true]],
		["_Find", ["LANDVEHICLE","AIR"], [[]]]
	];

	private _FullService = False;
	GVAR(Stations) PushBack _SS;
	[] Spawn {sleep 5; PublicVariable QGVAR(Stations)};

	// MSS Deactivate if moved or destroyed
	if (_IsMSS) then {
		_This spawn {
			_SS = _This select 0;

			While {True} do {
				if ( !(Speed _SS == 0) or !(Alive _SS) or !(_SS in GVAR(Stations)) ) exitWith {
					SystemChat "MSS Moving, died or deactivated.";
					[[[_SS],{removeAllActions (_This select 0)}], "BIS_Fnc_Spawn", True] Call BIS_fnc_MP;
					if (Alive _SS) then {[[[_This], {(_This select 0) spawn FUNC(InitMobile)}], "BIS_FNC_SPAWN", True] call BIS_FNC_MP};
					[_SS,false] call FUNC(Available);
					GVAR(Stations) deleteAt (GVAR(Stations) find _SS);
					PublicVariable QGVAR(Stations);
				};
				sleep 10;
			};
		};
	};

	// Scanner
	[_SS,_Find] Spawn {
		params ["_SS","_Find"];

		While {_SS in GVAR(Stations)} do {
			if (( {(_x distance _SS) < (GVAR(Radius)*2) && (_x isKindOf "AllVehicles")} count Vehicles) > 0) then {
				{
					if (!(_x in GVAR(Actions)) && (Alive _x)) then {
						GVAR(Actions) pushBack _x;
						PublicVariable QGVAR(Actions);
						[[[_x,_SS,GVAR(Radius)],{_This Spawn FUNC(Actions)}], "BIS_FNC_SPAWN", True] call BIS_FNC_MP;
					};
				} forEach (NearestObjects [(getPos _SS), _Find, GVAR(Radius)]);
			};
			Sleep 4;
		};
	};
};
