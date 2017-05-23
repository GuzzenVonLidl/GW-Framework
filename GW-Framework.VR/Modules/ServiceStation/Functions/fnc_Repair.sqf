#include "..\scriptComponent.hpp"

params ["_Veh","_SS","_FullService"];
private ["_Index","_FuelHP","_EngineHP","_HullHP","_TurretHP","_GunHP","_MainRotorHP","_atrqHP","_InstrumentsHP","_CarHullHP","_LeftTrackHP","_RightTrackHP","_Parts","_PartNames","_PartsHP","_Part","_PartName","_PartHP","_Partname","_Wheels","_y","_State","_index","_repairSpeed"];

if !(_FullService) then {
	GVAR(Active) PushBack _SS;
	PublicVariable QGVAR(Active);
};

_Index = 0;
_Veh engineOn False;
_repairSpeed = REPAIRINGSPEED;

// Vehicle Hit Points
// General
_FuelHP = _veh getHitPointDamage "HitFuel";
_EngineHP = _Veh getHitPointDamage "hitEngine";
_HullHP = _veh getHitPointDamage "HitHull";
_TurretHP = _veh gethitpointdamage "HitTurret";
_GunHP = _veh gethitpointdamage "HitGun";

// Helicopter
_MainRotorHP = _veh getHitPointDamage "HitHRotor";
_atrqHP = _veh getHitPointDamage "HitVRotor";
_InstrumentsHP = _veh getHitPointDamage "HitAvionics";

// Vehicles with wheels
_CarHullHP = _veh gethit "Karoserie";
_CarHullHP = _Veh GetHitPointDamage "HitBody";

// Tanks
_LeftTrackHP = _veh gethitpointdamage "HitLTrack";
_RightTrackHP = _veh gethitpointdamage "HitRTrack";

_Parts = []; // Backup for modded vehicles which cannot be defined?

Switch (true) do {
	case (_Veh isKindOf "TANK"): {
		_Parts = ["HitEngine","HitHull","HitTurret","HitGun","HitLTrack","HitRTrack"];
		_PartNames = ["Engine","Hull","Turret","Gun","Left Tracks","Right Tracks"];
		_PartsHP = [_EngineHP,_HullHP,_TurretHP,_GunHP,_LeftTrackHP,_RightTrackHP];
	};

	case (_Veh isKindOf "CAR"): {
		_Parts = ["HitFuel","hitEngine","Karoserie"];
		_PartNames = ["Fuel System","Engine","Hull"];
		_PartsHP = [_FuelHP,_EngineHP,_CarHullHP];
	};

	case (_Veh isKindOf "HELICOPTER"): {
		_Parts = ["HitEngine","HitHull","HitAvionics","HitVRotor","HitHRotor"];
		_PartNames = ["Engine","Hull","Instruments","ATRQ","MRotor"];
		_PartsHP = [_EngineHP,_HullHP,_InstrumentsHP,_atrqHP,_MainRotorHP];
	};

	case (_Veh isKindOf "PLANE"): {
		_Parts = ["HitHull"];
		_PartNames = ["Hull"];
		_PartsHP = [_HullHP];
		_repairSpeed = REPAIRINGSPEEDPLANE;
	};
};

// Repairing
for "_i" from 1 to (count _Parts) do {
	if (!(_Veh in GVAR(Array))) exitWith {[_SS,true] call FUNC(Available)};
	_Part = (_Parts select _Index);
	_PartName = (_PartNames select _Index);
	_PartHP = (_PartsHP select _Index);

	[(format ["Inspecting %1.",_Partname]), _Veh] spawn FUNC(Hints);
	Sleep INSPECTIONSPEED;

	if (_PartHP >= 0.01) then {
		While {_PartHP > 0.01 && (_Veh in GVAR(Array))} do {
			if (_Veh isKindOf "TANK" and _Index >= 4) then {_repairSpeed = REPAIRINGTRACKSPEED;};
			if (!(_Veh in GVAR(Array))) exitWith {[_SS,true] call FUNC(Available)};
			[(format ["Repairing %1.",_PartName]), _Veh] spawn FUNC(Hints);
			if (_Part == "Karoserie") then {_Veh setHit [_Part, (_PartHP - _repairSpeed)];} else {_Veh setHitPointDamage [_Part, (_PartHP - _repairSpeed)];};
			if (_Part == "Karoserie") then {_PartHP = _Veh gethit _Part} else {_PartHP = _Veh gethitpointdamage _Part};
			sleep 0.33;
			[(format ["Repairing %1..",_PartName]), _Veh] spawn FUNC(Hints);
			_Veh setHitPointDamage [_Part, (_PartHP - _repairSpeed)];
			if (_Part == "Karoserie") then {_PartHP = _Veh gethit _Part} else {_PartHP = _Veh gethitpointdamage _Part};
			sleep 0.33;
			[(format ["Repairing %1...",_PartName]), _Veh] spawn FUNC(Hints);
			_Veh setHitPointDamage [_Part, (_PartHP - _repairSpeed)];
			if (_Part == "Karoserie") then {_PartHP = _Veh gethit _Part} else {_PartHP = _Veh gethitpointdamage _Part};
			sleep 0.33;
		};
		[(format ["%1 is now repaired.",_PartName]), _Veh] spawn FUNC(Hints);
		sleep 2;
	} else {
		[(format ["%1 is not in need of repairs.",_PartName]), _Veh] spawn FUNC(Hints);
		sleep 2;
	};
	_Index = _Index +1;
};

//	Fixing Wheels
if (_Veh isKindOf "CAR") then {
	if !(_Veh in GVAR(Array)) exitWith {[_SS,true] call FUNC(Available)};
	_Wheels = 2;
	_Index = 1;
	if (_veh getHit "wheel_1_3_steering" >= 0) then {_Wheels = 3};
	if (_veh getHit "wheel_1_4_steering" >= 0) then {_Wheels = 4};

	for [{_y=1},{_y<=2},{_y=_y+1}] do {
		for [{_i=1},{_i<=(_Wheels)},{_i=_i+1}] do {
			if !(_Veh in GVAR(Array)) exitWith {[_SS,true] call FUNC(Available)};

			["Inspecting Wheel.", _Veh] spawn FUNC(Hints);
			sleep INSPECTIONSPEED;

			private _State = call compile format ["_veh getHit 'wheel_%2_%1_steering'",_i,_Index];
			if (_State > 0.1) then {
				if !(_Veh in GVAR(Array)) exitWith {[_SS,true] call FUNC(Available)};
				["Removing damaged wheel.", _Veh] spawn FUNC(Hints);
				Sleep REMOVEWHEELSPEED;
				call compile format ["_veh setHit ['wheel_%2_%1_steering',1]",_i,_Index];
				["Mounting new wheel.", _Veh] spawn FUNC(Hints);
				Sleep MOUNTWHEELSPEED;
				call compile format ["_veh setHit ['wheel_%2_%1_steering',0]",_i,_Index];
				if (_index == 2 && _i == _Wheels) then {
					["New wheel mounted, all wheels have been inspected and repaired.", _Veh] spawn FUNC(Hints);
				} else {
					["New wheel mounted, inspecting next wheel", _Veh] spawn FUNC(Hints)
				};
			} else {
				if (_Index == 2 && _i == _Wheels) then {
					["Last wheel inspected, all wheels are good", _Veh] spawn FUNC(Hints);
				} else {
					["Wheel is fine, inspecting next wheel", _Veh] spawn FUNC(Hints)
				};
			};
			sleep 2;
			if !(_Veh in GVAR(Array)) exitWith {[_SS,true] call FUNC(Available)};
		};
		_Index = _Index +1;
	};
};

if (!(_Veh in GVAR(Array))) exitWith {[_SS,true] call FUNC(Available)};
["Applying finishing Touches", _Veh] spawn FUNC(Hints);
sleep 5;
_Veh setdamage 0;
["Repairs Complete!", _Veh] spawn FUNC(Hints);
sleep 2;

if (((driver _Veh) in _Veh) && (!_FullService)) then {_Veh engineOn True};
if !(_FullService) then {[_SS,false] call FUNC(Available)} else {[_Veh,_SS,True] call FUNC(Refuel)};