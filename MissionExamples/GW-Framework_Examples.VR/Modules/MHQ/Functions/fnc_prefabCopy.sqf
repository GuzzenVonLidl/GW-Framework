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
#include "script_Component.hpp"

if (isNull player) exitWith { ["No player unit found!","Warning!"] call BIS_fnc_3DENShowMessage; };

private _CopyObjects = [];

{
	if !(_x isKindOf "CAManBase") then {
		_pos = player worldToModel (position _x);
		_CopyObjects pushBack [(typeOf _x), round(getDir _x), _pos];
	};
} forEach get3DENSelected "object";

systemChat format ["%1 Objects Copied", (count _CopyObjects)];

copyToClipboard (("_return = ") + str(_CopyObjects) + (";"));
