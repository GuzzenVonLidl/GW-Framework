/*
	Author: GuzzenVonLidl
	Spawns a single artillary round, falling from 1000m

	Usage:
	[this] call GW_Effects_Fnc_createInit;

	Arguments:
	0: Object <OBJECT>

	Return Value: NO

	Public: No

*/
#include "..\scriptComponent.hpp"

params ["_box"];

_box setVariable [QGVAR(blockInventory), true, true];

_box addAction ["Unlock Box", {
	[_this select 0] spawn {
		params ["_box"];
		_currentWeapon = (currentWeapon player);
		player action ["SwitchWeapon", player, player, 99];
		sleep 3;
		player PlayMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 6.4;
		player PlayMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player selectWeapon _currentWeapon;
		if ((random 1) < 0.75) then {
			_box setVariable [QGVAR(blockInventory), false, true];
		} else {
			systemChat "DEBUG-Effects: Create Failed";
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", player, false, (getPosASL player), 2, 1, 15];
			sleep (3 + (random 5));
			_box setDamage 1;
			_explosion = CreateVehicle ["DemoCharge_Remote_Ammo_Scripted", (getPosATL _box), [], 0, "CAN_COLLIDE"];
			_explosion setDamage 1;
		};
	};
}, {}, 6, true, true, "", "((alive _target) && (_target getVariable ['GW_Effects_blockInventory', false]))", 5];
