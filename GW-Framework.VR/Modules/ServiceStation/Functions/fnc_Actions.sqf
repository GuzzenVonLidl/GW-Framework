#include "..\scriptComponent.hpp"

params ["_veh","_SS"];

_veh addAction ["<t color='#FF8000'>NeKy's Service Station</t>", {}, [], 10, false, false, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
_veh addaction ["<t color='#F7FE2E'>Repair</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Repair);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_Veh,_SS,false], 10, false, true, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
_veh addaction ["<t color='#F7FE2E'>Refuel</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Refuel);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_Veh,_SS,false], 10, false, true, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
_veh addaction ["<t color='#F7FE2E'>Rearm</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(Rearm);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_Veh,_SS,false], 10, false, true, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
_veh addaction ["<t color='#F7FE2E'>Full Service</t>", {
	if ((_This select 3 select 1) in GVAR(Active)) then {
		call FUNC(Busy)
	} else {
		(_This select 3) spawn FUNC(FullService);
		[_This select 3 select 1] Spawn FUNC(Lights);
	}
}, [_Veh,_SS,false], 10, false, true, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
_veh addAction ["<t color='#FF8000'>NeKy's Service Station</t>", {}, [], 10, false, false, "", "_Target getVariable ['NEKY_ServiceStation_InStation',false]"];
