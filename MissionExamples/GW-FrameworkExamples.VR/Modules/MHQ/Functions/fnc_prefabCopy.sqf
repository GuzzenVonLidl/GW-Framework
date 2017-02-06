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

private _mhq = objNull;
private _allObjects = [];
private _CopyObjects = [];
_allObjects = [];

{
	if (_x isKindOf "AllVehicles") then {
		if !(_x isKindOf "CAManBase") then {
			_mhq = _x;
		};
	} else {
		_allObjects pushBack _x;
	};
} forEach (get3DENSelected "object");

private _copyFrom = create3DENEntity ["Object","Land_Compass_F", [(getPosATL _mhq) select 0,(getPosATL _mhq) select 1,0]];

{
	if (!(_x isKindOf "AllVehicles") || !(_x isKindOf "CAManBase")) then {
		_CopyObjects pushBack [(typeOf _x), round(getDir _x), (_copyFrom worldToModel (getPosATL _x))];
	};
} forEach _allObjects;

delete3DENEntities [_copyFrom];
copyToClipboard (format ["[_mhq,%1] call %2;", str(_CopyObjects), QFUNC(prefabCreate)]);
