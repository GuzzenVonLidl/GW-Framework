/*
	https://community.bistudio.com/wiki/setSkill_array

	Novice < 0.25
	Rookie >= 0.25 and <= 0.45
	Recruit > 0.45 and <= 0.65
	Veteran > 0.65 and <= 0.85
	Expert > 0.85
*/
#include "scriptComponent.hpp"

[QGVARMAIN(missionStarted), {
	["CAManBase", "init", {
		[{
			_this call FUNC(Init);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	["CAManBase", "Respawn", {
		[{
			_this call FUNC(HandlerRespawn);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
