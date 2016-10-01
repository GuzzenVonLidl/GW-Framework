#include "scriptComponent.hpp"

FUNC(getStats) = {
	params ["_unit"];
	format ["Player: %1 - Deaths: %2 | Kills: %3 | T-Kills: %4 - %5",
		_unit,
		(_unit getVariable QGVAR(Deaths)),
		(_unit getVariable QGVAR(Kills)),
		(_unit getVariable QGVAR(teamKills)) select 0,
		(_unit getVariable QGVAR(teamKills)) select 1
	];
};

FUNC(extract) = {
	{
		"debug_console" callExtension (([_x] call FUNC(getStats)) + "~0001")
	} forEach allPlayers;
};
