/*
	https://community.bistudio.com/wiki/setSkill_array

	Novice < 0.25
	Rookie >= 0.25 and <= 0.45
	Recruit > 0.45 and <= 0.65
	Veteran > 0.65 and <= 0.85
	Expert > 0.85
*/
#include "script_Component.hpp"

[QGVARMAIN(missionStarted), {
	["CAManBase", "init", {
		[{
			_this call FUNC(init);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
	GVAR(unitTrainingBackup) = GVAR(unitTraining);
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	_this call FUNC(setDetectionCoef);

	["CAManBase", "Respawn", {
		[{
			_this call FUNC(setDetectionCoef);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	}, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
