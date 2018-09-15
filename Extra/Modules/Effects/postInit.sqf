#include "script_Component.hpp"

[QGVARMAIN(serverReady), {
	if (GVAR(disableRedOffroads)) then {
		["Offroad_01_armed_base_F", "init", {
			[{
				params [
					"_car"
				];
				private _random = selectRandom ["01","02","03","04","05","06","07","08","09","10","11","12"];
				private _texture = (format ["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_%1_CO.paa", _random]);
				_car setObjectTextureGlobal [0, _texture];
			}, _this, 5] call CBA_fnc_waitAndExecute;
		}, true, [], true] call CBA_fnc_addClassEventHandler;
	};

	if (GVAR(AdvLightning)) then {
		LOG("Activating Advanced Lightning");
		if (isNil QGVAR(moduleGroup)) then {
			GVAR(moduleGroup) = (createGroup sideLogic);
		};
		[] spawn {
			while {GVAR(AdvLightning)} do {
				GVAR(AdvLightningSleep) = (3 + (random 150));	// Next Lightning
				if (rain > 0.4) then {
					private _radius = (random [10, 500, 1000]);
					private _dir = (random 360);
					private _players = [];

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
				sleep GVAR(AdvLightningSleep);
			};
		};
	};

	addMissionEventHandler ["BuildingChanged", {
		params ["_previousObject", "_newObject", "_isRuin"];
		if (_isRuin) then {
			private _pos = (getPos _previousObject);
			private _radius = (sizeOf (typeOf _previousObject));
			private _objectsInBuilding = (nearestObjects [_pos, ["NonStrategic","Strategic","Thing"], _radius]);

			_objectsInBuilding deleteAt (_objectsInBuilding find _newObject);

			{
				if (!isPlayer _x) then {
					_x setDamage [1, false];
				};
			} forEach (_pos nearEntities ["Man", _radius]);

			{
				if ((isDamageAllowed _x) && !(isObjectHidden _x) && ((vehicleVarName _x) isEqualTo "") && ((actionIDs _x) isEqualTo [])) then {
					deleteVehicle _x;
				};
			} forEach _objectsInBuilding;
		};
	}];
}] call CBA_fnc_addEventHandler;

[QGVAR(say3D), {
	params ["_logic","_sound"];
	_logic say3D _sound;
}] call CBA_fnc_addEventHandler;

[QGVAR(objectAction), {		// Default custom Event on complete for function GW_Effects_Fnc_addObjectAction
	systemChat str _this;
}] call CBA_fnc_addEventHandler;

["GW_stopAlarm", {
	[false] call GW_Effects_Fnc_stopAlarm;
}] call CBA_fnc_addEventHandler;
