#include "scriptComponent.hpp"

PREP(HandlerAdjustFPS);

GVAR(Enable) = true;
GVAR(Objects) = [];

["CAManBase", "init", {
	[{
		[QGVAR(addObject), (_this select 0)] call CBA_fnc_LocalEvent;
	}, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	[{
		[QGVAR(removeObject), (_this select 0)] call CBA_fnc_LocalEvent;
	}, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

[QGVARMAIN(missionStarted), {
	[{
		if ((hasInterface && !isServer) && GVAR(Enabled)) then {
			if (isNil QGVAR(PFH)) then {
				GVAR(PFH) = [{
					[] call FUNC(HandlerAdjustFPS);
				}, 5, []] call CBA_fnc_addPerFrameHandler;
			} else {
				[GVAR(PFH)] call CBA_fnc_removePerFrameHandler;
				GVAR(PFH) = nil;
			};
		};
	}, [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(addObject), {
	GVAR(Objects) pushBackUnique _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(removeObject), {
	GVAR(Objects) deleteAt (GVAR(Objects) find _this);
}] call CBA_fnc_addEventHandler;

[QGVAR(requestUpdate), {
	params ["_object"];
	_object setPos (getPos _object);
}] call CBA_fnc_addEventHandler;

[
	QGVAR(Enabled), "LIST",
	["Dynamic unit caching", "Automatically disables units in the distance from player, depending on viewdistance"],
	QUOTE(ADDON), [[true, false], ["Enable","Disable"], 1], false, {
		params ["_enable"];
		if (_enable && (isNil QGVAR(PFH)) && hasInterface) then {
			GVAR(PFH) = [{
				[] call FUNC(HandlerAdjustFPS);
			}, 5, []] call CBA_fnc_addPerFrameHandler;
		} else {
			[GVAR(PFH)] call CBA_fnc_removePerFrameHandler;
			GVAR(PFH) = nil;
		};
	}, "client"
] call FUNCMAIN(settingsInit);
