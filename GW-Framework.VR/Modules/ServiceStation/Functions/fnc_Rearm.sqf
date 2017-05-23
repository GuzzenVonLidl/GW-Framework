#include "..\scriptComponent.hpp"
private ["_Magazines","_Turrets","_Ammo","_AmmoMax","_Full","_Index2","_Msg"];
params ["_Veh","_SS","_FullService"];
if !(_FullService) then {
	GVAR(Active) PushBack _SS;
	PublicVariable QGVAR(Active);
};
_MagAllTurrets = MagazinesAllTurrets _Veh;

if !((Count _MagAllTurrets) isEqualTo 0) then {
	// Store current ammo, turrets and magazine types
	_Magazines = [];	// [["mag1","mag2","mag3"], ["mag1"]]
	_Turrets = [];	// [[Turret1],[Turret2]]
	_Ammo = [];
	_AmmoMax = [];

	// Store all turret, magazine, ammo and ammo max information
	Private ["_CurTurret","_TempMagazinesArray","_TempAmmoArray","_TempAmmoMaxArray"];

	{
		_Magazine = (_x select 0);
		_TempAmmo = (_x select 2);
		_TempAmmoMax = ((configfile >> "CfgMagazines" >> _Magazine >> "count") call BIS_fnc_getCfgData);
		if !(_TempAmmo isEqualTo _TempAmmoMax) then {
			// First run defining
			if (isNil "_CurTurret") then {
				_CurTurret = (_x select 1);
				_TempMagazinesArray = [];
				_TempAmmoArray = [];
				_TempAmmoMaxArray = [];
			};

			// Store turret arrays before starting on the next turret
			if !((_x select 1) isEqualTo _CurTurret) then {
				_Magazines pushBack _TempMagazinesArray;
				_Ammo pushBack _TempAmmoArray;
				_AmmoMax pushBack _TempAmmoMaxArray;
				_TempMagazinesArray = [];
				_TempAmmoArray = [];
				_TempAmmoMaxArray = [];
				_CurTurret = (_x select 1);
			};

			if !(_CurTurret in _Turrets) then {_Turrets pushBack _CurTurret};
			_TempMagazinesArray pushBack _Magazine;
			_TempAmmoArray pushBack _TempAmmo;
			_TempAmmoMaxArray pushBack _TempAmmoMax;
		};

		if ((Count _MagAllTurrets) isEqualTo (_ForEachIndex +1)) then {
			if !(isNil "_TempMagazinesArray") then {
				if ((Count _TempMagazinesArray) > 0) then {
					_Magazines pushBack _TempMagazinesArray;
					_Ammo pushBack _TempAmmoArray;
					_AmmoMax pushBack _TempAmmoMaxArray;
				};
			};
		};
	} forEach _MagAllTurrets;

	// Check if there's anything to rearm
	If ((Count _Turrets) isEqualTo 0) exitWith {["Rearming not needed", _Veh] spawn FUNC(Hints)};

	// Start servicing the vehicle
	_Index2 = 0;

	While {((_Veh in GVAR(Array)) && !((Count _Turrets) isEqualTo 0))} do {
		_Full = [];

		// Message
		Switch _Index2 do {
			Case 0: {_Msg = "Rearming vehicle —"};
			Case 1: {_Msg = "Rearming vehicle \"};
			Case 2: {_Msg = "Rearming vehicle /"; _Index2 = -1};
		};
		[_Msg, _Veh] spawn FUNC(Hints);

		// Add Ammo
		{
			_Turret = _x;
			_Index = _ForEachIndex;
			_TempFull = [];
			{
				_AmmoCount = (_Ammo select _Index) select _ForEachIndex;
				_TempAmmoMax = (_AmmoMax select _Index) select _ForEachIndex;
				_AmmoCount = _AmmoCount + (_TempAmmoMax * REARMSLEEP);
				If (_AmmoCount >= _TempAmmoMax) then {
					_AmmoCount = _TempAmmoMax;
					_TempFull pushBack True;
				} else {
					_TempFull PushBack False;
				};
				(_Ammo select _Index) Set [_ForEachIndex,_AmmoCount];

				if (_AmmoCount >= 1) then {
					[[_Veh,_Turret,_AmmoCount,_x],
					{
						[_This,
						{
							Params ["_Veh","_Turret","_AmmoCount","_Magazine"];
							_Veh setMagazineTurretAmmo [_Magazine, _AmmoCount, _Turret];

						}] RemoteExec ["BIS_FNC_SPAWN",(Owner (_This select 0))];
					}] remoteExec ["BIS_FNC_SPAWN",2];
				};
			} ForEach (_Magazines select _ForEachIndex);

			_Full pushBack _TempFull;
		} forEach _Turrets;

		// Remove full turrets
		For "_i" from ((count _Full) -1) to 0 step -1 do {
			For "_y" from ((count (_Full select _i)) -1) to 0 step -1 do {
				_Temp = (_Full select _i) Select _y;
				If (_Temp) then {
					(_Magazines select _i) deleteAt _y;
					(_Ammo select _i) deleteAt _y;
					(_AmmoMax select _i) deleteAt _y;
				};
			};
			if (({_x} count (_Full select _i)) isEqualTo (Count (_Full select _i))) then {
				_Turrets deleteAt _i;
				_Magazines deleteAt _i;
				_Ammo deleteAt _i;
				_AmmoMax deleteAt _i;
			};
		};
		_Index2 = _Index2 +1;
		Sleep 1;

		if (!(_Veh in GVAR(Array))) exitWith {[_SS,true] call FUNC(Available)};
	};
	if (_Veh in GVAR(Array)) then {[[_Veh],{(_This select 0) setVehicleAmmo 1}] remoteExec ["BIS_FNC_SPAWN",0]; ["Rearming Complete!", _Veh] spawn FUNC(Hints)};
} else {
	["Vehicle is unarmed, nothing to rearm.", _Veh] spawn FUNC(Hints);
};
if (_FullService) then {["Service complete!", _Veh] spawn FUNC(Hints)};
if ((driver _Veh) in _Veh) then {_Veh engineOn True};
[_SS,false] call FUNC(Available);
