/*
	Author: GuzzenVonLidl
	Deactivates a device in a cinematic way

	Usage:
	[this, "Disable Device", true, 1] call GW_Effects_Fnc_addObjectAction;

	Arguments:
	0: Object <OBJECT>
	1: AddAction Text <STRING>
	2: Explode <BOOL>
	3: Action Delay <NUMBER>

	Return Value: NO

	Public: No

*/
#include "..\scriptComponent.hpp"

params ["_box","_actionName","_canExplode",["_delay", 7]];

_box setVariable [QGVAR(blockInventory), true, true];
_box setVariable [QGVAR(canExplode), false, true];
_box setVariable [QGVAR(delay), _delay, true];

_box addAction [_actionName, {
	player PlayMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	[((_this select 0) getVariable QGVAR(delay)), _this, {	//	[[29415494100# 1675541: pressurewasher_01_f.p3d,epl,0,{}],1.01196,1,0] - _this format
		(_this select 0) params ["_box"];
		_box setVariable [QGVAR(blockInventory), false, true];
		if (((random 1) < 0.75) && (_box getVariable QGVAR(canExplode))) then {
			systemChat "DEBUG-Effects: Create Failed";
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", player, false, (getPosASL player), 2, 1, 15];
			sleep (3 + (random 5));
			_box setDamage 1;
			_explosion = CreateVehicle ["DemoCharge_Remote_Ammo_Scripted", (getPosATL _box), [], 0, "CAN_COLLIDE"];
			_explosion setDamage 1;
		};
	}, {
		hintSilent "Action Cancled";
		[{
			hintSilent "";
		}, [], 3] call CBA_fnc_waitAndExecute;
	}] call ace_common_fnc_progressBar;
}, {}, 6, true, true, "", "((alive _target) && (_target getVariable ['GW_Effects_blockInventory', false]))", 5];
