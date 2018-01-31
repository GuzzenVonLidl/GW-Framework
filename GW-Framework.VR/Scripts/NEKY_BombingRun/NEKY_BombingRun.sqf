// [side,"spawn marker" or XYZ,"Target marker" or XYZ,"exit marker" or XYZ,Smoke/Flare On/Off(True/False),"BombType",amount of bombs,damage (True/False),number of planes] execVM "Scripts\NEKY_BombingRun\NEKY_BombingRun.sqf"	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	1. Side, the side of the plane and pilot.
//		a. Can be WEST/BLUFOR, EAST/OPFOR or INDEPENDENT.
//	2. "Spawn Marker" or [X,Y,Z], Where the plane will spawn.
//		a. Can be a marker or coordinates.
//	3. "Target Marker" or [X,Y,Z], The target position the plane will drop the bombs upon.
//		a. Can be a marker or coordinates.
//	4. "Exit Marker" or [X,Y,Z], Where the plane will despawn.
//		a. Can be a marker or coordinates.
//	5. Smoke/Flare, If the target position should be marked prior to plane reaching the target.
//		a. True = Will use a smoke if daytime or flare if daytime.
//		b. False = Will not mark the area.
//	6. "Bomb Type", the size of the explosion when triggered. 
//		a. "bomb" will drop bombs in a straight line.
//		b. "clusterbomb" will drop bombs rapidly and very spread out (up to 100m wide).
//	7. Amount of Bombs, How many bombs you want the plane to drop.
//		a. Number.
//	8. Damage, Whether the plane should be able to take damage or not.
//		a. True = Vulnerable.
//		b. False = Invulnerable.
//	9. Number of Planes, How many planes should come in and drop bombs on the same target (in a line, 1.5sec delay).
//		a. Number.
//
/////////////
//	Examples
/////////////
//	
//	Null = [West,"mrkSpawn","mrkTarget","MrkDespawn",True,"bomb",4,true,1] execVM "Scripts\NEKY_BombingRun\NEKY_BombingRun.sqf"	
//	Null = [West,[12314,43569,0],[15521,05352,0],[59532,43290,0],True,"clusterbomb",30,true,1] execVM "Scripts\NEKY_BombingRun\NEKY_BombingRun.sqf"	
//	Null = [OPFOR,"Ingress","BoomHere","Egress",false,"clusterbomb",100,false,1] execVM "Scripts\NEKY_BombingRun\NEKY_BombingRun.sqf"	
//	Null = [independent,"spawnHere",[12415,40234,0],"PopVanish",True,"bomb",6,true,2] execVM "Scripts\NEKY_BombingRun\NEKY_BombingRun.sqf"	
//	
////////////////////////
//	Made by NeKo-ArroW with help from GuzzenVonLidl
////////////////////////////////////////////////////

if !(isServer) exitwith {};

NEKY_BombingRun_Fire = 
{
	Private ["_Position"];	
	_Bomb = (_This select 0);
	_FireDamage = (_This select 1);
	
	While {Alive _Bomb} do {_Temp = getPosATL _Bomb; if (((typeName _Temp) isEqualTo "ARRAY") && !(_Temp isEqualTo [0,0,0])) then {_Position = _Temp}};
	if (_Position isEqualTo [0,0,0]) exitWith {False};
	
	// Prepare random fire positions
	_FirePositions = [];
	_FireSleeps = [];
	for "_i" from 1 to 8 do 
	{
		_FirePositions pushBack ([_Position, (random 30), (random 360)] call BIS_fnc_relPos);
		_FireSleeps pushBack (180 + (random 20));
	};
	
	// Execute code
	[[_FirePositions,_FireSleeps,_FireDamage,_Position],
	{
		_FirePositions = _This select 0;
		_FireSleeps = _This select 1;
		_FireDamage = _This select 2;
		_Position = _This select 3;
		
		// Create Fires
		_Color = [1, 1, 1];
		_Wind = wind;
		_Fires = [];
		_Fires2 = [];
		_Lights = [];
		_Smokes = [];	
		_Index = 0;
		for "_i" from 1 to (Count _FirePositions) do
		{
			_Position = (_FirePositions select _Index);
			
			// Create Fire
			_Temp = createVehicle ['#particlesource', _Position, [], 0, 'CAN_COLLIDE'];
			_Temp setParticleParams [['a3\data_f\ParticleEffects\Universal\Universal.p3d', 16, 1, 12, 0], '', 'Billboard', 1, 2 + random 3, [0, 0, 5], _Wind, 1, 1.1, 1, 0, [.3 + (random 1)], [_color + [0], _color + [0.31], _color + [0]], [1000], 1, 0, '', '', 1];
			_Temp setParticleRandom [3, [5 + (random 1), 4 + (random 1), 7], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
			_Temp setParticleCircle [1, [0.5, 0.5, 0]];
			_Temp setDropInterval 0.022;
			_Temp setParticleFire _FireDamage;
			_Fires pushBack _Temp;
			
			// Create Light
			_Light = "#lightpoint" createVehicle _Position;
			_Light setLightBrightness 4.0;
			_Light setLightAmbient [0.07, 0.02, 0.0];
			_Light setLightColor [0.05, 0.008, 0.0];
			_Light lightAttachObject [_Temp,[0,0,6]];
			_Lights pushBack _Light;
			
			// Create some more fire I suppose
			_Temp = createVehicle ["#particlesource", (getPosATL _Temp), [], 0, "CAN_COLLIDE"];
			_Temp setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 1 + random 1, [5, 5, 4], _Wind, 1, 1.1, 1, 0, [.5 + (random .5)], [_color + [0], _color + [0.35], _color + [0]], [1000], 1, 0, "", "", 1];
			_Temp setParticleRandom [3, [1 + (random 1), 4 + (random 1), 9], [random 5, random 2, 1], 14, 3, [0, 0, 0, .1], 1, 0];
			_Temp setParticleCircle [1, [0.5, 0.5, 0]];
			_Temp setDropInterval 0.006;
			_Fires2 pushBack _Temp;
			_Index = _Index +1;
		};
		
		// Sound Effect
		if (isServer) then
		{
			_Sound = [["fire1_loop",8.361],["fire2_loop",12.45],["fire3_loop",6,917]] call BIS_FNC_SelectRandom;
			[_Fires,_Sound,_Position] spawn { While { ({Alive _x} count (_This select 0)) > 0} do {PlaySound3D [(format ["A3\Sounds_f\sfx\%1.wss", ((_This select 1) select 0)]), ObjNull, false, (_This select 2),2.5]; Sleep ((_This select 1) select 1)} };
		};
		
		//	PLAYER VISUAL EFFECT 
		[_Fires,_Position] spawn
		{
			_Fires = _This select 0;
			_Position = _This select 1;
			While { {Alive _x} count _Fires > 0 } do
			{
				_Distance = (Player distance _Position);
				if (_Distance <= 80) then
				{
					_EffectPower = (0.3 / (_Distance / 100));
					_Color = ppEffectCreate ["ColorCorrections", 1234];
					_Color ppEffectEnable true;
					_Color ppEffectAdjust [0.25, 1, 0, [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]];
					_Color ppEffectCommit 1;
					sleep _EffectPower;
					_Color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299, 0.587, 0.114, 0]]; // Default visual
					_Color ppEffectCommit 1;
					sleep 1;
					ppEffectDestroy _Color;
				};
				sleep 0.5;
			};
		};
		
		// Deletion of Fires and Lights
		_Index = 0;
		{
			if (_Index >= (count _Lights)) then
			{
				[(_Fires select _Index),(_FireSleeps select _Index),(_Fires2 select _Index)] spawn {Sleep (_This select 1); deleteVehicle (_This select 0); deleteVehicle (_This select 2)};
			} else {
				[(_Fires select _Index),(_FireSleeps select _Index),(_Fires2 select _Index),(_Lights select _Index)] spawn {Sleep (_This select 1); deleteVehicle (_This select 0); deleteVehicle (_This select 2); deleteVehicle (_This select 3)};
			};
			_Index = _Index +1;
		} forEach _Fires;
	}] RemoteExec ["BIS_FNC_SPAWN",0];
	
	// Create smoke
	_Smokes = [];
	_TempFires = [];
	{_TempFires pushBack _x} forEach _FirePositions;
	for "_i" from 1 to 4 do
	{
		_TempFire = _TempFires call BIS_FNC_SelectRandom;
		_TempFires deleteAt (_TempFires find _TempFire);
		_Temp = createVehicle ["#particlesource", _TempFire, [], 0, "CAN_COLLIDE"];
		_Temp setParticleClass "BigDestructionSmoke";
		_Smokes PushBack _Temp;
	};
	
	// Delete Smokes
	_Index = 0;
	{
		[(_Smokes select _Index)] spawn {sleep (210 + (random 20)); deleteVehicle (_This select 0)};
		_Index = _Index +1;
	} forEach _Smokes;	
};

_PlaneNumber = [_this, 8, 1,[0]] call BIS_fnc_Param;
_Smoker = True;

for "_i" from 1 to (_PlaneNumber) do
{
	[(_This select 0), (_This select 1), (_This select 2), (_This select 3), (_This select 4), (_This select 5), (_This select 6), (_This select 7), _Smoker] spawn 
	{
		_Side = [_this, 0, West, [sideUnknown]] call BIS_fnc_Param;
		_Spawn = [_this, 1, "", [[],""]] call BIS_fnc_Param;
		_Target = [_this, 2, "", [[],""]] call BIS_fnc_Param;
		_Exit = [_this, 3, "", [[],""]] call BIS_fnc_Param;
		_Smoke = [_this, 4, true, [true]] call BIS_fnc_Param;
		_BombType = toLower ([_this, 5, "bomb", [""]] call BIS_FNC_Param);
		_BombCount = [_this, 6, 3, [0]] call BIS_fnc_Param;
		_Damage = [_this, 7, true, [true]] call BIS_fnc_Param;
		_Smoker = (_This select 8);
		_Range = 650;
		
		#include "NEKY_Settings.sqf"
		
		// Convert possible markers to XYZ
		if (typeName _Spawn == "STRING") then {_Spawn = GetMarkerPos _Spawn};
		if (typeName _Target == "STRING") then {_Target = GetMarkerPos _Target};
		if (typeName _Exit == "STRING") then {_Exit = GetMarkerPos _Exit};
	
		// Create Vehicle
		_Vehicle = createVehicle [_Plane, [(_Spawn select 0), (_Spawn select 1), 500], [], 0, "FLY"];
		_Dir = [_Vehicle, _Target] call BIS_fnc_DirTo;
		_Vehicle allowdamage _Damage;
		_Speed = velocity _Vehicle;
		_Vehicle setDir _Dir;
		_Vehicle setVelocity 
		[
			((_speed select 1) * sin _dir) - ((_speed select 0) * cos _dir),
			((_speed select 0) * sin _dir) + ((_speed select 1) * cos _dir),
			_speed select 2
		];
		
		// Create pilot
		_newGroup = Creategroup _Side;
		_Unit = _NewGroup createUnit [_Pilot, getMarkerPos "vspawn1", [], 0, "NONE"];
		_Unit setRank "SERGEANT";
		_Unit assignAsDriver _vehicle;
		[_Unit] orderGetIn true;
		_Unit MoveInDriver _vehicle;
		_Unit allowdamage _damage;
		_Unit DisableAI "TARGET";
		_Unit disableAI "AUTOTARGET";
		_Unit disableAI "AUTOCOMBAT";
		_Unit DisableAI "SUPPRESSION";
		_Unit DisableAI "FSM";
		_Unit DisableAI "COVER";
		removebackpack _unit;
		
		// Correct the planes flight path
		[_Vehicle,_Target,_Range,_Speed,_Unit] spawn
		{
			Private ["_Dir","_Vehicle","_Speed","_Range"];
			
			_Vehicle = _this select 0;
			_Target = _This select 1;
			_Range = _This select 2;
			_Speed = _this select 3;
			_Unit = _This select 4;
			
			WaitUntil {sleep 1; (!(Alive _Vehicle or Alive _Unit) or (_Vehicle distance _Target) <= (_Range*4))};
			if !(Alive _Vehicle) exitWith {systemchat "Exited prior to direction correction"};
			_Dir = [_Vehicle, _Target] call BIS_fnc_DirTo;
			_Vehicle setDir _Dir;
			_Vehicle setVelocity 
			[
				((_speed select 1) * sin _dir) - ((_speed select 0) * cos _dir),
				((_speed select 0) * sin _dir) + ((_speed select 1) * cos _dir),
				_speed select 2
			];
		};
		
		// Altitude correction
		_Direction = ([_Spawn, _Target] call BIS_fnc_dirTo);
		_Position = [_Target, _Range, (_Direction + 180)] call BIS_fnc_relPos;
		_AltitudeCorrection = (((ATLtoASL _Target) select 2) - ((ATLtoASL _Position) select 2));
		_Vehicle FlyInHeight (400 + (_AltitudeCorrection));
		_Vehicle setCollisionLight False;
		_Vehicle setPilotLight false;
		
		// Waypoint 1
		SystemChat "Bomber: Airstrike inbound.";
		_newGroup setCombatMode "BLUE";
		_newGroup setBehaviour "CARELESS";
		_newGroup addwaypoint [_Target, 0, 1];
		[_newGroup, 1] setWaypointSpeed "FULL"; 
		[_newGroup, 1] setWaypointType "MOVE";
		[_newGroup, 1] setWaypointBehaviour "CARELESS";
		[_newGroup, 1] setWaypointCombatMode "BLUE";
		[_newGroup, 1] setWaypointCompletionRadius 0;
		_Vehicle LimitSpeed 550;

		// Marking target area
		if (_Smoke && _Smoker) then
		{
			[_Vehicle,_Target,_Range,_MarkFlare,_MarkSmoke,_DayTime,_NightTime] Spawn
			{
				_Vehicle = (_This select 0);
				_Target = (_This select 1);
				_Range = (_This select 2);
				_MarkFlare = (_This select 3);
				_MarkSmoke = (_This select 4);
				_DayTime = (_This select 5);
				_NightTime = (_This select 6);
				
				WaitUntil {sleep 1; (!(Alive _Vehicle or Alive (Driver _Vehicle)) or (_Vehicle distance (_Target)) <= (_Range*9))};
				if !(Alive _Vehicle) exitWith {systemchat "Exited Prior to smokes"};
				_Smokes = [];
				
				if ((dayTime > _DayTime) and (dayTime < _NightTime)) then 
				{
					for "_y" from 1 to 3 do
					{
						_SmokeGren = createVehicle [_MarkSmoke, [_Target select 0, _Target select 1, 45], [], 5, "CAN_COLLIDE"];
						_SmokeGren setVelocity [(-5 + random 10), (-5 + random 10), (velocity _smokeGren) select 2];
						_Smokes pushBack _SmokeGren;
						sleep 0.1;
					};
					
					// Remove smokes after drop
					[_Smokes] spawn {sleep 45; {deleteVehicle _x} forEach (_This select 0)};
				} else {
					sleep 5;
					for "_y" from 1 to 3 do
					{
						_Flare = createVehicle [_MarkFlare, [_Target select 0, _Target select 1, 175], [], 5, "CAN_COLLIDE"];
						_Flare setVelocity [(-5 + random 10), (-5 + random 10), (velocity _Flare) select 2];
						[_flare] spawn
						{
							_Flare = _this select 0;
							sleep 2;
							playSound3D ["A3\Sounds_F\weapons\Flare_Gun\flaregun_2_shoot.wss", _Flare, false, [getpos _flare select 0, getpos _flare select 1, 200], 8, 1, 300];
						};
						
						sleep 0.25;
					};
				};
			};
		};
		
		WaitUntil {sleep 0.25; (!(Alive _Vehicle or Alive _Unit) or (_Vehicle distance (_Target)) <= (_Range + 200))};	
		if !(Alive _Vehicle) exitWith {systemchat "Exited prior to bombs";};
		
		// Bomb sequence
		[_BombCount,_Target,_Direction,_AltitudeCorrection,_Bomb,_Vehicle,_Range,_BombType,_FireDamage] spawn 
		{
			_BombCount = (_This select 0);
			_Target = (_This select 1);
			_direction = (_This select 2);
			_AltitudeCorrection = (_This select 3);
			_Bomb = (_This select 4);
			_Vehicle = (_This select 5);
			_Range = (_This select 6);
			_BombType = (_This select 7);
			_FireDamage = (_This select 8);
			_Index = 0;
			
			Switch (_BombType) do
			{
				case "bomb":
				{
					for "_i" from 1 to (_BombCount) do 
					{
						if ((!Alive _Vehicle) or (!Alive (Driver _Vehicle))) exitWith {False};
						_Position = [_Target, (_Range - _Index), (_Direction + 180)] call BIS_fnc_relPos;
						_Temp = createVehicle [_Bomb, [(((_Position select 0) - random 10) + random 10),(((_Position select 1) - random 10) + random 10),(400 + (_AltitudeCorrection))], [], 0, "NONE"];
						_Temp setdir _Direction;
						_Temp setVelocity [sin _direction * 68,cos _direction * 68, -130];
						_Index = _Index + 25;
						sleep 0.25;
					};
				};
				
				case "clusterbomb":
				{
					_Range = _Range - ([350,375,400] call BIS_FNC_SelectRandom);
					for "_i" from 1 to (_BombCount) do 
					{
						if ((!Alive _Vehicle) or (!Alive (Driver _Vehicle))) exitWith {False};
						_Position = [_Target, (_Range - _Index), (_Direction + 180)] call BIS_fnc_relPos;
						_Temp = createVehicle [_Bomb, [(((_Position select 0) - random 100) + random 100),(((_Position select 1) - random 100) + random 100),(400 + (_AltitudeCorrection))], [], 0, "NONE"];
						_Temp setdir _Direction;
						_Temp setVelocity [sin _direction * 68,cos _direction * 68, -130];
						_Index = _Index + 9;
						sleep 0.08;
					};
				};
				
				case "firebomb":
				{
					_Index2 = 1;
					for "_i" from 1 to (_BombCount) do 
					{
						if ((!Alive _Vehicle) or (!Alive (Driver _Vehicle))) exitWith {False};
						_Position = [_Target, (_Range - _Index), (_Direction + 180)] call BIS_fnc_relPos;
						_Temp = createVehicle [_Bomb, [(_Position select 0),((_Position select 1) + (0 + _Index2)),(400 + (_AltitudeCorrection))], [], 0, "NONE"];
						[_Temp,_FireDamage] spawn NEKY_BombingRun_Fire;
						_Temp setdir _Direction;
						_Temp setVelocity [sin _direction * 68,cos _direction * 68, -130];
						_Index = _Index + 50;
						if (_Index2 == 0) then {_Index2 = _Index2 +33} else {_Index2 = 0};
						sleep 2;
					};
				};
			};
			
			if ((Alive _Vehicle) and (Alive (Driver _Vehicle))) then {SystemChat "Bomber: Bombs dropped!"};
		};
		Sleep 6;
		
		// Waypoint 2
		_newGroup addwaypoint [_Exit, 0, 2];
		_NewGroup setCurrentWaypoint [_newGroup, 2];
		[_newGroup, 2] setWaypointSpeed "FULL";
		[_newGroup, 2] setWaypointCompletionRadius 300;
		[_newGroup, 2] setWaypointType "MOVE";
		[_newGroup, 2] setWaypointBehaviour "CARELESS";
		[_newGroup, 2] setWaypointCombatMode "BLUE";
		_Vehicle limitSpeed -1;
		
		// Waypoint 3
		_newGroup addwaypoint [[0,0,400], 2, 3];
		[_newGroup, 3] setWaypointSpeed "FULL";
		[_newGroup, 3] setWaypointType "MOVE";
		[_newGroup, 3] setWaypointBehaviour "CARELESS";
		[_newGroup, 3] setWaypointCombatMode "BLUE";
	
		sleep 10;
	
		if ((Alive _Vehicle) and (Alive _Unit)) then {SystemChat "Bomber: Egressing."};
		WaitUntil {sleep 1; (3 <= (CurrentWaypoint _newGroup)) or ((!Alive _Vehicle) or (!Alive _Unit))};
		if ((Alive _Vehicle) and (Alive _Unit)) then {deleteVehicle _Unit; DeleteVehicle _Vehicle};
		if ((!Alive _Vehicle) or (!Alive _Unit)) then {sleep 300; deleteVehicle _Vehicle; deleteVehicle _Unit};
	};
	sleep 1.5;
	_Smoker = False;
};
