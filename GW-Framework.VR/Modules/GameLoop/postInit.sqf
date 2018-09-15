#include "script_Component.hpp"

[QGVARMAIN(serverReady), {
	if (!GVAR(SafeMode_useType) || !(GVAR(SafeMode_Timer) isEqualTo -1)) then {
		GVAR(PFH_SafeMode_Handle) = [{
			GVAR(SafeMode_Count) = GVAR(SafeMode_Count) + 1;
			_time = GVAR(SafeMode_Count);
			if (GVAR(SafeMode_useType)) then {
				_time = (GVAR(SafeMode_Timer) - GVAR(SafeMode_Count));
			};

			if (GVAR(SafeMode_Enabled)) then {
				[QGVAR(SafeMode_CountDown), [_time]] call CBA_fnc_globalEvent;
			};

			if (GVAR(SafeMode_useType) && GVAR(SafeMode_Count) isEqualTo GVAR(SafeMode_Timer)) then {
				[QGVAR(SafeMode_RemoveTimer), true] call CBA_fnc_globalEvent;
			};

		}, 60, []] call CBA_fnc_addPerFrameHandler;
	};

	if (GVAR(civiKillTracker)) then {
		["CAManBase", "Killed", {
			params [["_unit", objNull, [objNull]], ["_killer", objNull, [objNull]]];
			if (getNumber(configfile >> "CfgVehicles" >> (typeOf _unit) >> "side") isEqualTo 3) then {
				GVAR(CiviKillCount) = GVAR(CiviKillCount) + 1;
				[QGVAR(CiviKillEvent), [GVAR(CiviKillCount), _killer], ([] call CBA_fnc_players)] call CBA_fnc_TargetEvent;
			};
		}, true, [], true] call CBA_fnc_addClassEventHandler;
	};
}] call CBA_fnc_addEventHandler;

[QGVARMAIN(playerReady), {
	[QGVAR(setSafetyMode), GVAR(SafeMode_Enabled)] call CBA_fnc_localEvent;

	#include "postInitPlayer.sqf"

	[] spawn {
		if !((markerType "protection_west") isEqualTo "") then {
			GVAR(SafeZoneMarkers) pushBackUnique [west, "protection_west"];
		};
		if !((markerType "protection_east") isEqualTo "") then {
			GVAR(SafeZoneMarkers) pushBackUnique [east, "protection_east"];
		};
		if !((markerType "protection_resistance") isEqualTo "") then {
			GVAR(SafeZoneMarkers) pushBackUnique [independent, "protection_resistance"];
		};
		private _marker = "";
		{
			if ((([player] call EFUNC(Common,getSide)) isEqualTo (_x select 0)) && ((getPosATL player) inArea (_x select 1))) then {
				_marker = (_x select 1);
			};
		} forEach GVAR(SafeZoneMarkers);

		while {GVAR(SafeMode_Enabled) && !(_marker isEqualTo "")} do {
			_pos = (getPosATL (vehicle player));

			if (_pos inArea _marker) then {
				GVAR(SafeZonePos) = _pos;
			} else {
				if !(isNIl QGVAR(SafeZonePos)) then {
					player setPosATL GVAR(SafeZonePos);
					["You can leave the zone during warmup", 5] call GW_Common_Fnc_Hint;
				};
			};
			sleep 0.1;
		};
		_marker setMarkerAlphaLocal 0;
		GVAR(SafeZoneMarkers) = nil;
		GVAR(SafeZonePos) = nil;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(SafeMode_CountDown), {
	if (hasInterface) then {
		params["_number"];
		TRACE_1("QGVAR(SafeMode_CountDown)", _number);
		if (_number isEqualTo -1) then {
			systemChat "[SafeMode]: Weapons & Vehicles are now active";
		} else {
			if (GVAR(SafeMode_useType)) then {
				systemChat format ["[SafeMode]: Weapons are cold, Time Remaining until mission starts: %1 min", _number];
			} else {
				systemChat format ["[SafeMode]: Weapons are cold, Waiting for admin to start. (%1 minutes since briefing stage started)", _number];
			};
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(SafeMode_RemoveTimer), {
	[GVAR(PFH_SafeMode_Handle)] call CBA_fnc_removePerFrameHandler;
	GVAR(PFH_SafeMode_Handle) = nil;

	[QGVAR(SafeMode_CountDown), [-1]] call CBA_fnc_globalEvent;
	if (GVAR(SafeMode_Enabled)) then {
		[QGVAR(setSafetyMode), false] call CBA_fnc_globalEvent;
	};
	if (isServer && !GVAR(SafeMode_Enabled)) then {
		[{
			// Game Timer
			GVAR(Timer) = (GVAR(Timer) + 1);
			[QGVAR(MissionTime), ((GVAR(event) * 60) * GVAR(Timer))] call CBA_fnc_serverEvent;
		}, (60 * GVAR(event)), []] call CBA_fnc_addPerFrameHandler;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(setSafetyMode), {
	if (isServer) then {
		GVAR(SafeMode_Enabled) = _this;
		publicVariable QGVAR(SafeMode_Enabled);
		if (!_this && !(isNil QGVAR(PFH_SafeMode_Handle))) then {
			[QGVAR(SafeMode_RemoveTimer), true] call CBA_fnc_globalEvent;
		};
	};
	if (hasInterface) then {
		TRACE_1("QGVAR(setSafetyMode)", _this);
		_this call FUNC(WeaponLock);
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(CiviKillEvent), {
	params ["_count","_killer"];
	systemChat format ["Civilian Killed by %1, Be Careful %2 Civi(s) has been killed in this mission", (name _killer), _count];
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
	[QEGVAR(gameLoop,MissionTime), {
		systemChat format ["MissionTime: %1", _this];
	}] call CBA_fnc_addEventHandler;
#endif
