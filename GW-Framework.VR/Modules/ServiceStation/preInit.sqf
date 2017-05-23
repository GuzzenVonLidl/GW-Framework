#include "scriptComponent.hpp"

PREP(Actions);
PREP(ExitLoop);
PREP(FullService);
PREP(Init);
PREP(InitMobile);
PREP(Lights);
PREP(Rearm);
PREP(Refuel);
PREP(Repair);

FUNC(Busy) = { Hint "Service Station is busy, please wait for current service to be finished." };
FUNC(Available) = {
	params ["_station","_disable"];
	GVAR(Active) DeleteAt (GVAR(Active) find _station);
	PublicVariable QGVAR(Active);
	if (_disable) then {
		Hint "You have left the Service station, service ending."
	};
};
FUNC(Hints) = {
	params ["_text","_veh"];
	if (((Player distance _veh) <= 15) or (driver _veh isEqualTo player)) then {
		Hint _text;
	};
	if !((driver _veh) isEqualTo ObjNull) then {
		[[_text], {
			params ["_text"];
			hint _text;
		}] remoteExec ["BIS_FNC_SPAWN",_veh];
	};
};

GVAR(Active) = [];
GVAR(Actions) = [];
GVAR(Array) = [];
GVAR(Stations) = [];
