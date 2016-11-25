#include "scriptComponent.hpp"

PREP(getRespawns);
PREP(HandlerKilled);
PREP(HandlerRespawn);

GVAR(ServerConnections) = [];
GVAR(ServerDead) = [];
GVAR(ServerDeadPermanent) = [];

[QGVAR(Events), {
	params ["_unit","_event"];
	private _uid = getPlayerUID _unit;

	switch (_event) do {
		case "connect": {
			private _connectionType = "jipBlock";
			if (GVAR(JIP) || (time < 10)) then {
				_connectionType = "connection";
				if !(_uid in GVAR(ServerConnections)) then {
					GVAR(ServerConnections) pushBackUnique _uid;
				} else {
					if (_uid in GVAR(ServerDeadPermanent)) then {
						_connectionType = "reslot";
					};
				};
			};
			private _respawns = GVAR(Count);
			if (_uid in GVAR(ServerDead)) then {
				_respawns = (GVAR(Count) - ({_x isEqualTo _uid} count GVAR(ServerDead)));
			};
			_unit setVariable [QGVAR(isSpectating), false, true];
			_unit setVariable [QGVAR(Count), _respawns, true];
			_unit setVariable [QGVAR(startingPos), (getPosATL _unit), true];
			[QGVAR(Events), [_unit, _connectionType], _unit] call CBA_fnc_targetEvent;
		};

		case "connection": {	// New Player
			systemChat format ["%1 connected to server", (name _unit)];
			_respawns = ([_unit] call FUNC(getRespawns));
			if (GVAR(Mode) isEqualTo 1) then {
				systemChat format ["%1 have %2 lives remaining", (name _unit), _respawns];
			};
			if (GVAR(Mode) isEqualTo 2) then {
				systemChat format ["Your team have %1 lives remaining", _respawns];
			};
		};

		case "reslot": {	// Move to spectator
			systemChat format ["%1 is trying to re-slot", (name _unit)];
			[QGVAR(SpectatorToggle), [_unit, true], _unit] call CBA_fnc_targetEvent;
		};

		case "respawn": {
			_respawns = ([_unit] call FUNC(getRespawns));

			if (_respawns >= 1) then {
				if (call GVAR(IsSpectator)) then {
					[QGVAR(SpectatorToggle), [_unit, false], _unit] call CBA_fnc_targetEvent;
				};
				if (_respawns isEqualTo 1) then {
					systemChat "Last life!!, when you die you will be in spectator";
				} else {
					systemChat format ["%1 lives remaining", _respawns];
				};
			};
		};

		case "respawnServer": {
			GVAR(ServerDead) pushBack _uid;
			if (GVAR(Mode) isEqualTo 1) then {
				_unit setVariable [QGVAR(Count), ((_unit getVariable QGVAR(Count)) - 1)];
			};
			if (GVAR(Mode) isEqualTo 2) then {
				switch (GETSIDE(_unit)) do {
					case 0: {
						DEC(GVAR(CountTeamEast));
					};
					case 1: {
						DEC(GVAR(CountTeamWest));
					};
					case 2: {
						DEC(GVAR(CountTeamIndependent));
					};
					case 3: {
						DEC(GVAR(CountTeamCivilian));
					};
				};
			};
			publicVariable QGVAR(CountTeamEast);
			publicVariable QGVAR(CountTeamWest);
			publicVariable QGVAR(CountTeamIndependent);
			publicVariable QGVAR(CountTeamCivilian);

			if (([_unit] call FUNC(getRespawns)) >= 1) then {
				[QGVAR(Events), [_unit, "respawn"], _unit] call CBA_fnc_targetEvent;
			} else {
				GVAR(ServerDeadPermanent) pushBack _uid;
				[QGVAR(SpectatorToggle), [_unit, true], _unit] call CBA_fnc_targetEvent;
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
		(["Initialize", [_unit, [], true]] call BIS_fnc_EGSpectator);
	} else {
		cutText ["","BLACK IN",5];
		(["Terminate"] call BIS_fnc_EGSpectator);
		if (([_unit] call FUNC(getRespawns)) >= 1) then {
			_unit setPosATL (_unit getVariable QGVAR(startingPos));
		};
	};
}] call CBA_fnc_addEventHandler;

GVAR(IsSpectator) = {
	(["IsSpectating"] call BIS_fnc_EGSpectator)
};

["CAManBase", "Killed", {
	_this call FUNC(HandlerKilled);
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "Respawn", {
	_this call FUNC(HandlerRespawn);
}] call CBA_fnc_addClassEventHandler;

[
	QGVAR(Mode), "LIST",
	["Respawn Type", "How respawns are handeled"],
	QUOTE(ADDON), [[0,1,2], ["Normal (No limits)", "Player Tickets", "Team Tickets"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(Count), "LIST",
	["Player Respawns", "Amount of lives each player gets"],
	QUOTE(ADDON), [[0,1,2,3,4,5,6,7,8], ["No Respawns","1","2","3","4","5","6","7"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(TeamRespawnsWest), "LIST",
	["Team Respawns West", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(CountTeamEast), "LIST",
	["Team Respawns East", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(CountTeamIndependent), "LIST",
	["Team Respawns Independent", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], false
] call FUNCMAIN(settingsInit);

[
	QGVAR(JIP), "LIST",
	["Join in progress", ""],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], false
] call FUNCMAIN(settingsInit);

if (hasInterface) then {
	[{
		if !(GVAR(Mode) isEqualTo 0) then {
			[QGVAR(Events), [player, "connect"]] call CBA_fnc_serverEvent;
		};
	}, [], 1] call CBA_fnc_waitAndExecute;
};
