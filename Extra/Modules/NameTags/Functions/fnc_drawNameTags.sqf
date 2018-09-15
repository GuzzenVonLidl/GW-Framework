#include "script_Component.hpp"

private _alpha = 0;
private _icon = "";

private _headPos = (ASLToAGL (eyePos player));
private _headMultiply = (_headPos vectorAdd ((getCameraViewDirection player) vectorMultiply 100));
private _headDir = (player getDir _headMultiply);
private _dir = (player getdir _x) - _headDir;

private _distance = (player distance _x);
private _posZ = (_x modelToWorldVisual (_x selectionPosition "pelvis")) select 2;
private _height = (_posZ + ([0.9, 1.3, ((_distance - 4) / GVAR(distance))] call BIS_fnc_lerp));
(visiblePosition _x) params ["_posX","_posY"];

if (_dir < 0) then {_dir = _dir + 360};
if (_dir > 360) then {_dir = _dir - 360};

if (_distance < GVAR(distance)) then {
	_alpha = ([1, 0, ((_distance - 3) / GVAR(distance))] call BIS_fnc_lerp);
};
if ((_dir > 350) || (_dir < 10)) then {
	_alpha = ([1, 0, ((_distance - 3) / (GVAR(distance) * 2.5))] call BIS_fnc_lerp);
};

private _color = [1,1,1,_alpha];

if (_x in (units player)) then {
	if ((assignedTeam _x) isEqualTo "RED") then {
		_color = [1,0,0,_alpha];
	};
	if ((assignedTeam _x) isEqualTo "GREEN") then {
		_color = [0,1,0,_alpha];
	};
	if ((assignedTeam _x) isEqualTo "BLUE") then {
		_color = [0,0,1,_alpha];
	};
	if ((assignedTeam _x) isEqualTo "YELLOW") then {
		_color = [1,1,0,_alpha];
	};
} else {
	_color = [0.77, 0.51, 0.08, _alpha];
};

if !(_alpha isEqualTo 0) then {
	drawIcon3D [_icon, _color, [_posX, _posY, _height], 0, 0, 0, (name _x), 0, 0.04, "RobotoCondensed"];
};

/*
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorRedTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorBlueTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorGreenTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorYellowTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorWhiteTeam") call bis_fnc_colorConfigToRGBA
*/
