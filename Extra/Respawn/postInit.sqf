/*
	Author: GuzzenVonLidl

	Give player another chance to get back in to the fight

	Usage:
	["GW_Respawn_Events", [player, "secondChanceServer"]] call CBA_fnc_serverEvent;

	Arguments:
	0: Unit <OBJECT>
	1: Event <STRING>

	Return Value: NO

	Public: YES

	------------------------

	Force enable/disable spectator mode

	Usage:
	["GW_Respawn_SpectatorToggle", [player, true]] call CBA_fnc_serverEvent;

	Arguments:
	0: Unit <OBJECT>
	1: Activate <BOOL>

	Return Value: NO

	Public: YES
*/
#include "scriptComponent.hpp"

if (hasInterface) then {
	["CAManBase", "Respawn", {
		[QGVAR(Events), [player, "respawnServer"]] call CBA_fnc_serverEvent;
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	[QGVARMAIN(playerReady), {
		if !(GVAR(Mode) isEqualTo 0) then {
			[QGVAR(Events), [player, "initServer"]] call CBA_fnc_serverEvent;
		};
	}] call CBA_fnc_addEventHandler;
};

[QGVAR(Events), {
	params ["_unit","_event"];
	private _uid = (getPlayerUID _unit);
	private _respawns = 0;

	switch (_event) do {
		case "initServer": {
			private _connectionType = "blockConnect";
			if (GVAR(JIP) || (time < 10)) then {
				_connectionType = "initPlayer";
				if !(_uid in GVAR(ServerConnections)) then {
					GVAR(ServerConnections) pushBackUnique _uid;
				};
			};
			_respawns = GVAR(Count);
			if (_uid in GVAR(ServerDead)) then {
				_respawns = (GVAR(Count) - ({_x isEqualTo _uid} count GVAR(ServerDead)));
				if (_respawns <= 0) then {
					_connectionType = "blockConnect";
				};
			};
			_unit setVariable [QGVAR(isSpectating), false, true];
			_unit setVariable [QGVAR(Count), _respawns, true];
			_unit setVariable [QGVAR(startingPos), (getPosATL _unit), true];
			[QGVAR(Events), [_unit, _connectionType], _unit] call CBA_fnc_targetEvent;
		};

		case "initPlayer": {
			systemChat format ["%1 connected to server", (name _unit)];
			_respawns = ([_unit] call FUNC(getRespawns));
			if (GVAR(Mode) isEqualTo 1) then {
				systemChat format ["%1 have %2 lives remaining", (name _unit), _respawns];
			};
			if (GVAR(Mode) isEqualTo 2) then {
				systemChat format ["Your team have %1 lives remaining", _respawns];
			};
		};

		case "blockConnect": {	//	Move to spectator
			systemChat format ["JIP is diabled or %1 is trying to re-slot", (name _unit)];
			[QGVAR(SpectatorToggle), [_unit, true], _unit] call CBA_fnc_targetEvent;
		};

		case "respawnServer": {
			GVAR(ServerDead) pushBack _uid;

			if (GVAR(Mode) isEqualTo 1) then {
				_respawns = ([_unit] call FUNC(getRespawns));
				DEC(_respawns);
				_unit setVariable [QGVAR(Count), _respawns, true];
			};

			if (GVAR(Mode) isEqualTo 2) then {
				switch (GETSIDE(_unit)) do {
					case 0: {
						DEC(GVAR(CountTeamEast));
						publicVariable QGVAR(CountTeamEast);
					};
					case 1: {
						DEC(GVAR(CountTeamWest));
						publicVariable QGVAR(CountTeamWest);
					};
					case 2: {
						DEC(GVAR(CountTeamIndependent));
						publicVariable QGVAR(CountTeamIndependent);
					};
					case 3: {
						DEC(GVAR(CountTeamCivilian));
						publicVariable QGVAR(CountTeamCivilian);
					};
				};
			};

			if (([_unit] call FUNC(getRespawns)) >= 1) then {
				[QGVAR(Events), [_unit, "respawnPlayer"], _unit] call CBA_fnc_targetEvent;
			} else {
				GVAR(ServerDeadPermanent) pushBack _uid;
				[QGVAR(SpectatorToggle), [_unit, true], _unit] call CBA_fnc_targetEvent;
			};
		};

		case "respawnPlayer": {
			_respawns = ([_unit] call FUNC(getRespawns));

			if (_respawns >= 1) then {
				if (call GVAR(IsSpectator)) then {
					[QGVAR(SpectatorToggle), [_unit, false], _unit] call CBA_fnc_targetEvent;
				};
				if (_respawns isEqualTo 1) then {
					systemChat "Last life!!, when you die you will be in spectator";
				} else {
					systemChat format ["%1 more lives remaining", _respawns];
				};
			};
		};

		case "secondChanceServer": {
			_respawns = ([_unit] call FUNC(getRespawns));
			if (GVAR(Mode) isEqualTo 1) then {
				INC(_respawns);
				_unit setVariable [QGVAR(Count), _respawns, true];
			};

			if (GVAR(Mode) isEqualTo 2) then {
				switch (GETSIDE(_unit)) do {
					case 0: {
						ADD(GVAR(CountTeamEast), 1);
						publicVariable QGVAR(CountTeamEast);
					};
					case 1: {
						ADD(GVAR(CountTeamWest), 1);
						publicVariable QGVAR(CountTeamWest);
					};
					case 2: {
						ADD(GVAR(CountTeamIndependent), 1);
						publicVariable QGVAR(CountTeamIndependent);
					};
					case 3: {
						ADD(GVAR(CountTeamCivilian), 1);
						publicVariable QGVAR(CountTeamCivilian);
					};
				};
			};
			[QGVAR(Events), [_unit, "secondChance"], _unit] call CBA_fnc_targetEvent;
		};

		case "secondChance": {
			_respawns = ([_unit] call FUNC(getRespawns));
			if (_respawns >= 1) then {
				[QGVAR(SpectatorToggle), [_unit, false], _unit] call CBA_fnc_localEvent;
				cutText ["","BLACK IN",5];
				_unit setPosATL (_unit getVariable QGVAR(startingPos));
				systemChat "You have been given a second chance";
				systemChat format ["You now have %1", _respawns];
			};
		};

		default {
			systemChat format ["Error: Moving %1 to spectator", (name _unit)];
			[QGVAR(SpectatorToggle), [_unit, true], _unit] call CBA_fnc_targetEvent;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(SpectatorToggle), {
	params ["_unit","_active"];

	if (GVARMAIN(mod_ACRE)) then {
		[_active] call acre_api_fnc_setSpectator;
	};
	if (GVARMAIN(mod_TFAR)) then {
		[_unit, _active] call TFAR_fnc_forceSpectator;
	};
	_unit setVariable [QGVAR(isSpectating), _active, true];

	if (_active) then {
		cutText ["","BLACK Out",5];
		cutText ["","BLACK IN",5];
		systemChat "You are being moved to spectator";
		_unit setPosATL (getMarkerPos "spectator");
		(["Initialize", [player, [], true]] call BIS_fnc_EGSpectator);
		RscSpectator_allowFreeCam = false;
//		[true] call ace_spectator_fnc_setSpectator;
	} else {
		(["Terminate"] call BIS_fnc_EGSpectator);
	};
}] call CBA_fnc_addEventHandler;
