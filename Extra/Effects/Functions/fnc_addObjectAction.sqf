/*
	Author: GuzzenVonLidl
	Spawns a single artillary round, falling from 1000m

	Usage:
	[this] call GW_Effects_Fnc_addObjectAction;

	Arguments:
	0: Object <OBJECT>

	Return Value: NO

	Public: No

*/
#include "..\scriptComponent.hpp"

params ["_box"];

_box setVariable [QGVAR(blockInventory), true, true];
_box addAction ["Disable Device", {
	[1, _this, {	//	[[29415494100# 1675541: pressurewasher_01_f.p3d,epl,0,{}],1.01196,1,0] - _this format
		(_this select 0) params ["_box"];
		if ((random 1) < 0.75) then {
			hint "Device Disabled";
			_box setVariable [QGVAR(blockInventory), false, true];
		} else {
			_box setVariable [QGVAR(blockInventory), false, true];
			systemChat "DEBUG-Effects: Create Failed";
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", player, false, (getPosASL player), 2, 1, 15];
			sleep (3 + (random 5));
			_box setDamage 1;
			_explosion = CreateVehicle ["DemoCharge_Remote_Ammo_Scripted", (getPosATL _box), [], 0, "CAN_COLLIDE"];
			_explosion setDamage 1;
		};
	}, {
		hint "Action Cancled";
	}, "Disabling Device"] call ace_common_fnc_progressBar;
}, {}, 6, true, true, "", "((alive _target) && (_target getVariable ['GW_Effects_blockInventory', false]))", 5];
