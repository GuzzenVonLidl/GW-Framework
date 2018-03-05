/*
	Author: GuzzenVonLidl
	Deactivates a device in a cinematic way

	Usage:
	[this, "Disable Device", false, 5, true, ""] call GW_Effects_Fnc_addObjectAction;
	[this, "Disable Alarm", false, 5, false, "GW_stopAlarm"] call GW_Effects_Fnc_addObjectAction;

	Arguments:
	0: Object <OBJECT>
	1: AddAction Text <STRING>
	2: Explode <BOOL>
	3: Action Delay <NUMBER>
	4: Delete Object <BOOL>
	5: Custom Event <STRING>

	Return Value: NO

	Public: No
*/
#include "script_Component.hpp"

params ["_box","_actionName","_canExplode",["_delay", 7],"_deleteOnComplete","_eventComplete"];

_box setVariable [QGVAR(blockInventory), true, true];
_box setVariable [QGVAR(canExplode), _canExplode, true];
_box setVariable [QGVAR(delay), _delay, true];
_box setVariable [QGVAR(deleteOnComplete), _deleteOnComplete, true];
_box setVariable [QGVAR(eventComplete), _eventComplete, true];

_box addAction [_actionName, {
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	if (GVARMAIN(mod_ACE3)) then {
		[((_this select 0) getVariable [QGVAR(delay), 3]), _this, {	// On Complete
			(_this select 0) params ["_box"];
			_box setVariable [QGVAR(blockInventory), false, true];

			if (_box getVariable [QGVAR(deleteOnComplete),false]) then {
//				deleteVehicle _box;
				systemChat "delete";
			};

			if ((_box getVariable [QGVAR(eventComplete), ""]) isEqualTo "") then {
				[QGVAR(objectAction), [_box,player]] call CBA_fnc_serverEvent;
			} else {
				[(_box getVariable [QGVAR(eventComplete), ""]), [_box,player]] call CBA_fnc_serverEvent;
			};
		}, {	// On failed

//			["Hello", 3] call GW_Common_Fnc_Hint;

			if (((random 1) < 0.75) && (_box getVariable [QGVAR(canExplode), false])) then {
				playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", player, false, (getPosASL player), 2, 1, 15];
				sleep (3 + (random 5));
				_box setDamage 1;
				_explosion = CreateVehicle ["DemoCharge_Remote_Ammo_Scripted", (getPosATL _box), [], 0, "CAN_COLLIDE"];
				_explosion setDamage 1;
			};
		}] call ace_common_fnc_progressBar;
	};
}, {}, 6, true, true, "", "((alive _target) && (_target getVariable ['GW_Effects_blockInventory', false]))", 5];
