/*
	Author: GuzzenVonLidl
	Deactivates a device in a cinematic way

	Usage:
	[this, "Disable Device", false, 5, true, ""] call GW_Effects_Fnc_addObjectAction;
	[this, "Disable Alarm", false, 5, false, "GW_stopAlarm"] call GW_Effects_Fnc_addObjectAction;

	Arguments:
	0: Object <OBJECT>
	1: AddAction Text <STRING>
	2: Action Delay <NUMBER>
	3: Explode <BOOL>
	4: Delete Object <BOOL>
	5: Custom Event <STRING>

	Return Value: NO

	Public: No
*/
#include "script_Component.hpp"

params ["_box", ["_actionName", "", [""]], ["_delay", 7, [0]], ["_canExplode", false, [true]], ["_deleteOnComplete", false, [true]], ["_eventComplete", "", [""]]];

_box setVariable [QGVAR(blockInventory), true, true];
_box setVariable [QGVAR(objectActions), [_actionName, _delay, _blockInventory, _canExplode, _deleteOnComplete, _eventComplete], true];

_box addEventHandler ["ContainerOpened", {
	params ["_container", "_unit"];
	if (_container getVariable [QGVAR(blockInventory), true]) then {
		player action ["Gear", objNull];
	};
}];

_box addAction [_actionName, {
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

	((_this select 0) getVariable QGVAR(objectActions)) params ["_actionName", "_delay"];

	[_actionName, _delay, {true}, {
		((_this select 0) select 0) params ["_box"];
		(_box getVariable QGVAR(objectActions)) params ["_actionName", "_delay", "_blockInventory", "_canExplode", "_deleteOnComplete", "_eventComplete"];

		_box setVariable [QGVAR(blockInventory), false, true];

		if (_deleteOnComplete) then {
			deleteVehicle _box;
		};

		if (_eventComplete isEqualTo "") then {
			[QGVAR(objectAction), [_box,player]] call CBA_fnc_serverEvent;
		} else {
			[_eventComplete, [_box,player]] call CBA_fnc_serverEvent;
		};

	}, {
		((_this select 0) select 0) params ["_box"];
		(_box getVariable QGVAR(objectActions)) params ["_actionName", "_delay", "_blockInventory", "_canExplode", "_deleteOnComplete", "_eventComplete"];

		if (_canExplode && ((random 1) < 0.75)) then {
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", player, false, (getPosASL player), 2, 1, 15];
			sleep (3 + (random 5));
			_box setDamage 1;
			_explosion = CreateVehicle ["DemoCharge_Remote_Ammo_Scripted", (getPosATL _box), [], 0, "CAN_COLLIDE"];
			_explosion setDamage 1;
		};
	}, [(_this select 0)]] call CBA_fnc_progressBar;
}, {}, 6, true, true, "", "((alive _target) && (_target getVariable ['GW_Effects_blockInventory', false]))", 5];
