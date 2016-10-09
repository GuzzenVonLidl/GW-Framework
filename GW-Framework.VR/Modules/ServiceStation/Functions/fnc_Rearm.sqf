#include "..\scriptComponent.hpp"

private ["_Armed","_Temp"];
params ["_Veh","_SS","_FullService"];
if !(_FullService) then {
	GVAR(Active) PushBack _SS;
	PublicVariable QGVAR(Active)
};

if ((count magazinesDetail _veh) > 0) then {
	_Armed = True;
} else {
	_Veh setVehicleAmmo 0.51;
	if ( ((count magazinesDetail _veh) > 0) or ((typeOf _veh == "I_Heli_light_03_F") or (typeOf _Veh == "I_Heli_light_03_unarmed_F")) ) then {
		_Armed = True;
	} else {
	_Armed = False;
	};
};

if (_Armed) then {
	if (_Veh isKindOf "PLANE") then {GVAR(RearmSleep) = GVAR(RearmSleepPlane)};
	_Temp = 0;
	While {((_Veh in GVAR(Actions)) && (_Temp <= GVAR(RearmSleep)))} do {
		["Rearming", _Veh] spawn FUNC(Hints);
		sleep 1;
		["Rearming.", _Veh] spawn FUNC(Hints);
		sleep 1;
		["Rearming..", _Veh] spawn FUNC(Hints);
		sleep 1;
		_Temp = _Temp + 3;
		if (!(_Veh in GVAR(Actions))) exitWith {[_SS,true] call FUNC(Available)};
	};
	if (_Veh in GVAR(Actions)) then {
		_Veh setvehicleammodef 1;
		["Rearming Complete!", _Veh] spawn FUNC(Hints);
	};
} else {
	["Vehicle is unarmed, nothing to rearm.", _Veh] spawn FUNC(Hints);
};
Sleep 2;
if (_FullService) then {["Service complete!", _Veh] spawn FUNC(Hints)};
if ((driver _Veh) in _Veh) then {_Veh engineOn True};
[_SS,false] call FUNC(Available);
