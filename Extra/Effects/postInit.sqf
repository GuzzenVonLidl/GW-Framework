#include "scriptComponent.hpp"

[QGVARMAIN(serverReady), {
	if (GVAR(AdvLightning)) then {
		LOG("Activating Advanced Lightning");
		GVAR(LightningPFH) = [{
			private _radius = 700;
			private _players = [];

			if ((lightnings > 0.1) && (time >= GVAR(LightningSleep))) then {
				GVAR(LightningSleep) = (time + (30/lightnings));

				{
					if (isNull (objectParent player)) then {
						_players pushback _x;
					};
				} forEach allPlayers;

				[_radius, (selectRandom _players) call EFUNC(Common,GetPosATL)] call FUNC(LightningEffect);
			};
		}, 5, []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	if (GVAR(snowEnabled)) then {
		GVAR(PFH) = [{
			[] call FUNC(snow);
		}, 0.5, []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;
