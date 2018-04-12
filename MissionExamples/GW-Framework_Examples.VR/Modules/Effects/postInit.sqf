#include "script_Component.hpp"

[QGVARMAIN(serverReady), {
	["Offroad_01_armed_base_F", "init", {
		if (GVAR(disableRedOffroads)) then {
			[{
				params [
					"_car"
				];
				private _random = selectRandom ["01","02","03","04","05","06","07","08","09","10","11","12"];
				private _texture = (format ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_%1_CO.paa", _random]);
				_car setObjectTextureGlobal [0, _texture];
			}, _this, 5] call CBA_fnc_waitAndExecute;
		};
	}, true, [], true] call CBA_fnc_addClassEventHandler;

	if (GVAR(AdvLightning)) then {
		LOG("Activating Advanced Lightning");

		if (isNil QGVAR(LightningPFH)) then {
			GVAR(moduleGroup) = (createGroup sideLogic);
			GVAR(LightningPFH) = [{
				if (time >= GVAR(AdvLightningSleep)) then {
					private _radius = (random [10, 500, 1000]);
					private _dir = (random 360);
					private _players = [];

					GVAR(AdvLightningSleep) = (time + 3) + (random 150);	// Next Lightning

					{
						if (isNull (objectParent player)) then {
							_players pushback _x;
						};
					} forEach allPlayers;

					_player = ((selectRandom _players) call GW_Common_fnc_getPosATL);
					_logic = GVAR(moduleGroup) createUnit ["Logic",[0,0,0],[],0,"CAN_COLLIDE"];
					_logic setPosATL (_player getPos [_radius,_dir]);
					[_logic,nil,true] spawn BIS_fnc_moduleLightning;
				};
			}, 1, []] call CBA_fnc_addPerFrameHandler;
		} else {
			[GVAR(LightningPFH)] call CBA_fnc_removePerFrameHandler;
			GVAR(LightningPFH) = nil;
		};
	};
}] call CBA_fnc_addEventHandler;
