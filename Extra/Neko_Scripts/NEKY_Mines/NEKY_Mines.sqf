//	[this, "type", "Mine Classname", [sensitivity footsoldier, sensitivity vehicle]] execVM "Scripts\NEKY_Mines\NEKY_Mines.sqf";
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
//	1. Object name, the name of the object.
//		a. Can be the actual name of the mine. Generally used when making IED's later than the start of the mission.
// 		b. This, when entered in the init line of an object, turns the object into a mine from the start.
//	2. "Type", what size of an explosion this mine will create. These can all be defined in the Settings.sqf
//		a. "Small", a small explosion, by default.
//		b. "Medium", a medium explosion, by default.
//		c. "Large", a large explosion, by default.
//		d. "Grenade", an RGO will spawn and will make its "throw" sound effect, then after a delay it will explode simulating tripping a string that pulls the pin.
//		e. "MiniGrenade", an RGN will spawn and will make its "throw" sound effect, then after a delay it will explode simulating tripping a string that pulls the pin.
//		f. "Random", randomly select any of the types in the _RandomMines array in Settings.sqf.
//	3. OPTIONAL: "Mine Classname", the class name of the visual object the mine will have. This will override the values from Settings.sqf. _MineClass.
//	4. OPTIONAL: [Sensitivity Footsoldiers, Sensitivity Vehicle], How sensitive the mine will be to movement around it. This will override the values from Settings.sqf. _Sensitivity(M/V).
//		a. Sensitivity Foodsoldiers, the sensitivity for footsoldiers (in meters).
//		b. Sensitivity Vehicle, the sensitivity for vehicles (in meters).
//	
//////////////
//	How To
//////////////
//	
//	1. Place an object on the map. DO NOT USE AN OBJECT FROM THE "MINES" CATEGORY! I recommend Empty --> Object (Helpers) --> Arrow (red). 
//	2. Enter desired code into the init line of the object.
//	3. Step on it.
//	
//////////////
//	EXAMPLES:
//////////////
//	null = [this, "small"] execVM "Scripts\NEKY_Mines\NEKY_Mines.sqf";
//	null = [this, "grenade", "IEDLandSmall_F"] execVM "Scripts\NEKY_Mines\NEKY_Mines.sqf";
//	null = [this, "large", "IEDLandSmall_F", [5, 10]] execVM "Scripts\NEKY_Mines\NEKY_Mines.sqf";
//	null = [mine1, "Random", "", [2,20]] execVM "Scripts\NEKY_Mines\NEKY_Mines.sqf";
////////////////////////
//	Made by NeKo-ArroW	
////////////////////////

Private ["_TempArray","_SafeStances","_Index","_MineHealth","_RandomMines","_MineClass","_Object","_Type","_SensitivityM","_SensitivityV","_Sensitivity","_Position","_Small","_Medium","_Large","_MiniGrenade","_Grenade","_TypeGrenade","_FrequencyC","_FrequencyF"];

if !(IsServer) exitWith {False};
#include "NEKY_Settings.sqf"

_Object = [_This, 0, ObjNull, [ObjNull]] call BIS_FNC_Param;
_Type = toLower ([_This, 1, "small", [""]] call BIS_FNC_Param);
_MineClass = [_This, 2, _MineClass, [[""], ""]] call BIS_FNC_Param;
_Sensitivity = [_This, 3, [(_SensitivityM call BIS_FNC_SelectRandom), (_SensitivityV call BIS_FNC_SelectRandom)], [[]]] call BIS_FNC_Param;

// Define Mine type
if (TypeName _MineClass == "ARRAY") then {_MineClass = _MineClass call BIS_FNC_SelectRandom};
if (_Type == "random") then {_Type = toLower (_RandomMines call BIS_FNC_SelectRandom)};
_TypeGrenade = False;

Switch (_Type) do
{
	Private ["_Type", "_TypeGrenade"];
	case "small": {_Type = _Small};
	case "medium": {_Type = _Medium};
	case "large": {_Type = _Large};
	case "minigrenade": {_Type = _MiniGrenade; _TypeGrenade = True};
	case "grenade": {_Type = _Grenade; _TypeGrenade = True};
	default {SystemChat "Wrong param for Type"};
};

// Create Mine
_Position = getPos _Object;
DeleteVehicle _Object;
_Object = CreateMine [_MineClass, _Position, [], 0];
_Object setVectorUp surfaceNormal _Position;

// Detonation
NEKY_MineTriggered =
{
	#include "NEKY_Settings.sqf"

	_Type = _This select 0;
	_Object = _This select 1;
	_TypeGrenade = _This select 2;
	_Position = GetPosATL _Object;
	_Damage = GetDammage _Object;
	
	if (GetDammage _Object > _MineHealth) exitWith // If destroyed
	{
		_Temp = CreateVehicle [_SelfDestruct, [0,0,100000], [], 0, "CAN_COLLIDE"];
		_Temp disableCollisionWith _Object;
		_Temp setVelocity [0,0,-1000];
		sleep 0.1;
		_Temp setPosATL _Position;
		DeleteVehicle _Object;
	};
	
	if (_Type isKindOf "MineBase") then // If a mine
	{
		_Temp = CreateMine [_Type, _Position, [], 0];
		_Temp setDamage 1;
	} else {
		if (_TypeGrenade) then // If a grenade
		{
			_Temp = CreateVehicle [_Type, _Position, [], 0, "CAN_COLLIDE"];
			_Temp disableCollisionWith _Object;
			_Temp = 0;	
			
			While {(_Temp <= 4)} do
			{
				_Temp = _Temp +1;
				sleep 0.96;
			};
		} else { // If a projectile
			_Temp = CreateVehicle [_Type, [0,0,100000], [], 0, "CAN_COLLIDE"];
			_Temp disableCollisionWith _Object;
			_Temp setVelocity [0,0,-1000];
			sleep 0.1;
			_Temp setPosATL _Position;
		};
	};
	DeleteVehicle _Object;
};

// Allowed stances
_Index = 0;
_TempArray = [];
For "_i" from 1 to (count _SafeStances) do
{
	_Temp = toUpper (_SafeStances select _Index);
	_TempArray PushBack _Temp;
	_Index = _Index +1;
};
_SafeStances = _TempArray;

// Scanner
While {(Alive _Object)} do
{
	if ( ((getDammage _Object) > _MineHealth) or ({!((Stance _x) in _SafeStances) && (_Object distance _x) < (_Sensitivity select 0) && ((((getPosATL _x) select 2) > (((getPosATL _Object) select 2) -1.5)) && (((getPosATL _x) select 2) < (((getPosATL _Object) select 2) +1.5)))} Count AllPlayers > 0) or ({(_Object distance _x) < (_Sensitivity select 1) && ((Vehicle _x) in Vehicles)} count AllPlayers > 0) ) exitWith {[_Type,_Object,_TypeGrenade] Spawn NEKY_MineTriggered; False};
	if ({(_Object distance _x) < 300} Count AllPlayers > 0) then {sleep _FrequencyC} else {sleep _FrequencyF};
};

SystemChat "Mine Defused or Detonated";