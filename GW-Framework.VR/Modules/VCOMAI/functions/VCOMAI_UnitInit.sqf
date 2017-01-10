_Unit = _this select 0;

_Player = false;
if (isPlayer _Unit) then {_Player = true;};

//Determine if this AI should even execute new code
_UseAI = _Unit getVariable "NOAI";
if (isNil ("_UseAI")) then
{
	_UseAI = false;
};
_Passarray = [_UseAI,_Player];
_Passarray
