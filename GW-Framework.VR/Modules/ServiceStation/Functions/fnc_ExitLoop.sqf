#include "..\scriptComponent.hpp"

params ["_veh","_SS"];

// Remove Actions when leaving station.
_This spawn {
    Params ["_Veh","_SS","_Radius"];

    WaitUntil {Sleep 0.5; ( ((_Veh Distance _SS) > _Radius) or !(_SS in GVAR(Stations)) or !(Alive _Veh))};

    _Veh setVariable ["NEKY_ServiceStation_InStation",false,true];
    GVAR(Array) deleteAt (GVAR(Array) find _Veh);
    if (_SS in GVAR(Active)) then {[_SS,false] call FUNC(Available)};
    PublicVariable QGVAR(Array);
};
