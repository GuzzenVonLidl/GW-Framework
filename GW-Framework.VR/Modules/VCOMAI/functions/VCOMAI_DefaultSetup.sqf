//This sets all the default settings for the AI
_Unit = _this select 0;

_Unit addEventHandler ["Killed",{_this call VCOMAI_ClosestAllyWarn;}];
_Unit addEventHandler ["Fired",{[_this] call VCOMAI_SuppressingShots;}];
_Unit addEventHandler ["Fired",{[_this] call VCOMAI_HearingAids;}];
_Unit addEventHandler ["Hit",{_this call VCOMAI_AiHit;}];


_Unit setVariable ["VCOMAI_CHANGEDFORMATION",false,false];
_Unit setVariable ["VCOMAI_MOVINGTOSUPPORT",false,false];
_Unit setVariable ["VCOMAI_GARRISONED",false,false];
_Unit setVariable ["VCOMAI_SubLeader",false,false];
_Unit setVariable ["VCOMAI_GroupLeader",false,false];
_Unit setVariable ["VCOMAI_FLANKING",false,false];
_Unit setVariable ["VCOMAI_MovedRecently",false,false];
_Unit setVariable ["VCOMAI_MovedRecentlyCover",false,false];
_Unit setVariable ["VCOMAI_GRENADETHROWN",false,false];
_Unit setVariable ["VCOMAI_FiredTime",diag_ticktime,false];
_Unit setVariable ["VCOMAI_FiredTimeHearing",diag_ticktime,false];
_Unit setVariable ["VCOMAI_Suppressed",false,false];
_Unit setVariable ["VCOMAI_HASDEPLOYED",false,false];
_Unit setVariable ["VCOMAI_HASSTATIC",false,false];
_Unit setVariable ["VCOMAI_DiagLastCheck",diag_ticktime,false];
_Unit setVariable ["VCOMAI_HASSATCHEL",false,false];
_Unit setVariable ["VCOMAI_SATCHELRECENTLY",false,false];
_Unit setVariable ["VCOMAI_CALLEDARTILLERY",false,false];
_Unit setVariable ["VCOMAI_ISARTILLERY",false,false];
_Unit setVariable ["VCOMAI_AssignedEnemy",[0,0,0],false];
_Unit setVariable ["VCOMAI_MineObject",[],false];
_Unit setVariable ["VCOMAI_HasMine",false,false];
_Unit setVariable ["VCOMAI_PlantedMineRecently",false,false];
_Unit setVariable ["VCOMAI_ShotsFired",false,true];
_Unit setVariable ["VCOMAI_InCover",false,false];
_Unit setVariable ["VCOMAI_StaticNearby",false,false];
_Unit setVariable ["VCOMAI_VisuallyCanSee",false,false];
_Unit setVariable ["VCOMAI_HASUAV",false,false];
_Unit setVariable ["VCOMAI_ActivelyClearing",false,false];
_Unit setVariable ["VCOMAI_StartedInside",false,false];
_Unit setVariable ["VCOMAI_LastCStance",(behaviour _Unit),false];
_Unit setVariable ["VCOMAI_Unit_AIWarnDistance",VCOMAI_Unit_AIWarnDistance,false];


//Allow fleeing 1 forces the AI to RUN. Turning this to 0 makes them brave and stuff. Will have to use this somehow.
//_Unit allowfleeing 1;

//Should the AI run to support friendlies?
if (VCOMAI_NOPATHING) then
{
	_VariableCheck1 = _Unit getvariable "VCOMAI_NOPATHING_Unit";
	if (isNil "_VariableCheck1") then {_Unit setVariable ["VCOMAI_NOPATHING_Unit",true,false];};
}
else
{
	_VariableCheck1 = _Unit getvariable "VCOMAI_NOPATHING_Unit";
	if (isNil "_VariableCheck1") then {_Unit setVariable ["VCOMAI_NOPATHING_Unit",false,false];};
};