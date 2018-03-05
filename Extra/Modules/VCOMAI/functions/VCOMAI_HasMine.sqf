private ["_Unit", "_magazinesAmmo", "_Magazine", "_value", "_SubtractAmount", "_DemoCharge", "_SatchelCharge", "_Bomb", "_IsWired", "_IsRemote", "_IsClaymore", "_MineName","_VCOMAI_HASSATCHEL"];

_Unit = _this;
_VCOMAI_HasMine = false;

_magazinesAmmo = magazinesAmmo _Unit;

//Set all values to false!
_VCOMAI_HASSATCHEL = false;

{
	_Magazine = _x select 0;
	_value = (configfile >> "CfgMagazines" >> _Magazine >> "nameSound") call BIS_fnc_getCfgData;
	if (_value isEqualTo "satchelcharge") then
	{

		_SubtractAmount = 0;
		_DemoCharge = ["DemoCharge",_Magazine,false] call BIS_fnc_inString;
		_SatchelCharge = ["SatchelCharge",_Magazine,false] call BIS_fnc_inString;

		if (_DemoCharge || {_SatchelCharge}) then
		{
			_Bomb = "Democharge_F";
			if (_SatchelCharge) then {_Bomb = "SatchelCharge_F"};
			_Unit setVariable ["VCOMAI_SATCHELBOMB",_Bomb,false];
			_Unit setVariable ["VCOMAI_SatchelObjectMagazine",_Magazine,false];
			_VCOMAI_HASSATCHEL = true;
		};

	};
	if (_value isEqualTo "mine") then
	{
		_SubtractAmount = 0;
		_IsWired = ["wire",_Magazine,false] call BIS_fnc_inString;
		_IsRemote = ["remote",_Magazine,false] call BIS_fnc_inString;
		_IsClaymore = ["Claymore",_Magazine,false] call BIS_fnc_inString;
		if (_IsWired) then {_SubtractAmount = -9} else {_SubtractAmount = -10};
		if (_IsRemote) then {_SubtractAmount = -11};
		_MineName = [_Magazine,0,_SubtractAmount] call BIS_fnc_trimString;
		if (_IsClaymore) then {_MineName = "Claymore_F"};
		_VCOMAI_MineObject = _MineName;
		_VCOMAI_MineObjectMagazine = _Magazine;
		_VCOMAI_HasMine = true;
	};
} forEach _magazinesAmmo;

_PushArray = [_VCOMAI_HASSATCHEL,_VCOMAI_MineObject,_VCOMAI_MineObjectMagazine,_VCOMAI_HasMine];


_PushArray
