/*
	Author: Tupolov
	Generates snow effects, slightly tweaked for performance
	Needs to be called with a perFrameHandler

	Usage:
	[] call GW_Effects_Fnc_snow;

	Arguments:
	0: Radius around players lightning can hit (Default: 500m) <NUMBER>
	1: Base position for lightning strike <ARRAY>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

private _a = 0;
while {GVAR(snowEnabled) && _a < GVAR(snowIntensity)} do {

	private _vel = GVAR(snowVelocity);
	private _fi = GVAR(snowFidelity);
	private _max = GVAR(snowMaxDistance);

	if (vehicle player != player) then {
		_max = _max * 2;
		GVAR(snowTempIntensity) = GVAR(snowIntensity);
		GVAR(snowIntensity) = GVAR(snowIntensity) * 9;
	} else {
		GVAR(snowIntensity) = GVAR(snowTempIntensity);
	};

	for "_d" from _fi to _max step _fi do {
		private _pos = (getposASL player);
		private _height = (_max - _d + 2) min 12;
		if (speed player > 30) then {
			_height = 8;
		};
		private _dpos = [
			((_pos select 0) + (_d - (random (2*_d))) + (((velocity (vehicle player)) select 1)*1)),
			((_pos select 1) + (_d - (random (2*_d))) + (((velocity (vehicle player)) select 0)*1)),
			(_pos select 2) + _height
		];
		private _hdpos = [_dpos select 0, _dpos select 1, (_dpos select 2) + 20];
		private _ldpos =+ _dpos; _ldpos = ASLtoATL _ldpos; _ldpos set [2,0.3]; _ldpos = ATLtoASL _ldpos;

		if !(lineIntersects [_ldpos, _hdpos]) then {
			private _ttl = (_height/2);
			private _surfaces = lineIntersectsSurfaces [_dpos,_ldpos,player,player,true,1];
			if (count _surfaces > 0) then {
				private _surfHeight = (((_surfaces select 0) select 0) select 2);
				private _dist = (_dpos select 2) - _surfHeight;
				_ttl = ((_dist / _vel) * 0.5) min (_height/2);
			};

			private _snowDrop = selectRandom [
				["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,(1 + ceil(random 7)),0],
				["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,13,0],
				["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,(1 + ceil(random 7)),0],
				["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,16,0],
				["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,(1 + ceil(random 7)),0]
			];
			drop [_snowDrop, "", "Billboard", 1, _ttl, ASLToATL _dpos, [0,0, 0 - _vel], 1, 0.0000001, 0.000, 0.7, [(0.02 + (random 0.06))], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, 0.7, "", "", ""];
		};
		_a = _a + 1;
	};
};
