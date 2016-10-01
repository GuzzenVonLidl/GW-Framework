
[{
	params ["_time","_town"];
	[
		["TITLE", "Local Time and Date:"],
		["TEXT", format ["%1 - %2: %3/%4", _time,(date select 2),(date select 1),(date select 0)]],
		["TEXT", format ["Location: %2 - %1", _town, toUpper(worldName)]]
	] call FUNC(startText);
}, [_time,_town], 1] call CBA_fnc_waitAndExecute;

[{
	[
		["TITLE", format ["%1", briefingName]],
		["TEXT", format ["By: %1", (getMissionConfigValue "author")]],
		["TEXT", format ["Version: %1", getNumber (missionConfigFile >> "GW_FRAMEWORK" >> "Naming" >> "Version")]]
	] call FUNC(startText);
}, [], 7] call CBA_fnc_waitAndExecute;
