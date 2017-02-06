#include "scriptComponent.hpp"
#define	GETSIDE(VAR_1) (getNumber(configfile >> "CfgVehicles" >> (typeOf VAR_1) >> "side"))

[QGVARMAIN(missionStarted), {
	if (isServer) then {
		addMissionEventHandler ["EntityKilled",{
			params ["_target","_killer"];
			_teamKill = (GETSIDE(_killer) isEqualTo GETSIDE(_target));

			if (isPlayer _target) then {
				private _getStats = (_killer getVariable [QGVAR(Deaths), 0]);
				_target setVariable [QGVAR(Deaths), (_getStats + 1), true];
				[_target] call Gw_Fnc_getStats;
			};
			if (isPlayer _killer) then {
				_killer addScore -(score _killer);
				_killer addRating 100-(rating _killer);

				if (_teamKill) then {
					private _getStats = (_killer getVariable [QGVAR(teamKills), [0,[]]]);
					_killer setVariable [QGVAR(teamKills), [((_getStats select 0) + 1), (_getStats select 1) + [(name _target)]],true];
				} else {
					private _getStats = (_killer getVariable [QGVAR(Kills), 0]);
					_killer setVariable [QGVAR(Kills), (_getStats + 1), true];
				};
			};
		}];
	};

	if (hasInterface) then {
		[{
			player setVariable [QGVAR(Deaths), 0, true];
			player setVariable [QGVAR(Kills), 0, true];
			player setVariable [QGVAR(teamKills), [0,[]], true];
		}, []] call CBA_fnc_execNextFrame;
		if (GVARMAIN(isActiveAdmin)) then {
			addMissionEventHandler ["Ended",{
				[] call Gw_Tracker_Fnc_extract;
			}];
		};
	};
}] call CBA_fnc_addEventHandler;
