#include "..\scriptComponent.hpp"
private ["_Magazines","_Turrets","_Ammo","_AmmoMax","_Full","_Index2","_Msg"];
params ["_Veh","_SS","_FullService"];
if !(_FullService) then {GVAR(Active) PushBack _SS; PublicVariable QGVAR(Active)};

if (Count (AllTurrets _Veh) > 0) then {
	// Store current ammo, turrets and magazine types
	_Magazines = [];
	_Turrets = [];
	_Ammo = [];
	_AmmoMax = [];
	{
		_MagazinesTurret = _Veh MagazinesTurret _x;
		_TempMagazines = [];
		if !((count _MagazinesTurret) isEqualTo 0) then {
			_Turret = _x;
			_TempAmmo = [];
			_TempAmmoMax = [];

			{
				_Temp = _Veh MagazineTurretAmmo [_x, _Turret];
				_Temp2 = ((configfile >> "CfgMagazines" >> _x >> "count") call BIS_fnc_getCfgData);
				if !(_Temp isEqualTo _Temp2) then {
					_TempAmmo pushBack _Temp;
					_TempMagazines pushBack _x;
					_TempAmmoMax PushBack _Temp2;
				};
			} forEach _MagazinesTurret;

			if !((count _TempAmmo) isEqualTo 0) then {
				_Ammo pushBack _TempAmmo;
				_AmmoMax pushBack _TempAmmoMax;
				_Magazines PushBack _TempMagazines;
				_Turrets pushBack _x;
			};
		};
	} forEach (AllTurrets _Veh);

	// Check if there's anything to rearm
	If ((Count _Turrets) isEqualTo 0) exitWith {
		["Rearming not needed", _Veh] spawn FUNC(Hints);
	};

	// Start servicing the vehicle
	_Full = [];
	_Index2 = 0;
	While {((_Veh in GVAR(Array)) && !((Count _Turrets) isEqualTo 0))} do {
		// Message
		Switch _Index2 do {
			Case 0: {_Msg = "Rearming vehicle --"};
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
					[[_Veh,_Turret,_AmmoCount,_x], {
						[_This, {
							Params ["_Veh","_Turret","_AmmoCount","_Magazine"];
							_Veh setMagazineTurretAmmo [_Magazine, _AmmoCount, _Turret];
						}] remoteExec ["BIS_FNC_SPAWN",(Owner (_This select 0))];
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
			};
		};

		_Full = [];
		_Index2 = _Index2 +1;
		Sleep 1;

		if (!(_Veh in GVAR(Array))) exitWith {
			[_SS,true] call FUNC(Available);
		};
	};
	if (_Veh in GVAR(Array)) then {
		[[_Veh],{(_This select 0) setVehicleAmmo 1}] remoteExec ["BIS_FNC_SPAWN",0];
		["Rearming Complete!", _Veh] spawn FUNC(Hints);
	};
} else {
	["Vehicle is unarmed, nothing to rearm.", _Veh] spawn FUNC(Hints);
};
if (_FullService) then {
	["Service complete!", _Veh] spawn FUNC(Hints);
};
if ((driver _Veh) in _Veh) then {
	_Veh engineOn True;
};
[_SS,false] call FUNC(Available);
