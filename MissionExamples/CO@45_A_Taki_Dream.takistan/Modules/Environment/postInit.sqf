#include "scriptComponent.hpp"

if (isMultiplayer && !isServer) exitWith {false};

[QGVARMAIN(missionStarted), {

	if !((DOUBLES(ADDON,Daytime) call BIS_fnc_getParamValue) isEqualTo 0) then {
		private ["_date"];
		_date = date;
		_date set [3,(DOUBLES(ADDON,Daytime) call BIS_fnc_getParamValue) - 1];
		setdate _date;
		LOG(FORMAT_1("Time of day set to: %1, from params", _date select 3));
	};

	if ((DOUBLES(ADDON,fullMoon) call BIS_fnc_getParamValue) isEqualTo 1) then {
		private ["_date","_newDate","_fullMoons"];
		_date = date;
		_fullMoons = [(_date select 0)] call FUNC(fullMoonDates);
		_newDate = (selectRandom _fullMoons);
		_newDate set [3, _date select 3];
		_newDate set [4, _date select 4];
		setdate _newDate;
		LOG(FORMAT_1("Full moon enabled from params, Date: %1", _newDate));
	};

	if !((DOUBLES(ADDON,Fog) call BIS_fnc_getParamValue) isEqualTo 0) then {
		private ["_fogLevel"];
		switch (DOUBLES(ADDON,Fog) call BIS_fnc_getParamValue) do {
			case 1: {
				_fogLevel = 0.0;
			};
			case 2: {
				_fogLevel = 0.2;
			};
			case 3: {
				_fogLevel = 0.4;
			};
			case 4: {
				_fogLevel = 0.6;
			};
		};
		0 setfog _fogLevel;
		LOG(FORMAT_1("Fog set to %1, from params", _fogLevel));
	};

	if !((DOUBLES(ADDON,Weather) call BIS_fnc_getParamValue) isEqualTo 0) then {
		private ["_weatherEffect"];
		switch ((DOUBLES(ADDON,Weather) call BIS_fnc_getParamValue)) do {
			case 1: {	// Clear (Light Winds)
				_weatherEffect = [0.01,0,0,0.25,0.5,0.25];
			};
			case 2: {	// Clear (Strong Winds)
				_weatherEffect = [0.01,0,0,0.75,1,0.75];
			};
			case 3: {	// Overcast (Calm)
				_weatherEffect = [0.55,0,0,0,0,0.1];
			};
			case 4: {	// Overcast (Light Winds)
				_weatherEffect = [0.55,0,0,0.25,0.5,0.25];
			};
			case 5: {	// Overcast (Strong Winds)
				_weatherEffect = [0.55,0,0,0.75,1,0.75];
			};
			case 6: {	// Rain (Light Winds)
				_weatherEffect = [1,1,0,0.25,0.5,0.75];
			};
			case 7: {	// Rain (Strong Winds)
				_weatherEffect = [1,1,0,0.75,1,0.75];
			};
			case 8: {	// Storm
				_weatherEffect = [1,1,1,1,1,1];
			};
		};
		0 setOvercast  (_weatherEffect select 0);
		0 setRain (_weatherEffect select 1);
		0 setWindStr  (_weatherEffect select 2);
		0 setWindForce (_weatherEffect select 3);
		0 setWaves (_weatherEffect select 4);
		0 setLightnings (_weatherEffect select 5);
		forceWeatherChange;
	};

	if (GVAR(AdvLightning)) then {
		[{
			[700] call FUNC(LightningLoop);
		}, [], 5] call CBA_fnc_waitAndExecute;
		LOG("Activating Advanced Lightning");
	};
}] call CBA_fnc_addEventHandler;
