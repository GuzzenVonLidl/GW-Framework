private ["_Unit", "_CurrentBackPack", "_class", "_parents", "_IsUAV","_VCOMAI_HASSTATIC","_VCOMAI_HASUAV","_StaticClassName"];
_Unit = _this;

_CurrentBackPack = backpack _Unit;

if (isNil "_CurrentBackPack") exitWith {};
_class = [_CurrentBackPack] call VCOMAI_Classvehicle;

_VCOMAI_HASUAV = false;
_VCOMAI_HASSTATIC = false;
_StaticClassName = "";

if (isNil "_class") exitWith {_ReturnVariable = [_VCOMAI_HASSTATIC,_VCOMAI_HASUAV,_StaticClassName];_ReturnVariable};

_parents = [_class,true] call BIS_fnc_returnParents;
if (("StaticWeapon" in _parents) || {("Weapon_Bag_Base" in _parents)}) then
{
	_VCOMAI_HASSTATIC = true;
	_Unit setVariable ["VCOMAI_StaticClassName",_CurrentBackPack,false];
	_StaticClassName = _CurrentBackPack;
	_IsUAV = ["UAV",_CurrentBackPack,false] call BIS_fnc_inString;
	if (_IsUAV) then {_VCOMAI_HASUAV = true;};
}
else
{
	_VCOMAI_HASSTATIC = false;
};


_ReturnVariable = [_VCOMAI_HASSTATIC,_VCOMAI_HASUAV,_StaticClassName];

_ReturnVariable