#include "..\scriptComponent.hpp"

params ["_unit", "_weapon", ["_muzzle", "", [""]], "_mode","_ammo","_magazine","_projectile","_gunner"];

if (isPlayer _unit) exitWith {
	_filter = (([currentWeapon _unit] call BIS_fnc_itemType) select 1);
	if ((_unit isEqualTo player) &&
		((_filter isEqualTo "GrenadeLauncher") || (_filter isEqualTo "MachineGun") || (_filter isEqualTo "RocketLauncher") || (_filter isEqualTo "Cannon") || (_filter isEqualTo "MissileLauncher"))) then {
		addCamShake [1.5,0.3,500-(random 400)];
	};
};

if (_unit getVariable [QGVAR(Check),false]) exitWith {false};
if ((currentWeapon _unit) isEqualTo "") exitWith {false};

_grp = (group _unit);

// modified from COMBAT which may make units move really slowly if they can"t snap out of it. Instead the game"s organic COMBAT mode may come on if under attack which automatically disables.
_grp setBehaviour  "AWARE";

_chance = random 100;
if ((_chance < 5) && GVAR(USESMOKE)) then {
	_unit fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"]; // reduced smoke grenade chance from 10 to 5
};

_unit setVariable [QGVAR(Check),true];
_randomPos = [(position _unit select 0) + (random 60) - (random 60),(position _unit select 1) + random 60 - random 60];
if (_unit distance _randomPos <= 20) then {
	_unit setUnitPos "DOWN";
} else {
	_unit setUnitPos "AUTO";
};

doStop _unit;

_unit doMove _randomPos;
_grp setSpeedMode "FULL";

_chance = random 100;
if (_chance > 50) then {
	if ((currentWeapon _unit) isEqualTo (primaryWeapon _unit) && GVAR(EVASIVEANIMATIONS)) then {
		_anim = floor(random 4); // changed script from round to floor to give even chance of each case
		switch _anim do {
			case 0: {
				_unit playMoveNow "AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon";	// strafes right and drops to kneeling
			};
			case 1: {
				_unit playMoveNow "AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon";	// runs diagonal front left and drops to kneeling
			};
			case 2: {
				_unit playMoveNow "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"; // dive right
				_unit setUnitPos "DOWN"; // added to prevent unit standing up between anims
				[_unit] spawn {
					_unit = _this select 0;
					sleep (3 + random 3);
					_unit playMoveNow "AmovPpneMevaSlowWrflDf"; // crawl forward
				};
				_unit setUnitPos "AUTO"; // back to default
			};
			case 3: {
				_unit playMoveNow "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft"; // dive left
				_unit setUnitPos "DOWN"; // added to prevent unit standing up between anims
				[_unit] spawn {
					_unit = _this select 0;
					sleep (3 + random 3);
					_unit playMoveNow "AmovPpneMevaSlowWrflDf"; // crawl forward
				};
				_unit setUnitPos "AUTO"; // back to default

			};
		};
	};

	if (_chance > 400) then {
		_unit forceWeaponFire [currentWeapon _unit, "Single"];
	};
};

[_weapon] spawn {
	params ["_weapon"];
	_weapon suppressFor (5 + random 10);
	_aimAccuracy = (_weapon skill "aimingAccuracy");
	_weapon setSkill ["aimingAccuracy",_aimAccuracy/(1 + random 1)];
	sleep (10-((skill _weapon)*7));
	_weapon setSkill ["aimingAccuracy",skill _weapon];
};

[_unit,_weapon] spawn {
	params ["_unit", "_weapon"];
	_posFirer = position _weapon;
	if (_posFirer distance [0,0,0] < 100) exitWith {false};
	_grp = (group _unit);
	_aimAccuracy = _unit skill "aimingAccuracy";
	_courage = _unit skill "courage";
	_commanding = _unit skill "commanding";
	{
		_x setSkill ["aimingAccuracy",random 0.2 + ((skill _x)/(2 * random 4))];
		_x suppressFor (5 + random 20);
		if (GVAR(LMGSUPPRESSION) && (getText(configfile >> "CfgWeapons" >> currentWeapon _x >> "cursor")) isEqualTo "mg") then {
			[_x,_weapon] spawn FUNC(LMG);
		};
	} forEach (units(group _unit));
	if (GVAR(WAYPOINTS)) then {
		_grp addWaypoint [_posFirer, 0]; // changed index from 1 to 0
		[_grp, 0] setWaypointType "SAD"; //modified from Destroy waypoint which may make units attack static objects
		[_grp, 0] setWaypointBehaviour "UNCHANGED"; // changed from COMBAT to UNCHANGED
		sleep 5;
		//	_grp setCurrentWaypoint [_grp, 0];
	};
	_unit setSkill ["courage",(skill _unit)/4];
	_unit setSkill ["commanding",0];
	sleep (10 - ((skill _unit) * (1 + random 8)));
	_unit setSkill ["aimingAccuracy",_aimAccuracy];
	_unit setSkill ["courage",_courage];
	_unit setSkill ["commanding",_commanding];
	_unit doTarget _weapon;
	_unit doFire _weapon;
	_unit setVariable [QGVAR(Check),false];
};
