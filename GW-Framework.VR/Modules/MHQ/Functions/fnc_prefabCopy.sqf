/*
	Author: GuzzenVonLidl
	Copies all selected objects in 3den editor to setup a prefab for a mhq
	NOTE: First object will only be used as center and will not be copied

	Usage:
	[] call GW_MHQ_Fnc_prefabCopy;

	Arguments: NO

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

private ["_CopyObjects","_copyFrom","_mhq"];
_mhq = ((get3DENSelected "object") select 0);
_copyFrom = create3DENEntity ["Object","Land_Compass_F", [(getPosATL _mhq) select 0,(getPosATL _mhq) select 1,0]];
_CopyObjects = [];
{
	if ((_x isEqualTo ((get3DENSelected "object") select 0)) || !(_x isKindOf "CAManBase")) then {
		_CopyObjects pushBack [(typeOf _x), (getDir _x), (_copyFrom worldToModel (getPosATL _x))];
	};
} forEach (get3DENSelected "object");
copyToClipboard (format ["[_mhq,%1] call %2;", str(_CopyObjects), QFUNC(prefabCreate)]);
delete3DENEntities [_copyFrom];
