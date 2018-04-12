//Created on ???
// Modified on : 9/7/14 - Added radio check.   9/10/14 - Added PRIVATE commandArtilleryFire

private ["_Unit","_Wall","_Direction","_Killer","_UnitSide","_NoFlanking","_GrabVariable","_CheckStatus","_Array1","_NoFlanking2","_CheckStatus2","_GrabVariable2","_CombatStance","_group","_index","_WaypointIs","_waypoint0"];

_Unit = _this select 0;
_UnitGroup = (group _Unit);
_DeathPosition = getpos _Unit;

if !((side _UnitGroup) in VCOMAI_SideBasedMovement) exitWith {if (VCOMAI_AIDEBUG isEqualTo 1) then {systemChat format ["Exited ClosestAllyWarn1..: %1",_UnitGroup];};};


_Killer = _this select 1;

//If this gets attached to a player, then exit before doing anything
if (isPlayer _Unit) exitWith {if (VCOMAI_AIDEBUG isEqualTo 1) then {systemChat format ["Exited ClosestAllyWarn1a..: %1",_UnitGroup];};};

//Let's pull the units group side
_UnitSide = side _UnitGroup;

//If the unit is in the VCOMAI_ArtilleryArray, then remove it
if (_Unit in VCOMAI_ArtilleryArray) then {VCOMAI_ArtilleryArray = VCOMAI_ArtilleryArray - [_Unit];};

//Check to see if this unit should be moving to support others or not
//Check to see if this unit is garrisoned. If so, don't do anything
//Check to see if unit has radio. If the unit does not have a radio, then it will not move to support
_NoFlanking = _Unit getVariable ["VCOMAI_NOPATHING_Unit",false];
_NoAI = _Unit getVariable ["NOAI",false];
_GrabVariable = _Unit getVariable ["VCOMAI_GARRISONED",false];;
_CheckStatus = assignedItems _Unit;

if (_NoFlanking || {_GrabVariable} || {_NoAI} || {!("ItemRadio" in _CheckStatus)}) exitWith {if (VCOMAI_AIDEBUG isEqualTo 1) then {systemChat format ["Exited ClosestAllyWarn2..: %1",_UnitGroup];};};

_Array1 = _Unit call VCOMAI_FriendlyArray;
_Array1 = _Array1 - VCOMAI_ArtilleryArray;

if (VCOMAI_AIDEBUG isEqualTo 1) then
{
	systemChat format ["Man Down...: %1",_UnitGroup];
};
sleep (30 + (random 30));
if (VCOMAI_AIDEBUG isEqualTo 1) then
{
	systemChat format ["Group is attempting to call for help...: %1",_UnitGroup];
};

_aliveCount = {alive _x} count (units _UnitGroup);

if (_aliveCount > 0) then
{
	if (VCOMAI_AIDEBUG isEqualTo 1) then
	{
		systemChat format ["Group successfully called for help: %1",_UnitGroup];
	};

	{
		_NoFlanking2 = _x getVariable ["VCOMAI_NOPATHING_Unit",false];
		if !(_NoFlanking2) then
		{
			_CheckStatus2 = assignedItems _x;
			if (isNil "_CheckStatus2") exitWith {};
			if ("ItemRadio" in _CheckStatus2) then
				{

					_GrabVariable2 = _x getVariable ["VCOMAI_GARRISONED",false];


					if !(_GrabVariable2) then
					{
						_group	= group _x;
						if ((count (waypoints _group)) < 2) then
						{

							_WaypointCheck = _group call VCOMAI_Waypointcheck;
							if (count _WaypointCheck < 1) then
							{

								if ((_x distance _Unit) <= (_x getVariable ["VCOMAI_Unit_AIWarnDistance",VCOMAI_Unit_AIWarnDistance]) ) then
								{
											_x setbehaviour "AWARE";
											_x setVariable ["VCOMAI_MOVINGTOSUPPORT",true,false];
											if (leader _x isEqualTo _x) then
											{
													_waypoint2 = (group _x) addwaypoint[_DeathPosition,15];
													_waypoint2 setwaypointtype "MOVE";
													_waypoint2 setWaypointSpeed "NORMAL";
													_waypoint2 setWaypointBehaviour "AWARE";
											};
											_x spawn
											{
												sleep 30;
												_this setVariable ["VCOMAI_MOVINGTOSUPPORT",false,false];
											};

										if (VCOMAI_AIDEBUG isEqualTo 1) then
										{
											[_x,"Warned of Combat!",120,20000] remoteExec ["VCOMAI_3DText",0];
										};

							};
						};

						};
					};
				};
			};
	} forEach _Array1;
};